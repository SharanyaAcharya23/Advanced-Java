<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 25px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            border-radius: 10px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background-color: #e74c3c;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c0392b;
        }
        .message {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Delete Student</h2>
    <div class="form-container">
        <form action="DeleteStudentServlet" method="post">
            <label for="studentID">Enter Student ID to Delete:</label>
            <input type="number" id="studentID" name="studentID" required>

            <input type="submit" value="Delete Student">
        </form>

        <div class="message">
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.print(message);
                }
            %>
        </div>
    </div>

    <div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
        <a href="index.jsp" style="display:inline-block; padding:10px 20px; background-color:#007bff; color:white; text-decoration:none; border-radius:5px; font-size:16px; font-weight:bold;">Back to Home</a>
    </div>
</body>
</html>
