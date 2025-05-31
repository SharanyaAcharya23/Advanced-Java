package dao;

import model.Student;
import java.sql.*;
import java.sql.Date;
import java.util.*;

public class HostelDAO {
    // JDBC configuration
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hosteldb?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "root";        // Change as per your DB
    private static final String JDBC_PASSWORD = "";        // Change as per your DB

    // Load the JDBC driver (once)
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Important for JDBC to find the MySQL driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Get connection
    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    // Add student
    public static void addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO HostelStudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, s.getStudentID());
            stmt.setString(2, s.getStudentName());
            stmt.setString(3, s.getRoomNumber());
            stmt.setDate(4, s.getAdmissionDate());
            stmt.setDouble(5, s.getFeesPaid());
            stmt.setDouble(6, s.getPendingFees());
            stmt.executeUpdate();
        }
    }

    // Update student
    public static void updateStudent(Student s) throws SQLException {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, s.getStudentName());
            stmt.setString(2, s.getRoomNumber());
            stmt.setDate(3, s.getAdmissionDate());
            stmt.setDouble(4, s.getFeesPaid());
            stmt.setDouble(5, s.getPendingFees());
            stmt.setInt(6, s.getStudentID());
            stmt.executeUpdate();
        }
    }

    // Delete student
    public static void deleteStudent(int id) throws SQLException {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Get all students
    public static List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapRowToStudent(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get students with pending fees
    public static List<Student> getStudentsWithPendingFees() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapRowToStudent(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get students in a room
    public static List<Student> getStudentsInRoom(String roomNumber) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, roomNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRowToStudent(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get students in a date range
    public static List<Student> getStudentsInDateRange(Date from, Date to) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, from);
            stmt.setDate(2, to);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRowToStudent(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Map result set to Student object
    private static Student mapRowToStudent(ResultSet rs) throws SQLException {
        return new Student(
                rs.getInt("StudentID"),
                rs.getString("StudentName"),
                rs.getString("RoomNumber"),
                rs.getDate("AdmissionDate"),
                rs.getDouble("FeesPaid"),
                rs.getDouble("PendingFees")
        );
    }
}
