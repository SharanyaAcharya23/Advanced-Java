<%@ page import="java.util.*, com.model.Student, com.dao.HostelDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eaf4ff;
        }

        .back-button {
            display: flex;
            justify-content: center;
            margin-top: 25px;
        }

        .back-button a {
            padding: 12px 25px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Hostel Students</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Room Number</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending Fees</th>
        </tr>
        <%
            HostelDAO dao = new HostelDAO();
            List<Student> students = dao.getAllStudents();
            for (Student student : students) {
        %>
        <tr>
            <td><%= student.getStudentID() %></td>
            <td><%= student.getStudentName() %></td>
            <td><%= student.getRoomNumber() %></td>
            <td><%= student.getAdmissionDate() %></td>
            <td><%= student.getFeesPaid() %></td>
            <td><%= student.getPendingFees() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <div class="back-button">
        <a href="index.jsp">Back to Home</a>
    </div>
</div>
</body>
</html>
