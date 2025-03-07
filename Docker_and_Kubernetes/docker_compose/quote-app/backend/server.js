const express = require("express");
const cors = require("cors");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(cors());

const logFilePath = path.join(__dirname, "logs", "requests.log");
fs.mkdirSync(path.dirname(logFilePath), { recursive: true });

const quotes = [
  "In the middle of every difficulty lies opportunity.",
  "So many books, so little time.",
  "Quality is more important than quantity. One home run is much better than two doubles.",
  "It’s really hard to design products by focus groups. A lot of times, people don’t know what they want until you show it to them.",
  "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work."

];

// Logging function
const logRequest = (message) => {
  const logEntry = `${new Date().toISOString()} - ${message}\n`;
  fs.appendFileSync(logFilePath, logEntry);
};

app.get("/quote", (req, res) => {
  const randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
  logRequest(`Quote sent: "${randomQuote}"`);
  res.json({ quote: randomQuote });
});

app.listen(PORT,"0.0.0.0", () => {
  console.log(`Backend is running on port ${PORT}`);
});
