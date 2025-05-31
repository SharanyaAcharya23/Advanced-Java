<form action="DeleteStudentServlet" method="post" 
      style="max-width: 350px; margin: 50px auto; font-family: Arial, sans-serif; background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
  <h2 style="text-align: center; color: #c0392b; margin-bottom: 25px;">Delete Student</h2>
  
  <label for="studentID" style="display: block; margin-bottom: 8px; font-weight: bold; color: #7f8c8d;">Student ID to Delete</label>
  <input type="text" id="studentID" name="studentID" required
         style="width: 100%; padding: 10px 12px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;" />
  
  <input type="submit" value="Delete Student"
         style="width: 100%; background-color: #e74c3c; color: white; font-weight: 600; padding: 12px; border: none; border-radius: 6px; cursor: pointer; font-size: 16px;" />
</form>
