% Inference Engine - Reasoning Logic

% Main Diagnosis Predicate
diagnose(Crop, Symptoms, Disease, Treatment, Prevention) :-
    disease(Crop, Symptoms, Disease),
    treatment(Disease, Treatment),
    prevention(Disease, Prevention).

diagnose(_, _, unknown_disease, "No matching disease found.", "Please check symptoms again or consult an expert.") :- !.