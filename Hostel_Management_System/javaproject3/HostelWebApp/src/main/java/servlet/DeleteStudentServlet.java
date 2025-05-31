package servlet;

import dao.HostelDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID"));
            HostelDAO.deleteStudent(id);

            // Redirect to DisplayStudentsServlet to refresh the student list
            response.sendRedirect("DisplayStudentsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting student: " + e.getMessage());
        }
    }
}
