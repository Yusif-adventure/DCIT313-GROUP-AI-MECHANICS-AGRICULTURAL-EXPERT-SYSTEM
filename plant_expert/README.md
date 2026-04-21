# Agricultural Expert System

This is a Prolog-based expert system for diagnosing crop diseases in maize, rice, cassava, and tomato.

## Structure

- `knowledge_base/symptoms.pl`: Contains the disease diagnosis rules based on symptoms.
- `knowledge_base/treatments.pl`: Contains treatment and prevention facts for each disease.
- `inference_engine/engine.pl`: Contains the reasoning logic for diagnosis.
- `main.pl`: Entry point that consults all modules and provides output helpers.

## Usage

Load `main.pl` in a Prolog interpreter to use the system.

Example query:
```
diagnose(maize, [yellow_leaves, stunted_growth], Disease, Treatment, Prevention).
```

This will diagnose nitrogen deficiency and provide treatment and prevention advice.