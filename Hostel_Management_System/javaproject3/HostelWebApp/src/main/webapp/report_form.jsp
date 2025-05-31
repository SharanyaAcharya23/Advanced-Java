<style>
  .report-form {
    max-width: 500px;
    margin: 40px auto;
    padding: 25px;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  .report-form h3 {
    text-align: center;
    margin-bottom: 20px;
    color: #2e86de;
  }
  .report-form label {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    font-weight: 600;
    color: #333;
    cursor: pointer;
  }
  .report-form input[type="radio"] {
    margin-right: 10px;
    cursor: pointer;
  }
  .report-form input[type="text"],
  .report-form input[type="date"] {
    margin-left: 10px;
    padding: 6px 10px;
    border: 1.5px solid #ccc;
    border-radius: 5px;
    font-size: 0.9rem;
    flex-grow: 1;
    transition: border-color 0.3s ease;
  }
  .report-form input[type="text"]:focus,
  .report-form input[type="date"]:focus {
    outline: none;
    border-color: #2e86de;
    box-shadow: 0 0 6px #2e86de;
  }
  .date-range {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-left: 28px; /* align with text input */
  }
  .report-form input[type="submit"] {
    display: block;
    margin: 25px auto 0;
    padding: 12px 35px;
    background-color: #2e86de;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  .report-form input[type="submit"]:hover {
    background-color: #1b4f72;
  }
</style>

<form class="report-form" action="ReportServlet" method="get">
  <h3>Generate Report</h3>

  <label>
    <input type="radio" name="action" value="pending" checked />
    Students with Pending Fees
  </label>

  <label>
    <input type="radio" name="action" value="room" />
    Students in a Room
    <input type="text" name="room" placeholder="Enter room number" />
  </label>

  <label>
    <input type="radio" name="action" value="date" />
    Students Admitted Between:
  </label>
  <div class="date-range">
    <label for="from" style="font-weight: normal; margin: 0;">From:</label>
    <input type="date" id="from" name="from" />
    <label for="to" style="font-weight: normal; margin: 0;">To:</label>
    <input type="date" id="to" name="to" />
  </div>

  <input type="submit" value="Generate Report" />
</form>
