const form = document.getElementById("expense-form");
const tableBody = document.getElementById("expense-table-body");

// For Azure, frontend and backend are same origin, so no base URL needed
const API_BASE = "";

// Load existing expenses on page load
async function loadExpenses() {
  const res = await fetch(`${API_BASE}/api/expenses`);
  const data = await res.json();
  renderExpenses(data);
}

function renderExpenses(expenses) {
  tableBody.innerHTML = "";
  expenses.forEach((e, idx) => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${idx + 1}</td>
      <td>${e.title}</td>
      <td>${e.amount.toFixed(2)}</td>
      <td>${e.date}</td>
    `;
    tableBody.appendChild(tr);
  });
}

form.addEventListener("submit", async (e) => {
  e.preventDefault();
  const title = document.getElementById("title").value;
  const amount = document.getElementById("amount").value;
  const date = document.getElementById("date").value;

  if (!title || !amount || !date) return;

  const res = await fetch(`${API_BASE}/api/expenses`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ title, amount, date }),
  });

  if (res.ok) {
    form.reset();
    loadExpenses();
  } else {
    alert("Failed to add expense");
  }
});

// Initial load
loadExpenses();
