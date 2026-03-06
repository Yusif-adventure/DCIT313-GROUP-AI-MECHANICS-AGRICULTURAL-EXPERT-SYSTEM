% Crop Disease Diagnosis System
% Knowledge Base

% Maize Diseases
disease(maize, Symptoms, nitrogen_deficiency) :-
    member(yellow_leaves, Symptoms),
    member(stunted_growth, Symptoms).

disease(maize, Symptoms, maize_streak_virus) :-
    member(streak_patterns, Symptoms),
    member(chlorosis, Symptoms).

disease(maize, Symptoms, fall_armyworm) :-
    member(ragged_leaves, Symptoms),
    member(sawdust_frass, Symptoms).

disease(maize, Symptoms, gray_leaf_spot) :-
    member(gray_rectangular_lesions, Symptoms),
    member(blight, Symptoms).

disease(maize, Symptoms, northern_corn_leaf_blight) :-
    member(cigar_shaped_lesions, Symptoms),
    member(gray_green_lesions, Symptoms).

disease(maize, Symptoms, stalk_rot) :-
    member(rotting_stalk, Symptoms),
    member(premature_death, Symptoms).

% Rice Diseases
disease(rice, Symptoms, rice_blast) :-
    member(diamond_shaped_lesions, Symptoms),
    member(white_center_spots, Symptoms).

disease(rice, Symptoms, bacterial_leaf_blight) :-
    member(water_soaked_streaks, Symptoms),
    member(yellow_orange_leaves, Symptoms).

disease(rice, Symptoms, sheath_blight) :-
    member(oval_spots_on_sheath, Symptoms),
    member(irregular_borders, Symptoms).

disease(rice, Symptoms, brown_spot) :-
    member(brown_circular_spots, Symptoms),
    member(yellow_halo_spots, Symptoms).

disease(rice, Symptoms, tungro_virus) :-
    member(stunted_plants, Symptoms),
    member(yellow_orange_discoloration, Symptoms).

disease(rice, Symptoms, stem_borer) :-
    member(deadheart, Symptoms),
    member(whitehead, Symptoms).


% Cassava Diseases
disease(cassava, Symptoms, cassava_mosaic_disease) :-
    member(mosaic_pattern, Symptoms),
    member(distorted_leaves, Symptoms).

disease(cassava, Symptoms, cassava_brown_streak_disease) :-
    member(yellow_chlorosis_veins, Symptoms),
    member(brown_streaks_on_stem, Symptoms).

disease(cassava, Symptoms, bacterial_blight) :-
    member(water_soaked_spots, Symptoms),
    member(leaf_blight_wilting, Symptoms).

disease(cassava, Symptoms, root_rot) :-
    member(soft_rotting_roots, Symptoms),
    member(foul_smell, Symptoms).

disease(cassava, Symptoms, green_mite) :-
    member(yellow_speckles, Symptoms),
    member(reduced_leaf_size, Symptoms).

disease(cassava, Symptoms, mealybug) :-
    member(curled_distorted_leaves, Symptoms),
    member(white_waxy_substance, Symptoms).


% Tomato Diseases
disease(tomato, Symptoms, early_blight) :-
    member(concentric_rings, Symptoms),
    member(lower_leaves_yellowing, Symptoms).

disease(tomato, Symptoms, late_blight) :-
    member(water_soaked_lesions, Symptoms),
    member(white_fungal_growth, Symptoms).

disease(tomato, Symptoms, bacterial_wilt) :-
    member(sudden_wilting, Symptoms),
    member(no_yellowing, Symptoms).

disease(tomato, Symptoms, tomato_yellow_leaf_curl_virus) :-
    member(upward_curling_leaves, Symptoms),
    member(yellow_leaf_margins, Symptoms).

disease(tomato, Symptoms, blossom_end_rot) :-
    member(black_leather_spot_bottom, Symptoms),
    member(calcium_deficiency_signs, Symptoms).

disease(tomato, Symptoms, septoria_leaf_spot) :-
    member(small_circular_spots, Symptoms),
    member(gray_white_center_spots, Symptoms).


% Treatments
treatment(nitrogen_deficiency, "Apply nitrogen-rich fertilizer like urea or ammonium nitrate.").
treatment(maize_streak_virus, "Use resistant maize varieties and control leafhopper vectors.").
treatment(fall_armyworm, "Apply appropriate pesticides or use biological control agents like wasps.").
treatment(gray_leaf_spot, "Use fungicides and practice crop rotation.").
treatment(northern_corn_leaf_blight, "Plant resistant hybrids and manage crop residue.").
treatment(stalk_rot, "Ensure good drainage and balanced fertilization.").

treatment(rice_blast, "Use fungicides like tricyclazole and avoid excessive nitrogen.").
treatment(bacterial_leaf_blight, "Use resistant varieties and avoid field flooding.").
treatment(sheath_blight, "Apply fungicides and avoid overcrowding plants.").
treatment(brown_spot, "Improve soil fertility with potassium and silicon.").
treatment(tungro_virus, "Control green leafhoppers and remove infected plants.").
treatment(stem_borer, "Use pheromone traps and apply systemic insecticides.").

treatment(cassava_mosaic_disease, "Use disease-free cuttings and resistant varieties.").
treatment(cassava_brown_streak_disease, "Plant certified disease-free stem cuttings.").
treatment(bacterial_blight, "Prune infected parts and use copper-based bactericides.").
treatment(root_rot, "Improve soil drainage and harvest early in wet seasons.").
treatment(green_mite, "Introduce natural predators like predatory mites.").
treatment(mealybug, "Use biological control (parasitic wasps) or dip cuttings in insecticide.").

treatment(early_blight, "Apply copper-based fungicides and remove infected leaves.").
treatment(late_blight, "Use fungicides like chlorothalonil and destroy infected plants.").
treatment(bacterial_wilt, "Practice crop rotation and use resistant varieties (no chemical cure).").
treatment(tomato_yellow_leaf_curl_virus, "Control whitefly populations and use resistant varieties.").
treatment(blossom_end_rot, "Maintain consistent watering and apply calcium fertilizer.").
treatment(septoria_leaf_spot, "Remove lower leaves and apply fungicide.").

% Default
treatment(unknown_disease, "Consult an agricultural expert directly for lab analysis.").

% Preventive Advice
prevention(nitrogen_deficiency, "Regularly test soil nutrient levels.").
prevention(maize_streak_virus, "Remove grass weeds that host the virus.").
prevention(fall_armyworm, "Monitor fields early for egg masses.").
prevention(gray_leaf_spot, "Plow under crop residue to reduce fungal spores.").
prevention(northern_corn_leaf_blight, "Rotate crops with non-host plants.").
prevention(stalk_rot, "Avoid high plant density.").

prevention(rice_blast, "Plant seeds treated with fungicides.").
prevention(bacterial_leaf_blight, "Keep fields clean from weed hosts.").
prevention(sheath_blight, "Use balanced fertilization (N-P-K).").
prevention(brown_spot, "Ensure proper water management.").
prevention(tungro_virus, "Practice synchronous planting.").
prevention(stem_borer, "Destroy stubble after harvest.").

prevention(cassava_mosaic_disease, "Rogue out infected plants immediately.").
prevention(cassava_brown_streak_disease, "Quarantine movement of infected material.").
prevention(bacterial_blight, "Use clean tools during pruning.").
prevention(root_rot, "Plant on ridges or mounds.").
prevention(green_mite, "Encourage natural enemies.").
prevention(mealybug, "Inspect cuttings before planting.").

prevention(early_blight, "Mulch soil to prevent spores splashing.").
prevention(late_blight, "Ensure good air circulation.").
prevention(bacterial_wilt, "Solarize soil before planting.").
prevention(tomato_yellow_leaf_curl_virus, "Use reflective mulches to repel whiteflies.").
prevention(blossom_end_rot, "Avoid water stress or enhancing calcium.").
prevention(septoria_leaf_spot, "Water at the base, not overhead.").

prevention(unknown_disease, "Practice general crop hygiene and monitoring.").

% Main Diagnosis Predicate
diagnose(Crop, Symptoms, Disease, Treatment, Prevention) :-
    disease(Crop, Symptoms, Disease),
    treatment(Disease, Treatment),
    prevention(Disease, Prevention).

diagnose(_, _, unknown_disease, "No matching disease found.", "Please check symptoms again or consult an expert.") :- !.

% JSON Output Helper
write_result(Disease, Treatment, Prevention) :-
    format('{ "disease": "~w", "treatment": "~w", "prevention": "~w" }', [Disease, Treatment, Prevention]).
