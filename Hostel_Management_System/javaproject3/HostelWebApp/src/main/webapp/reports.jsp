<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>Reports</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #eef2f7;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      color: #333;
    }
    .container {
      background: white;
      padding: 40px 60px;
      border-radius: 10px;
      box-shadow: 0 6px 15px rgba(0,0,0,0.1);
      text-align: center;
      width: 320px;
    }
    h2 {
      color: #2c3e50;
      margin-bottom: 30px;
      font-weight: 700;
      letter-spacing: 1.1px;
    }
    ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    ul li {
      margin: 15px 0;
    }
    a {
      display: inline-block;
      text-decoration: none;
      background-color: #2980b9;
      color: white;
      padding: 12px 28px;
      border-radius: 6px;
      font-weight: 600;
      transition: background-color 0.3s ease;
    }
    a:hover {
      background-color: #1c5980;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Reports Menu</h2>
    <ul>
      <li><a href="report_form.jsp">Generate Reports</a></li>
    </ul>
  </div>
</body>
</html>
