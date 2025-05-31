package servlet;

import dao.HostelDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID"));
            String name = request.getParameter("studentName");
            String room = request.getParameter("roomNumber");
            Date date = Date.valueOf(request.getParameter("admissionDate"));
            double paid = Double.parseDouble(request.getParameter("feesPaid"));
            double pending = Double.parseDouble(request.getParameter("pendingFees"));

            Student student = new Student(id, name, room, date, paid, pending);
            HostelDAO.addStudent(student);

            response.sendRedirect("DisplayStudentsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
