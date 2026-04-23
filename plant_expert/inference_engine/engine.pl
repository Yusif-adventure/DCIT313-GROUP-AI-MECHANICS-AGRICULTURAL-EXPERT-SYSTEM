% Inference Engine - Reasoning Logic

% Main Diagnosis Predicate
diagnose(Crop, Symptoms, Disease, Treatment, Prevention) :-
    disease(Crop, Symptoms, Disease),
    treatment(Disease, Treatment),
    prevention(Disease, Prevention).

diagnose(_, _, unknown_disease, "No matching disease found.", "Please check symptoms again or consult an expert.") :- !.

% Ranked diagnosis for top matches and confidence scoring
diagnose_ranked(Crop, Symptoms, PrimaryDisease, PrimaryTreatment, PrimaryPrevention, PrimaryConfidence, TopMatches) :-
    findall(
        match(Disease, Confidence, MatchedCount, RequiredCount, Treatment, Prevention),
        ranked_match(Crop, Symptoms, Disease, Confidence, MatchedCount, RequiredCount, Treatment, Prevention),
        RawMatches
    ),
    (
        RawMatches = []
    ->
        PrimaryDisease = unknown_disease,
        PrimaryTreatment = "No matching disease found.",
        PrimaryPrevention = "Please check symptoms again or consult an expert.",
        PrimaryConfidence = 0,
        TopMatches = []
    ;
        predsort(compare_matches, RawMatches, SortedMatches),
        take_first_n(3, SortedMatches, TopMatches),
        TopMatches = [match(PrimaryDisease, PrimaryConfidence, _, _, PrimaryTreatment, PrimaryPrevention) | _]
    ).

ranked_match(Crop, Symptoms, Disease, Confidence, MatchedCount, RequiredCount, Treatment, Prevention) :-
    disease_signature(Crop, Disease, RequiredSymptoms),
    sort(Symptoms, UniqueSymptoms),
    overlap_symptoms(UniqueSymptoms, RequiredSymptoms, MatchedSymptoms),
    length(MatchedSymptoms, MatchedCount),
    MatchedCount > 0,
    length(RequiredSymptoms, RequiredCount),
    length(UniqueSymptoms, ObservedCount),
    confidence_score(MatchedCount, RequiredCount, ObservedCount, Confidence),
    treatment(Disease, Treatment),
    prevention(Disease, Prevention).

overlap_symptoms(ObservedSymptoms, RequiredSymptoms, MatchedSymptoms) :-
    findall(
        Symptom,
        (member(Symptom, RequiredSymptoms), member(Symptom, ObservedSymptoms)),
        RawMatches
    ),
    sort(RawMatches, MatchedSymptoms).

confidence_score(MatchedCount, RequiredCount, ObservedCount, Confidence) :-
    Coverage is MatchedCount / RequiredCount,
    Precision is MatchedCount / ObservedCount,
    WeightedScore is ((Coverage * 0.7) + (Precision * 0.3)) * 100,
    Confidence is round(WeightedScore).

compare_matches(Order, match(_, ScoreA, MatchCountA, _, _, _), match(_, ScoreB, MatchCountB, _, _, _)) :-
    (
        ScoreA > ScoreB
    ->
        Order = '<'
    ;
        ScoreA < ScoreB
    ->
        Order = '>'
    ;
        MatchCountA > MatchCountB
    ->
        Order = '<'
    ;
        MatchCountA < MatchCountB
    ->
        Order = '>'
    ;
        Order = '='
    ).

take_first_n(0, _, []) :- !.
take_first_n(_, [], []).
take_first_n(N, [Head | Tail], [Head | Rest]) :-
    N > 0,
    NextN is N - 1,
    take_first_n(NextN, Tail, Rest).