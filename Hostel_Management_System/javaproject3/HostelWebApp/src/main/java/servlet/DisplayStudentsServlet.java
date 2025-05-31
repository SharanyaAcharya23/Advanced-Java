package servlet;

import dao.HostelDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;
import java.util.List;

public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = HostelDAO.getAllStudents();
        request.setAttribute("studentList", students);
        RequestDispatcher rd = request.getRequestDispatcher("studentdisplay.jsp");
        rd.forward(request, response);
    }
}
