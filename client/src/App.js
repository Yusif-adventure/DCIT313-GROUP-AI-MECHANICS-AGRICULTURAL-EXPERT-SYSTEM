import React, { useState } from 'react';
import DiagnoseForm from './components/DiagnoseForm'; // We'll create this next
import ResultsDisplay from './components/ResultsDisplay'; // And this
import './App.css';

function App() {
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleDiagnosis = async (crop, symptoms) => {
    setLoading(true);
    setError(null);
    setResult(null);

    try {
      const response = await fetch('http://localhost:5000/api/diagnose', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ crop, symptoms }),
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const data = await response.json();
      setResult(data);
    } catch (err) {
      console.error(err);
      setError('Failed to connect to the diagnosis server. Is the backend running?');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="App">
      <h1>Agricultural Expert System</h1>
      <DiagnoseForm onDiagnose={handleDiagnosis} loading={loading} />
      
      {error && <div className="error" style={{color: 'red', marginTop: '20px'}}>{error}</div>}
      
      {result && <ResultsDisplay result={result} />}
    </div>
  );
}

export default App;
