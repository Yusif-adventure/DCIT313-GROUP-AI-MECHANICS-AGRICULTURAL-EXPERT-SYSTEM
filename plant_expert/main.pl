% Agricultural Expert System - Main Entry Point

:- consult('knowledge_base/symptoms.pl').
:- consult('knowledge_base/treatments.pl').
:- consult('inference_engine/engine.pl').

% JSON Output Helper
write_result(Disease, Treatment, Prevention) :-
    format('{ "disease": "~w", "treatment": "~w", "prevention": "~w" }', [Disease, Treatment, Prevention]).