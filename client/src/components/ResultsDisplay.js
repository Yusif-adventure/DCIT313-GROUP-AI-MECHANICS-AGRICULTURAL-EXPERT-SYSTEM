import React from 'react';

function ResultsDisplay({ result }) {
    if (!result) return null;

    const confidence = Number.isFinite(result.confidence) ? result.confidence : null;
    const topMatches = Array.isArray(result.topMatches) ? result.topMatches : [];
    const alternativeMatches = topMatches.slice(1);

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

            {confidence !== null && (
                <div className="result-item">
                    <strong>Confidence Score:</strong>
                    {confidence}%
                </div>
            )}
            
            {result.explanation && (
                <div className="result-item">
                    <strong>Reasoning:</strong>
                    {result.explanation}
                </div>
            )}

            {alternativeMatches.length > 0 && (
                <div className="result-item">
                    <strong>Alternative Matches:</strong>
                    <ul className="alt-matches">
                        {alternativeMatches.map((match, index) => (
                            <li key={`${match.disease}-${index}`}>
                                <span className="alt-disease">{match.disease}</span>
                                <span className="alt-confidence">({match.confidence}%)</span>
                            </li>
                        ))}
                    </ul>
                </div>
            )}
        </div>
    );
}

export default ResultsDisplay;
