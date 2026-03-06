import React from 'react';

function ResultsDisplay({ result }) {
    if (!result) return null;

    return (
        <div className="results">
            <h2>Diagnosis Result</h2>
            
            <div className="result-item">
                <strong>Disease Identified:</strong>
                {result.disease}
            </div>
            
            <div className="result-item">
                <strong>Recommended Treatment:</strong>
                {result.treatment}
            </div>
            
            <div className="result-item">
                <strong>Preventive Advice:</strong>
                {result.prevention}
            </div>
            
            {result.explanation && (
                <div className="result-item">
                    <strong>Reasoning:</strong>
                    {result.explanation}
                </div>
            )}
        </div>
    );
}

export default ResultsDisplay;
