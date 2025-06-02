package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        String roomNumber = request.getParameter("roomNumber");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        HostelDAO hostelDAO = new HostelDAO();
        List<Student> resultList = new ArrayList<>();
        String reportTitle = "";

        try {
            switch (reportType) {
                case "pendingFees":
                    resultList = hostelDAO.getStudentsWithPendingFees();
                    reportTitle = "Students with Pending Fees";
                    break;

                case "roomNumber":
                    if (roomNumber == null || roomNumber.trim().isEmpty()) {
                        request.setAttribute("message", "Room number is required for this report.");
                        request.getRequestDispatcher("report_result.jsp").forward(request, response);
                        return;
                    }
                    resultList = hostelDAO.getStudentsByRoom(roomNumber);
                    reportTitle = "Students in Room: " + roomNumber;
                    break;

                case "admissionDate":
                    if (startDateStr == null || endDateStr == null ||
                            startDateStr.isEmpty() || endDateStr.isEmpty()) {
                        request.setAttribute("message", "Start date and end date are required for this report.");
                        request.getRequestDispatcher("report_result.jsp").forward(request, response);
                        return;
                    }

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date start = sdf.parse(startDateStr);
                    Date end = sdf.parse(endDateStr);
                    java.sql.Date startDate = new java.sql.Date(start.getTime());
                    java.sql.Date endDate = new java.sql.Date(end.getTime());

                    resultList = hostelDAO.getStudentsByDateRange(startDate, endDate);
                    reportTitle = "Students admitted between " + startDateStr + " and " + endDateStr;
                    break;

                default:
                    request.setAttribute("message", "Invalid report type selected.");
                    request.getRequestDispatcher("report_result.jsp").forward(request, response);
                    return;
            }

            request.setAttribute("students", resultList);
            request.setAttribute("reportTitle", reportTitle);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
