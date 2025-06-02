<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #004080;
            --secondary-color: #007acc;
            --background-color: #f0f4f8;
            --button-color: #004080;
            --button-hover: #0059b3;
            --text-color: #333;
            --card-bg: #ffffff;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0ecff, #f0f4f8);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: var(--card-bg);
            padding: 40px 60px;
            border-radius: 16px;
            box-shadow: 0 8px 24px var(--shadow);
            text-align: center;
            max-width: 650px;
            width: 90%;
        }

        h1 {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        a.button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
            background-color: var(--button-color);
            color: #fff;
            padding: 14px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        a.button:hover {
            background-color: var(--button-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        @media (min-width: 600px) {
            .button-container {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
            }

            a.button {
                flex: 1 1 45%;
                margin: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏨 Hostel Management System</h1>
        <div class="button-container">
            <a href="studentadd.jsp" class="button"><i class="fas fa-user-plus"></i> Add Student</a>
            <a href="studentupdate.jsp" class="button"><i class="fas fa-user-edit"></i> Update Student</a>
            <a href="studentdelete.jsp" class="button"><i class="fas fa-user-minus"></i> Delete Student</a>
            <a href="studentdisplay.jsp" class="button"><i class="fas fa-users"></i> View All Students</a>
            <a href="report_form.jsp" class="button"><i class="fas fa-file-alt"></i> Generate Report</a>
        </div>
    </div>
</body>
</html>
