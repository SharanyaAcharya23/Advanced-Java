package com.servlet;
import com.dao.HostelDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private HostelDAO hostelDAO;

    public void init() {
        hostelDAO = new HostelDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            boolean isSuccess = hostelDAO.deleteStudent(studentID);

            if (isSuccess) {
                request.setAttribute("message", "Student deleted successfully.");
            } else {
                request.setAttribute("message", "Failed to delete student.");
            }

            request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
        }
    }
}
