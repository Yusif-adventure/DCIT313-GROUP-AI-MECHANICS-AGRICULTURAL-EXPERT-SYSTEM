const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { exec } = require('child_process');
const path = require('path');

const app = express();
const port = 5000;

app.use(cors());
app.use(bodyParser.json());

// Path to Prolog logic
const PROLOG_FILE = path.join(__dirname, '..', 'prolog', 'expert_system.pl').replace(/\\/g, '/');

app.post('/api/diagnose', (req, res) => {
    const { crop, symptoms } = req.body;

    if (!crop || !symptoms || !Array.isArray(symptoms)) {
        return res.status(400).json({ error: 'Invalid input. Crop and symptoms array required.' });
    }

    // Format symptoms for Prolog list: [s1, s2, s3]
    const symptomsList = `[${symptoms.join(', ')}]`;
    
    // Construct Prolog command
    // We rely on the catch-all diagnose rule to handle cases where no disease matches.
    const goal = `consult('${PROLOG_FILE}'), diagnose(${crop}, ${symptomsList}, D, T, P), write_result(D, T, P), halt.`;
    const command = `swipl -g "${goal}"`;

    console.log(`Executing: ${command}`);

    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing Prolog: ${error}`);
            // Fallback for demo purposes if swipl is not installed or fails
            return res.json({
                disease: "Error / Simulation Mode",
                treatment: "Could not run Prolog engine. Ensure SWI-Prolog is installed and in PATH.",
                prevention: "Check server logs.",
                rawError: error.message
            });
        }

        
        
        try {
            // Find JSON-like object in the output
            const match = stdout.match(/\{.*\}/);
            if (match) {
                const result = JSON.parse(match[0]);
                res.json({
                    disease: formatString(result.disease),
                    treatment: result.treatment,
                    prevention: result.prevention,
                    explanation: result.disease === 'unknown_disease' 
                        ? "Symptoms did not match any known rules." 
                        : `The crop is ${crop} and symptoms included ${symptoms.join(', ')}.`
                });
            } else {
                res.status(500).json({ error: 'Failed to parse Prolog output', raw: stdout });
            }
        } catch (e) {
            res.status(500).json({ error: 'JSON parse error', details: e.message, raw: stdout });
        }
    });
});

function formatString(str) {
    if (!str) return '';
    // Convert snake_case to Title Case
    return str.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
