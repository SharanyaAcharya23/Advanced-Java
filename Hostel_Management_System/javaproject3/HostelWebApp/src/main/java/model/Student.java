package model;

import java.sql.Date;

/**
 * Represents a student living in a hostel.
 */
public class Student {
    private int studentID;
    private String studentName;
    private String roomNumber;
    private Date admissionDate;
    private double feesPaid;
    private double pendingFees;

    // Default constructor (important for some Java frameworks)
    public Student() {
    }

    // Parameterized constructor
    public Student(int studentID, String studentName, String roomNumber, Date admissionDate, double feesPaid, double pendingFees) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.roomNumber = roomNumber;
        this.admissionDate = admissionDate;
        this.feesPaid = feesPaid;
        this.pendingFees = pendingFees;
    }

    // Getters
    public int getStudentID() {
        return studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public double getFeesPaid() {
        return feesPaid;
    }

    public double getPendingFees() {
        return pendingFees;
    }

    // Setters
    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public void setFeesPaid(double feesPaid) {
        this.feesPaid = feesPaid;
    }

    public void setPendingFees(double pendingFees) {
        this.pendingFees = pendingFees;
    }

    // toString (useful for debugging)
    @Override
    public String toString() {
        return "Student{" +
                "studentID=" + studentID +
                ", studentName='" + studentName + '\'' +
                ", roomNumber='" + roomNumber + '\'' +
                ", admissionDate=" + admissionDate +
                ", feesPaid=" + feesPaid +
                ", pendingFees=" + pendingFees +
                '}';
    }
}
