<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            max-width: 500px;
            background-color: #fff;
            padding: 30px 40px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #333;
        }

        select, input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 6px;
            box-sizing: border-box;
            transition: border 0.3s ease;
        }

        select:focus, input:focus {
            border-color: #28a745;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .hidden {
            display: none;
        }
    </style>
    <script>
        function toggleFields() {
            const reportType = document.getElementById("reportType").value;
            document.getElementById("roomFields").classList.add("hidden");
            document.getElementById("dateFields").classList.add("hidden");

            if (reportType === "roomNumber") {
                document.getElementById("roomFields").classList.remove("hidden");
            } else if (reportType === "admissionDate") {
                document.getElementById("dateFields").classList.remove("hidden");
            }
        }
    </script>
</head>
<body>
    <h2>Generate Student Report</h2>
    <form action="report" method="get">
        <label for="reportType">Select Report Type:</label>
        <select name="reportType" id="reportType" onchange="toggleFields()" required>
            <option value="">--Select--</option>
            <option value="pendingFees">Students with Pending Fees</option>
            <option value="roomNumber">Students by Room Number</option>
            <option value="admissionDate">Students by Admission Date Range</option>
        </select>

        <div id="roomFields" class="hidden">
            <label for="roomNumber">Room Number:</label>
            <input type="text" name="roomNumber" id="roomNumber">
        </div>

        <div id="dateFields" class="hidden">
            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" id="startDate">

            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" id="endDate">
        </div>

        <input type="submit" value="Generate Report">
    </form>
</body>
</html>
