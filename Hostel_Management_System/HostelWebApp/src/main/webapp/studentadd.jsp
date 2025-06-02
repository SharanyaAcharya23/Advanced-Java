<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            color: #000;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            margin-top: 40px;
            font-size: 2em;
            color: #333;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            margin-top: 20px;
            width: 100%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 2px 2px 15px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #444;
        }

        input[type="text"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background-color: #000;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #333;
            transform: scale(1.02);
        }

        .message {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: 500;
        }

        .back-link {
            margin: 30px 0;
        }

        .back-link a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #000;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1em;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .back-link a:hover {
            background-color: #333;
            transform: scale(1.05);
        }
    </style>

    <script>
    function validateForm() {
        const studentID = document.getElementById('studentID').value.trim();
        const studentName = document.getElementById('studentName').value.trim();
        const feesPaid = document.getElementById('feesPaid').value.trim();
        const pendingFees = document.getElementById('pendingFees').value.trim();
        const roomno = document.getElementById('roomNumber').value.trim();

        if (!studentID || isNaN(studentID) || parseInt(studentID) <= 0) {
            alert("Student ID must be a positive integer.");
            return false;
        }
        if (!roomno || isNaN(roomno) || parseInt(roomno) <= 0) {
            alert("Room Number is Invalid.");
            return false;
        }

        // Name must contain only alphabets and spaces
        if (!/^[a-zA-Z\s]+$/.test(studentName)) {
            alert("Student Name can only contain alphabets and spaces, no numbers or special characters.");
            return false;
        }

        if (feesPaid === "" || isNaN(feesPaid) || parseFloat(feesPaid) < 0) {
            alert("Fees Paid must be a non-negative number.");
            return false;
        }

        if (pendingFees === "" || isNaN(pendingFees) || parseFloat(pendingFees) < 0) {
            alert("Pending Fees must be a non-negative number.");
            return false;
        }

        return true; // allow form submission
    }
</script>

</head>
<body>
    <h2>Add New Student</h2>
    <div class="form-container">
        <form action="StudentAddServlet" method="post" onsubmit="return validateForm();">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required>

            <label for="studentName">Full Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required>

            <label for="admissionDate">Admission Date:</label>
            <input type="date" id="admissionDate" name="admissionDate" required>

            <label for="feesPaid">Fees Paid:</label>
            <input type="number" step="0.01" id="feesPaid" name="feesPaid" required>

            <label for="pendingFees">Pending Fees:</label>
            <input type="number" step="0.01" id="pendingFees" name="pendingFees" required>

            <input type="submit" value="Add Student">
        </form>

        <%
            String msg = (String) request.getAttribute("message");
            if (msg != null) {
        %>
            <div class="message"><%= msg %></div>
        <%
            }
        %>
    </div>

    <div class="back-link">
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
