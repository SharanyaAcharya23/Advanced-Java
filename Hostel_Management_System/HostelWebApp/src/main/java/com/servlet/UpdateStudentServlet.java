package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HostelDAO hostelDAO;

    public void init() {
        hostelDAO = new HostelDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            String studentName = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");
            String admissionDateStr = request.getParameter("admissionDate");
            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date admissionDate = sdf.parse(admissionDateStr);

            Student student = new Student(studentID, studentName, roomNumber, admissionDate, feesPaid, pendingFees);
            boolean isSuccess = hostelDAO.updateStudent(student);

            if (isSuccess) {
                request.setAttribute("message", "Student updated successfully.");
            } else {
                request.setAttribute("message", "Failed to update student.");
            }

            request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
        }
    }
}
