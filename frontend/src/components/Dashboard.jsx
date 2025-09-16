import React, { useEffect, useState } from "react";

function Dashboard() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("/api/summary")
      .then(res => res.json())
      .then(setData);
  }, []);

  return (
    <div style={{ padding: "2rem" }}>
      <h3>Business Overview</h3>
      {data ? (
        <ul>
          <li>Revenue: 💰 {data.revenue}</li>
          <li>Expenses: 🧾 {data.expenses}</li>
          <li>Profit: 📈 {data.profit}</li>
        </ul>
      ) : (
        <p>Loading financial data...</p>
      )}
    </div>
  );
}

export default Dashboard;
 