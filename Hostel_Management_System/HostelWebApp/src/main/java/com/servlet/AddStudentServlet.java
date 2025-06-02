package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/StudentAddServlet")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HostelDAO hostelDAO;

    public void init() {
        hostelDAO = new HostelDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorMessage = null;

        try {
            String studentIDStr = request.getParameter("studentID");
            String studentName = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");
            String admissionDateStr = request.getParameter("admissionDate");
            String feesPaidStr = request.getParameter("feesPaid");
            String pendingFeesStr = request.getParameter("pendingFees");

            // Validate StudentID
            int studentID = 0;
            try {
                studentID = Integer.parseInt(studentIDStr);
                if (studentID <= 0) {
                    errorMessage = "Student ID must be a positive integer.";
                }
            } catch (NumberFormatException e) {
                errorMessage = "Invalid Student ID format.";
            }

            // Validate StudentName (at least one alphabet character)
            if (errorMessage == null && (studentName == null || !studentName.matches(".*[a-zA-Z]+.*"))) {
                errorMessage = "Student name must contain at least one alphabet character.";
            }

            // Validate FeesPaid
            double feesPaid = 0;
            try {
                feesPaid = Double.parseDouble(feesPaidStr);
                if (feesPaid < 0) {
                    errorMessage = "Fees Paid cannot be negative.";
                }
            } catch (NumberFormatException e) {
                errorMessage = "Invalid Fees Paid value.";
            }

            // Validate PendingFees
            double pendingFees = 0;
            try {
                pendingFees = Double.parseDouble(pendingFeesStr);
                if (pendingFees < 0) {
                    errorMessage = "Pending Fees cannot be negative.";
                }
            } catch (NumberFormatException e) {
                errorMessage = "Invalid Pending Fees value.";
            }

            if (errorMessage != null) {
                request.setAttribute("message", errorMessage);
                request.getRequestDispatcher("studentadd.jsp").forward(request, response);
                return; // stop processing
            }

            // Parse admission date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date admissionDate = sdf.parse(admissionDateStr);

            Student student = new Student(studentID, studentName, roomNumber, admissionDate, feesPaid, pendingFees);
            boolean isSuccess = hostelDAO.addStudent(student);

            if (isSuccess) {
                request.setAttribute("message", "Student added successfully.");
            } else {
                request.setAttribute("message", "Failed to add student.");
            }

            request.getRequestDispatcher("studentadd.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("studentadd.jsp").forward(request, response);
        }
    }
}
