<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Monitoring</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
 
    <label for="month-select">Select a month:</label>
  <select id="month-select"></select>
  <br>
  <label for="quantity-sold">Quantity sold:</label>
  <span id="quantity-sold"></span>

  <script>
    const salesData = [
      { date: '2022-01-01', quantity: 100 },
      { date: '2022-02-01', quantity: 200 },
      { date: '2022-03-01', quantity: 150 },
      { date: '2022-04-01', quantity: 300 },
      { date: '2022-05-01', quantity: 250 },
      { date: '2022-06-01', quantity: 400 },
      { date: '2022-07-01', quantity: 350 },
      { date: '2022-08-01', quantity: 500 },
      { date: '2022-09-01', quantity: 450 },
      { date: '2022-10-01', quantity: 600 },
      { date: '2022-11-01', quantity: 550 },
      { date: '2022-12-01', quantity: 700 },
    ];

    const monthSelect = document.getElementById('month-select');
    const quantitySold = document.getElementById('quantity-sold');

    // Create an array of all unique months in the sales data
    const months = [...new Set(salesData.map(sale => sale.date.slice(0, 7)))];

    months.forEach(month => {
      const option = document.createElement('option');
      option.value = month;
      option.text = month;
      monthSelect.add(option);
    });

    monthSelect.addEventListener('change', event => {
      const selectedMonth = event.target.value;
      const salesInMonth = salesData.filter(sale => sale.date.startsWith(selectedMonth));
      const totalQuantity = salesInMonth.reduce((acc, sale) => acc + sale.quantity, 0);
      quantitySold.textContent = totalQuantity;
    });
  </script>
  
</body>
</html>