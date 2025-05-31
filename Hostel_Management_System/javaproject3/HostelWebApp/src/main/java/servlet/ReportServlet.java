package servlet;

import dao.HostelDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Student> list = new ArrayList<>();

        try {
            if (action == null) {
                request.setAttribute("error", "Action parameter is missing.");
            } else {
                switch (action) {
                    case "pending":
                        list = HostelDAO.getStudentsWithPendingFees();
                        break;
                    case "room":
                        String room = request.getParameter("room");
                        list = HostelDAO.getStudentsInRoom(room);
                        break;
                    case "date":
                        Date from = Date.valueOf(request.getParameter("from"));
                        Date to = Date.valueOf(request.getParameter("to"));
                        list = HostelDAO.getStudentsInDateRange(from, to);
                        break;
                    default:
                        request.setAttribute("error", "Unknown action: " + action);
                }
            }
            request.setAttribute("reportList", list);
            RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report: " + e.getMessage());
        }
    }
}
