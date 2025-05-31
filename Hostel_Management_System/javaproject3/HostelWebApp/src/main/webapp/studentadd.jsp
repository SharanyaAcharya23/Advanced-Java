<form action="AddStudentServlet" method="post" style="max-width: 400px; margin: 40px auto; font-family: Arial, sans-serif; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
  <h2 style="text-align: center; color: #2c3e50; margin-bottom: 25px;">Add New Student</h2>

  <label for="studentID" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Student ID</label>
  <input type="text" id="studentID" name="studentID" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <label for="studentName" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Name</label>
  <input type="text" id="studentName" name="studentName" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <label for="roomNumber" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Room Number</label>
  <input type="text" id="roomNumber" name="roomNumber" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <label for="admissionDate" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Admission Date</label>
  <input type="date" id="admissionDate" name="admissionDate" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <label for="feesPaid" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Fees Paid</label>
  <input type="number" step="0.01" id="feesPaid" name="feesPaid" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 18px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <label for="pendingFees" style="display: block; margin-bottom: 6px; font-weight: bold; color: #34495e;">Pending Fees</label>
  <input type="number" step="0.01" id="pendingFees" name="pendingFees" required
         style="width: 100%; padding: 8px 12px; margin-bottom: 24px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />

  <input type="submit" value="Add Student"
         style="width: 100%; background-color: #2980b9; color: white; font-weight: 600; padding: 12px; border: none; border-radius: 6px; cursor: pointer; font-size: 16px;" />
</form>
