<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Result</title>
    <style>
        /* Reset some basic styles */
        body, h2, p, table {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f9fafb;
            padding: 40px 20px;
            color: #333;
        }
        h2 {
            margin-bottom: 20px;
            color: #222;
            text-align: center;
            font-weight: 700;
            font-size: 2em;
        }
        .message {
            color: #d9534f; /* bootstrap danger red */
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 12px 20px;
            margin-bottom: 25px;
            border-radius: 6px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 600;
            text-align: center;
        }
        table {
            border-collapse: separate;
            border-spacing: 0 12px;
            width: 100%;
            max-width: 900px;
            margin: 0 auto 40px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
            font-size: 1em;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
        }
        tr {
            transition: background-color 0.3s ease;
        }
        tr:hover {
            background-color: #f1f5fb;
        }
        td {
            border-bottom: 1px solid #e1e8f0;
            color: #555;
        }
        /* Last row no border */
        tr:last-child td {
            border-bottom: none;
        }
        /* Back to home button */
        .btn-back {
            display: inline-block;
            padding: 14px 30px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0,123,255,0.4);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            margin: 0 auto;
        }
        .btn-back:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0,86,179,0.6);
        }
        /* Container to center button */
        .btn-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>${reportTitle}</h2>

    <c:if test="${not empty message}">
        <p class="message">${message}</p>
    </c:if>

    <c:if test="${not empty students}">
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
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.studentID}</td>
                        <td>${student.studentName}</td>
                        <td>${student.roomNumber}</td>
                        <td><fmt:formatDate value="${student.admissionDate}" pattern="yyyy-MM-dd" /></td>
                        <td>${student.feesPaid}</td>
                        <td>${student.pendingFees}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="btn-container">
        <a href="index.jsp" class="btn-back">Back to Home</a>
    </div>
</body>
</html>
