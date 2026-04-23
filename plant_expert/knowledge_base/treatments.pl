% Treatments
:- discontiguous treatment/2.
:- discontiguous prevention/2.

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

% Treatments and preventions for additional diseases with complex logic

treatment(potential_nutrient_issue, "Test soil for nutrient levels and apply balanced fertilizer.").
treatment(potential_blast_or_spot, "Apply appropriate fungicide and improve field drainage.").
treatment(mosaic_without_streaks, "Use virus-resistant varieties and control whitefly vectors.").
treatment(potential_blight, "Apply copper-based fungicide and ensure proper plant spacing.").

prevention(potential_nutrient_issue, "Regular soil testing and proper fertilization schedule.").
prevention(potential_blast_or_spot, "Avoid overhead irrigation and use disease-free seeds.").
prevention(mosaic_without_streaks, "Inspect plants regularly and remove infected ones.").
prevention(potential_blight, "Mulch around plants and avoid working with wet foliage.").