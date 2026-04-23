% Agricultural Expert System - Main Entry Point

:- use_module(library(http/json)).

:- consult('knowledge_base/symptoms.pl').
:- consult('knowledge_base/treatments.pl').
:- consult('inference_engine/engine.pl').

% JSON Output Helper
write_result(Disease, Treatment, Prevention) :-
    json_write_dict(current_output, _{
        disease: Disease,
        treatment: Treatment,
        prevention: Prevention
    }).

write_ranked_result(Disease, Treatment, Prevention, Confidence, TopMatches) :-
    maplist(match_to_dict, TopMatches, TopMatchDicts),
    json_write_dict(current_output, _{
        disease: Disease,
        treatment: Treatment,
        prevention: Prevention,
        confidence: Confidence,
        topMatches: TopMatchDicts
    }).

match_to_dict(match(Disease, Confidence, MatchedSymptoms, TotalSymptoms, Treatment, Prevention), _{
    disease: Disease,
    confidence: Confidence,
    matchedSymptoms: MatchedSymptoms,
    totalSymptoms: TotalSymptoms,
    treatment: Treatment,
    prevention: Prevention
}).