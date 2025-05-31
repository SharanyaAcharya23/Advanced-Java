<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Report Results</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f7fa;
      margin: 40px;
      color: #333;
    }
    h2 {
      text-align: center;
      color: #2e86de;
      margin-bottom: 30px;
    }
    table {
      width: 90%;
      margin: 0 auto 40px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      background-color: #fff;
      border-radius: 8px;
      overflow: hidden;
    }
    th, td {
      padding: 12px 18px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #2e86de;
      color: white;
      font-weight: 600;
      letter-spacing: 0.05em;
    }
    tr:hover {
      background-color: #f1f8ff;
    }
    tr:last-child td {
      border-bottom: none;
    }
    @media (max-width: 600px) {
      table, thead, tbody, th, td, tr {
        display: block;
      }
      th {
        position: sticky;
        top: 0;
        background-color: #2e86de;
        color: white;
      }
      tr {
        margin-bottom: 15px;
      }
      td {
        text-align: right;
        padding-left: 50%;
        position: relative;
      }
      td::before {
        content: attr(data-label);
        position: absolute;
        left: 15px;
        width: 45%;
        padding-left: 15px;
        font-weight: 600;
        text-align: left;
        color: #555;
      }
    }
  </style>
</head>
<body>
  <h2>Report Results</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th><th>Name</th><th>Room</th><th>Date</th><th>Paid</th><th>Pending</th>
      </tr>
    </thead>
    <tbody>
    <%
      List<Student> list = (List<Student>)request.getAttribute("reportList");
      if (list != null && !list.isEmpty()) {
          for(Student s : list) {
    %>
      <tr>
        <td data-label="ID"><%= s.getStudentID() %></td>
        <td data-label="Name"><%= s.getStudentName() %></td>
        <td data-label="Room"><%= s.getRoomNumber() %></td>
        <td data-label="Date"><%= s.getAdmissionDate() %></td>
        <td data-label="Paid"><%= s.getFeesPaid() %></td>
        <td data-label="Pending"><%= s.getPendingFees() %></td>
      </tr>
    <%
          }
      } else {
    %>
      <tr><td colspan="6" style="text-align:center; padding: 20px; color: #777;">No records found.</td></tr>
    <%
      }
    %>
    </tbody>
  </table>
</body>
</html>
