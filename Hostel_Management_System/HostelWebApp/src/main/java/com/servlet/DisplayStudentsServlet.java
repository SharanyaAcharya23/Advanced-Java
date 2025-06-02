package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
public class DisplayStudentsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private HostelDAO hostelDAO;

    public void init() {
        hostelDAO = new HostelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Student> studentList = hostelDAO.getAllStudents();
            request.setAttribute("studentList", studentList);
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        }
    }
}
