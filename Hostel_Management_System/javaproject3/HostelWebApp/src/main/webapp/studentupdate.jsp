<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Update Student</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #eef2f7;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 40px 20px;
    margin: 0;
    color: #333;
  }
  form {
    background: #fff;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 450px;
  }
  form h2 {
    margin-bottom: 25px;
    color: #2c3e50;
    font-weight: 700;
    text-align: center;
  }
  label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
  }
  input[type="text"],
  input[type="date"] {
    width: 100%;
    padding: 10px 12px;
    margin-bottom: 20px;
    border: 1.8px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
    transition: border-color 0.3s ease;
  }
  input[type="text"]:focus,
  input[type="date"]:focus {
    border-color: #3498db;
    outline: none;
  }
  input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #3498db;
    color: white;
    font-weight: 700;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #217dbb;
  }
</style>
</head>
<body>
  <form action="UpdateStudentServlet" method="post">
    <h2>Update Student</h2>
    <label for="studentID">Student ID (for update):</label>
    <input type="text" id="studentID" name="studentID" required />

    <label for="studentName">Name:</label>
    <input type="text" id="studentName" name="studentName" required />

    <label for="roomNumber">Room Number:</label>
    <input type="text" id="roomNumber" name="roomNumber" required />

    <label for="admissionDate">Admission Date:</label>
    <input type="date" id="admissionDate" name="admissionDate" required />

    <label for="feesPaid">Fees Paid:</label>
    <input type="text" id="feesPaid" name="feesPaid" required />

    <label for="pendingFees">Pending Fees:</label>
    <input type="text" id="pendingFees" name="pendingFees" required />

    <input type="submit" value="Update Student" />
  </form>
</body>
</html>
