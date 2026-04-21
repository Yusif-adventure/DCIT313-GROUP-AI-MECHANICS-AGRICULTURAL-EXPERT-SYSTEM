% Crop Disease Diagnosis System
% Knowledge Base - Symptoms and Diseases

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

% Additional logic conditions with disjunction (or) and negation (not)

% Example: Disease diagnosed with symptom A and (B or C), but not D
disease(maize, Symptoms, potential_nutrient_issue) :-
    member(yellow_leaves, Symptoms),
    (member(stunted_growth, Symptoms); member(chlorosis, Symptoms)),
    \+ member(rotting_stalk, Symptoms).

% Example: Disease with or conditions for multiple symptom combinations
disease(rice, Symptoms, potential_blast_or_spot) :-
    member(diamond_shaped_lesions, Symptoms),
    (member(white_center_spots, Symptoms); member(brown_circular_spots, Symptoms)).

% Example: Disease requiring absence of certain symptoms
disease(cassava, Symptoms, mosaic_without_streaks) :-
    member(mosaic_pattern, Symptoms),
    member(distorted_leaves, Symptoms),
    \+ member(brown_streaks_on_stem, Symptoms).

% Example: Complex condition with multiple ors
disease(tomato, Symptoms, potential_blight) :-
    (member(concentric_rings, Symptoms); member(water_soaked_lesions, Symptoms)),
    (member(lower_leaves_yellowing, Symptoms); member(white_fungal_growth, Symptoms)).