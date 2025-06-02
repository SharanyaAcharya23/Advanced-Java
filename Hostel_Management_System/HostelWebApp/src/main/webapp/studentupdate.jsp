<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 550px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 18px;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: black;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
        }

        .message {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: bold;
        }

        .back-link {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .back-link a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-link a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Student</h2>
    <form action="UpdateStudentServlet" method="post">
        <label for="studentID">Student ID:</label>
        <input type="number" id="studentID" name="studentID" required>

        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required>

        <label for="roomNumber">Room Number:</label>
        <input type="text" id="roomNumber" name="roomNumber" required>

        <label for="admissionDate">Admission Date:</label>
        <input type="date" id="admissionDate" name="admissionDate" required>

        <label for="feesPaid">Fees Paid:</label>
        <input type="number" step="0.01" id="feesPaid" name="feesPaid" required>

        <label for="pendingFees">Pending Fees:</label>
        <input type="number" step="0.01" id="pendingFees" name="pendingFees" required>

        <input type="submit" class="btn" value="Update Student">
    </form>

    <div class="message">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.print(message);
            }
        %>
    </div>

    <div class="back-link">
        <a href="index.jsp">Back to Home</a>
    </div>
</div>
</body>
</html>
