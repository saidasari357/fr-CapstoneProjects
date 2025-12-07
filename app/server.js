const express = require("express");
const path = require("path");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

// In-memory "database" (for learning)
// When app restarts, data resets – that’s ok for demo.
let expenses = [];
let nextId = 1;

app.use(cors());
app.use(express.json());

// Serve static frontend files
app.use(express.static(path.join(__dirname, "public")));

// API: Get all expenses
app.get("/api/expenses", (req, res) => {
  res.json(expenses);
});

// API: Add new expense
app.post("/api/expenses", (req, res) => {
  const { title, amount, date } = req.body;

  if (!title || !amount || !date) {
    return res.status(400).json({ message: "title, amount, date are required" });
  }

  const expense = {
    id: nextId++,
    title,
    amount: parseFloat(amount),
    date
  };

  expenses.push(expense);
  res.status(201).json(expense);
});

// Health check
app.get("/health", (req, res) => {
  res.send("OK");
});

app.listen(PORT, () => {
  console.log(`Expense Recorder running on port ${PORT}`);
});
