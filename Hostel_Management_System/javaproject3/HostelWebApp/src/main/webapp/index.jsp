<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Hostel Management System</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 0;
      color: #333;
    }
    header {
      background-color: #2e86de;
      padding: 20px;
      text-align: center;
      color: white;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    header h1 {
      margin: 0;
      font-size: 2.5rem;
      letter-spacing: 1px;
    }
    nav {
      background-color: #ffffff;
      max-width: 600px;
      margin: 30px auto;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      padding: 25px;
    }
    nav ul {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    nav ul li {
      margin: 0;
    }
    nav ul li a {
      display: block;
      text-decoration: none;
      background-color: #2e86de;
      color: white;
      padding: 12px 20px;
      font-weight: 600;
      border-radius: 6px;
      text-align: center;
      transition: background-color 0.3s ease;
    }
    nav ul li a:hover {
      background-color: #1b4f72;
    }
    @media (min-width: 480px) {
      nav ul {
        flex-direction: row;
        justify-content: space-between;
      }
      nav ul li a {
        padding: 12px 25px;
      }
    }
  </style>
</head>
<body>
  <header>
    <h1>Hostel Management System</h1>
  </header>
  <nav>
    <ul>
      <li><a href="studentadd.jsp">Add Student</a></li>
      <li><a href="studentupdate.jsp">Update Student</a></li>
      <li><a href="studentdelete.jsp">Delete Student</a></li>
      <li><a href="DisplayStudentsServlet">Display Students</a></li>
      <li><a href="report_form.jsp">Generate Report</a></li>
    </ul>
  </nav>
</body>
</html>
