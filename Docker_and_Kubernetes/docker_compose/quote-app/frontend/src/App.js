import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";


function App() {
  const [quote, setQuote] = useState("");

  const API_URL = "REACT_APP_API_URL_PLACEHOLDER";
  console.log("API URL: ", API_URL);

  const getQuote = async () => {
    const response = await fetch(`${API_URL}/quote`);
    const data = await response.json();
    setQuote(data.quote);
  };

  return (
    <div className="container text-center mt-5">
      <h2 className="mb-4">Random Quote Generator</h2>
      <button className="btn btn-primary mb-3" onClick={getQuote}>
        Get Quote
      </button>
      <p className="alert alert-info">{quote}</p>
    </div>
  );
}

export default App;
