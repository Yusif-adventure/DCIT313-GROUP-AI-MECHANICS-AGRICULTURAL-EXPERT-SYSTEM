% Crop Disease Diagnosis System
% Knowledge Base - Symptoms and Diseases

:- discontiguous disease/3.
:- discontiguous disease_signature/3.

% Maize Diseases
disease(maize, Symptoms, nitrogen_deficiency) :-
    member(yellow_leaves, Symptoms),
    member(stunted_growth, Symptoms).
disease_signature(maize, nitrogen_deficiency, [yellow_leaves, stunted_growth]).

disease(maize, Symptoms, maize_streak_virus) :-
    member(streak_patterns, Symptoms),
    member(chlorosis, Symptoms).
disease_signature(maize, maize_streak_virus, [streak_patterns, chlorosis]).

disease(maize, Symptoms, fall_armyworm) :-
    member(ragged_leaves, Symptoms),
    member(sawdust_frass, Symptoms).
disease_signature(maize, fall_armyworm, [ragged_leaves, sawdust_frass]).

disease(maize, Symptoms, gray_leaf_spot) :-
    member(gray_rectangular_lesions, Symptoms),
    member(blight, Symptoms).
disease_signature(maize, gray_leaf_spot, [gray_rectangular_lesions, blight]).

disease(maize, Symptoms, northern_corn_leaf_blight) :-
    member(cigar_shaped_lesions, Symptoms),
    member(gray_green_lesions, Symptoms).
disease_signature(maize, northern_corn_leaf_blight, [cigar_shaped_lesions, gray_green_lesions]).

disease(maize, Symptoms, stalk_rot) :-
    member(rotting_stalk, Symptoms),
    member(premature_death, Symptoms).
disease_signature(maize, stalk_rot, [rotting_stalk, premature_death]).

% Rice Diseases
disease(rice, Symptoms, rice_blast) :-
    member(diamond_shaped_lesions, Symptoms),
    member(white_center_spots, Symptoms).
disease_signature(rice, rice_blast, [diamond_shaped_lesions, white_center_spots]).

disease(rice, Symptoms, bacterial_leaf_blight) :-
    member(water_soaked_streaks, Symptoms),
    member(yellow_orange_leaves, Symptoms).
disease_signature(rice, bacterial_leaf_blight, [water_soaked_streaks, yellow_orange_leaves]).

disease(rice, Symptoms, sheath_blight) :-
    member(oval_spots_on_sheath, Symptoms),
    member(irregular_borders, Symptoms).
disease_signature(rice, sheath_blight, [oval_spots_on_sheath, irregular_borders]).

disease(rice, Symptoms, brown_spot) :-
    member(brown_circular_spots, Symptoms),
    member(yellow_halo_spots, Symptoms).
disease_signature(rice, brown_spot, [brown_circular_spots, yellow_halo_spots]).

disease(rice, Symptoms, tungro_virus) :-
    member(stunted_plants, Symptoms),
    member(yellow_orange_discoloration, Symptoms).
disease_signature(rice, tungro_virus, [stunted_plants, yellow_orange_discoloration]).

disease(rice, Symptoms, stem_borer) :-
    member(deadheart, Symptoms),
    member(whitehead, Symptoms).
disease_signature(rice, stem_borer, [deadheart, whitehead]).


% Cassava Diseases
disease(cassava, Symptoms, cassava_mosaic_disease) :-
    member(mosaic_pattern, Symptoms),
    member(distorted_leaves, Symptoms).
disease_signature(cassava, cassava_mosaic_disease, [mosaic_pattern, distorted_leaves]).

disease(cassava, Symptoms, cassava_brown_streak_disease) :-
    member(yellow_chlorosis_veins, Symptoms),
    member(brown_streaks_on_stem, Symptoms).
disease_signature(cassava, cassava_brown_streak_disease, [yellow_chlorosis_veins, brown_streaks_on_stem]).

disease(cassava, Symptoms, bacterial_blight) :-
    member(water_soaked_spots, Symptoms),
    member(leaf_blight_wilting, Symptoms).
disease_signature(cassava, bacterial_blight, [water_soaked_spots, leaf_blight_wilting]).

disease(cassava, Symptoms, root_rot) :-
    member(soft_rotting_roots, Symptoms),
    member(foul_smell, Symptoms).
disease_signature(cassava, root_rot, [soft_rotting_roots, foul_smell]).

disease(cassava, Symptoms, green_mite) :-
    member(yellow_speckles, Symptoms),
    member(reduced_leaf_size, Symptoms).
disease_signature(cassava, green_mite, [yellow_speckles, reduced_leaf_size]).

disease(cassava, Symptoms, mealybug) :-
    member(curled_distorted_leaves, Symptoms),
    member(white_waxy_substance, Symptoms).
disease_signature(cassava, mealybug, [curled_distorted_leaves, white_waxy_substance]).


% Tomato Diseases
disease(tomato, Symptoms, early_blight) :-
    member(concentric_rings, Symptoms),
    member(lower_leaves_yellowing, Symptoms).
disease_signature(tomato, early_blight, [concentric_rings, lower_leaves_yellowing]).

disease(tomato, Symptoms, late_blight) :-
    member(water_soaked_lesions, Symptoms),
    member(white_fungal_growth, Symptoms).
disease_signature(tomato, late_blight, [water_soaked_lesions, white_fungal_growth]).

disease(tomato, Symptoms, bacterial_wilt) :-
    member(sudden_wilting, Symptoms),
    member(no_yellowing, Symptoms).
disease_signature(tomato, bacterial_wilt, [sudden_wilting, no_yellowing]).

disease(tomato, Symptoms, tomato_yellow_leaf_curl_virus) :-
    member(upward_curling_leaves, Symptoms),
    member(yellow_leaf_margins, Symptoms).
disease_signature(tomato, tomato_yellow_leaf_curl_virus, [upward_curling_leaves, yellow_leaf_margins]).

disease(tomato, Symptoms, blossom_end_rot) :-
    member(black_leather_spot_bottom, Symptoms),
    member(calcium_deficiency_signs, Symptoms).
disease_signature(tomato, blossom_end_rot, [black_leather_spot_bottom, calcium_deficiency_signs]).

disease(tomato, Symptoms, septoria_leaf_spot) :-
    member(small_circular_spots, Symptoms),
    member(gray_white_center_spots, Symptoms).
disease_signature(tomato, septoria_leaf_spot, [small_circular_spots, gray_white_center_spots]).

% Additional logic conditions with disjunction (or) and negation (not)

% Example: Disease diagnosed with symptom A and (B or C), but not D
disease(maize, Symptoms, potential_nutrient_issue) :-
    member(yellow_leaves, Symptoms),
    (member(stunted_growth, Symptoms); member(chlorosis, Symptoms)),
    \+ member(rotting_stalk, Symptoms).
disease_signature(maize, potential_nutrient_issue, [yellow_leaves, stunted_growth, chlorosis]).

% Example: Disease with or conditions for multiple symptom combinations
disease(rice, Symptoms, potential_blast_or_spot) :-
    member(diamond_shaped_lesions, Symptoms),
    (member(white_center_spots, Symptoms); member(brown_circular_spots, Symptoms)).
disease_signature(rice, potential_blast_or_spot, [diamond_shaped_lesions, white_center_spots, brown_circular_spots]).

% Example: Disease requiring absence of certain symptoms
disease(cassava, Symptoms, mosaic_without_streaks) :-
    member(mosaic_pattern, Symptoms),
    member(distorted_leaves, Symptoms),
    \+ member(brown_streaks_on_stem, Symptoms).
disease_signature(cassava, mosaic_without_streaks, [mosaic_pattern, distorted_leaves]).

% Example: Complex condition with multiple ors
disease(tomato, Symptoms, potential_blight) :-
    (member(concentric_rings, Symptoms); member(water_soaked_lesions, Symptoms)),
    (member(lower_leaves_yellowing, Symptoms); member(white_fungal_growth, Symptoms)).
disease_signature(tomato, potential_blight, [concentric_rings, water_soaked_lesions, lower_leaves_yellowing, white_fungal_growth]).