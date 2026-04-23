const express = require('express');
const cors = require('cors');
const { execFile } = require('child_process');
const { promisify } = require('util');
const path = require('path');

const app = express();
const port = process.env.PORT || 5000;
const execFileAsync = promisify(execFile);

const PROLOG_TIMEOUT_MS = 8000;
const MAX_SYMPTOMS = 20;

// Use the modular Prolog entrypoint as the runtime diagnosis engine.
const PROLOG_FILE = path.join(__dirname, '..', 'plant_expert', 'main.pl');

const SYMPTOMS_BY_CROP = {
    maize: [
        'yellow_leaves',
        'stunted_growth',
        'streak_patterns',
        'chlorosis',
        'ragged_leaves',
        'sawdust_frass',
        'gray_rectangular_lesions',
        'blight',
        'cigar_shaped_lesions',
        'gray_green_lesions',
        'rotting_stalk',
        'premature_death'
    ],
    rice: [
        'diamond_shaped_lesions',
        'white_center_spots',
        'water_soaked_streaks',
        'yellow_orange_leaves',
        'oval_spots_on_sheath',
        'irregular_borders',
        'brown_circular_spots',
        'yellow_halo_spots',
        'stunted_plants',
        'yellow_orange_discoloration',
        'deadheart',
        'whitehead'
    ],
    cassava: [
        'mosaic_pattern',
        'distorted_leaves',
        'yellow_chlorosis_veins',
        'brown_streaks_on_stem',
        'water_soaked_spots',
        'leaf_blight_wilting',
        'soft_rotting_roots',
        'foul_smell',
        'yellow_speckles',
        'reduced_leaf_size',
        'curled_distorted_leaves',
        'white_waxy_substance'
    ],
    tomato: [
        'concentric_rings',
        'lower_leaves_yellowing',
        'water_soaked_lesions',
        'white_fungal_growth',
        'sudden_wilting',
        'no_yellowing',
        'upward_curling_leaves',
        'yellow_leaf_margins',
        'black_leather_spot_bottom',
        'calcium_deficiency_signs',
        'small_circular_spots',
        'gray_white_center_spots'
    ]
};

const CROP_SET = new Set(Object.keys(SYMPTOMS_BY_CROP));
const SYMPTOM_SET_BY_CROP = Object.fromEntries(
    Object.entries(SYMPTOMS_BY_CROP).map(([crop, symptomList]) => [crop, new Set(symptomList)])
);

app.use(cors());
app.use(express.json());

app.get('/api/health', (_req, res) => {
    res.json({
        status: 'ok',
        engine: 'swipl',
        prologEntryPoint: path.relative(process.cwd(), PROLOG_FILE).replace(/\\/g, '/'),
        timestamp: new Date().toISOString()
    });
});

app.post('/api/diagnose', async (req, res) => {
    const validation = validateDiagnosisInput(req.body);

    if (!validation.ok) {
        return res.status(400).json({
            error: validation.error,
            details: validation.details
        });
    }

    const { crop, symptoms } = validation.value;

    try {
        const result = await runPrologDiagnosis(crop, symptoms);
        const confidence = Number.isFinite(result.confidence) ? result.confidence : 0;
        const topMatches = normalizeTopMatches(result.topMatches);

        return res.json({
            disease: formatString(result.disease),
            treatment: result.treatment,
            prevention: result.prevention,
            confidence,
            topMatches,
            explanation: buildExplanation(result.disease, confidence, crop, symptoms)
        });
    } catch (error) {
        return handleDiagnosisError(error, res);
    }
});

function validateDiagnosisInput(payload) {
    if (!payload || typeof payload !== 'object') {
        return {
            ok: false,
            error: 'Invalid input.',
            details: 'Request body must be a JSON object.'
        };
    }

    const crop = typeof payload.crop === 'string' ? payload.crop.trim().toLowerCase() : '';
    if (!CROP_SET.has(crop)) {
        return {
            ok: false,
            error: 'Invalid crop provided.',
            details: `Supported crops: ${Array.from(CROP_SET).join(', ')}`
        };
    }

    if (!Array.isArray(payload.symptoms)) {
        return {
            ok: false,
            error: 'Invalid symptoms provided.',
            details: 'Symptoms must be an array of strings.'
        };
    }

    if (payload.symptoms.length === 0) {
        return {
            ok: false,
            error: 'At least one symptom is required.',
            details: 'Select one or more symptoms before diagnosis.'
        };
    }

    const normalizedSymptoms = [];
    const seenSymptoms = new Set();

    for (const symptomValue of payload.symptoms) {
        if (typeof symptomValue !== 'string') {
            return {
                ok: false,
                error: 'Invalid symptom format.',
                details: 'Each symptom must be a string value.'
            };
        }

        const symptom = symptomValue.trim().toLowerCase();
        if (!symptom || !/^[a-z_]+$/.test(symptom)) {
            return {
                ok: false,
                error: 'Invalid symptom format.',
                details: 'Symptoms must be non-empty snake_case strings.'
            };
        }

        if (!seenSymptoms.has(symptom)) {
            seenSymptoms.add(symptom);
            normalizedSymptoms.push(symptom);
        }
    }

    if (normalizedSymptoms.length > MAX_SYMPTOMS) {
        return {
            ok: false,
            error: 'Too many symptoms provided.',
            details: `Maximum allowed symptoms per request is ${MAX_SYMPTOMS}.`
        };
    }

    const allowedSymptoms = SYMPTOM_SET_BY_CROP[crop];
    const invalidSymptoms = normalizedSymptoms.filter((symptom) => !allowedSymptoms.has(symptom));

    if (invalidSymptoms.length > 0) {
        return {
            ok: false,
            error: 'Unsupported symptom(s) for selected crop.',
            details: `Invalid symptoms: ${invalidSymptoms.join(', ')}`
        };
    }

    return {
        ok: true,
        value: {
            crop,
            symptoms: normalizedSymptoms
        }
    };
}

async function runPrologDiagnosis(crop, symptoms) {
    // Validated symptom atoms are safe to use directly in the Prolog list.
    const symptomsList = `[${symptoms.join(', ')}]`;
    const goal = `diagnose_ranked(${crop}, ${symptomsList}, D, T, P, C, Top), write_ranked_result(D, T, P, C, Top), halt.`;

    const { stdout, stderr } = await execFileAsync(
        'swipl',
        ['-q', '-f', 'none', '-s', PROLOG_FILE, '-g', goal],
        {
            timeout: PROLOG_TIMEOUT_MS,
            windowsHide: true,
            maxBuffer: 1024 * 1024
        }
    );

    if (stderr && stderr.trim()) {
        console.warn(`Prolog stderr: ${stderr.trim()}`);
    }

    return parsePrologJson(stdout);
}

function parsePrologJson(output) {
    const jsonStart = output.indexOf('{');
    const jsonEnd = output.lastIndexOf('}');

    if (jsonStart === -1 || jsonEnd === -1 || jsonEnd <= jsonStart) {
        throw new Error('Could not parse diagnosis output from Prolog.');
    }

    return JSON.parse(output.slice(jsonStart, jsonEnd + 1));
}

function normalizeTopMatches(topMatches) {
    if (!Array.isArray(topMatches)) {
        return [];
    }

    return topMatches.map((match) => ({
        disease: formatString(match?.disease || ''),
        confidence: Number.isFinite(match?.confidence) ? match.confidence : 0,
        matchedSymptoms: Number.isFinite(match?.matchedSymptoms) ? match.matchedSymptoms : 0,
        totalSymptoms: Number.isFinite(match?.totalSymptoms) ? match.totalSymptoms : 0,
        treatment: match?.treatment || '',
        prevention: match?.prevention || ''
    }));
}

function buildExplanation(disease, confidence, crop, symptoms) {
    if (disease === 'unknown_disease') {
        return 'Symptoms did not match any known rules. Try selecting additional symptoms.';
    }

    if (confidence >= 80) {
        return `High confidence diagnosis for ${formatString(crop)} based on ${symptoms.length} selected symptom${symptoms.length === 1 ? '' : 's'}.`;
    }

    if (confidence >= 50) {
        return `Moderate confidence diagnosis for ${formatString(crop)}. Consider reviewing alternative matches.`;
    }

    return `Low confidence diagnosis for ${formatString(crop)}. Add more symptoms to improve accuracy.`;
}

function handleDiagnosisError(error, res) {
    const timedOut = error.killed || error.signal === 'SIGTERM' || /timed out/i.test(error.message || '');

    if (error.code === 'ENOENT') {
        return res.status(503).json({
            error: 'SWI-Prolog executable not found.',
            details: 'Install SWI-Prolog and ensure swipl is available in PATH.'
        });
    }

    if (timedOut) {
        return res.status(504).json({
            error: 'Diagnosis timed out.',
            details: `The Prolog engine did not respond within ${PROLOG_TIMEOUT_MS}ms.`
        });
    }

    console.error('Diagnosis error:', error);
    return res.status(500).json({
        error: 'Failed to run diagnosis engine.',
        details: process.env.NODE_ENV === 'production' ? undefined : error.message
    });
}

function formatString(str) {
    if (!str) return '';
    return str
        .split('_')
        .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');
}

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
