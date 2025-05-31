<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Student List</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f7fa;
      margin: 40px;
      color: #333;
    }
    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
      font-weight: 700;
    }
    table {
      border-collapse: collapse;
      width: 90%;
      margin: 0 auto;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      background: #fff;
      border-radius: 8px;
      overflow: hidden;
    }
    th, td {
      text-align: center;
      padding: 12px 18px;
      border-bottom: 1px solid #ddd;
      font-size: 15px;
    }
    th {
      background-color: #3498db;
      color: white;
      text-transform: uppercase;
      letter-spacing: 0.1em;
    }
    tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tr:hover {
      background-color: #d1e7fd;
    }
    @media (max-width: 768px) {
      body {
        margin: 20px 10px;
      }
      table {
        width: 100%;
      }
      th, td {
        padding: 10px 8px;
        font-size: 13px;
      }
    }
  </style>
</head>
<body>
  <h2>Student List</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Room</th>
        <th>Admission Date</th>
        <th>Fees Paid</th>
        <th>Pending Fees</th>
      </tr>
    </thead>
    <tbody>
      <%
          List<Student> list = (List<Student>) request.getAttribute("studentList");
          if (list != null && !list.isEmpty()) {
              for (Student s : list) {
      %>
      <tr>
        <td><%= s.getStudentID() %></td>
        <td><%= s.getStudentName() %></td>
        <td><%= s.getRoomNumber() %></td>
        <td><%= s.getAdmissionDate() %></td>
        <td><%= s.getFeesPaid() %></td>
        <td><%= s.getPendingFees() %></td>
      </tr>
      <%
              }
          } else {
      %>
      <tr>
        <td colspan="6" style="text-align:center; padding: 20px; color: #777;">
          No students found.
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
</body>
</html>
