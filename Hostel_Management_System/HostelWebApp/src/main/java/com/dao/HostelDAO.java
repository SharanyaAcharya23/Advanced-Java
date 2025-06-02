package com.dao;
import com.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class HostelDAO {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3307/hostelstudents";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    // Load JDBC Driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
    }

    public boolean addStudent(Student student) {
        String sql = "INSERT INTO HostelStudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, student.getStudentID());
            stmt.setString(2, student.getStudentName());
            stmt.setString(3, student.getRoomNumber());
            stmt.setDate(4, new java.sql.Date(student.getAdmissionDate().getTime()));
            stmt.setDouble(5, student.getFeesPaid());
            stmt.setDouble(6, student.getPendingFees());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateStudent(Student student) {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getStudentName());
            stmt.setString(2, student.getRoomNumber());
            stmt.setDate(3, new java.sql.Date(student.getAdmissionDate().getTime()));
            stmt.setDouble(4, student.getFeesPaid());
            stmt.setDouble(5, student.getPendingFees());
            stmt.setInt(6, student.getStudentID());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteStudent(int studentID) {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Student getStudentByID(int studentID) {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                student.setRoomNumber(rs.getString("RoomNumber"));
                student.setAdmissionDate(rs.getDate("AdmissionDate"));
                student.setFeesPaid(rs.getDouble("FeesPaid"));
                student.setPendingFees(rs.getDouble("PendingFees"));
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                student.setRoomNumber(rs.getString("RoomNumber"));
                student.setAdmissionDate(rs.getDate("AdmissionDate"));
                student.setFeesPaid(rs.getDouble("FeesPaid"));
                student.setPendingFees(rs.getDouble("PendingFees"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getStudentsWithPendingFees() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                student.setRoomNumber(rs.getString("RoomNumber"));
                student.setAdmissionDate(rs.getDate("AdmissionDate"));
                student.setFeesPaid(rs.getDouble("FeesPaid"));
                student.setPendingFees(rs.getDouble("PendingFees"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getStudentsByRoom(String roomNumber) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber=?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, roomNumber);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                student.setRoomNumber(rs.getString("RoomNumber"));
                student.setAdmissionDate(rs.getDate("AdmissionDate"));
                student.setFeesPaid(rs.getDouble("FeesPaid"));
                student.setPendingFees(rs.getDouble("PendingFees"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getStudentsByDateRange(Date startDate, Date endDate) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, new java.sql.Date(startDate.getTime()));
            stmt.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                student.setRoomNumber(rs.getString("RoomNumber"));
                student.setAdmissionDate(rs.getDate("AdmissionDate"));
                student.setFeesPaid(rs.getDouble("FeesPaid"));
                student.setPendingFees(rs.getDouble("PendingFees"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
