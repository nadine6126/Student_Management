package student;

import db.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Score {

    Connection con = MyConnection.getConnection();
    PreparedStatement ps;

    public int getMax() {
        int id = 0;
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery("select max(id) from score");
            while (rs.next()) {
                id = rs.getInt(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id + 1;
    }

    public boolean getDetails(int sid, int semesterNo) {
        try {
            ps = con.prepareStatement("select * from course where student_id = ? and semester = ?");
            ps.setInt(1, sid);
            ps.setInt(2, semesterNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Home.jTextField11.setText(String.valueOf(rs.getInt(2)));
                Home.jTextField15.setText(String.valueOf(rs.getInt(3)));
                Home.jTextCourse1.setText(rs.getString(4));
                Home.jTextCourse2.setText(rs.getString(5));
                Home.jTextCourse3.setText(rs.getString(6));
                Home.jTextCourse4.setText(rs.getString(7));
                Home.jTextCourse5.setText(rs.getString(8));
                Home.jTextCourse6.setText(rs.getString(9));
                Home.jTextCourse7.setText(rs.getString(10));
                Home.jTextCourse8.setText(rs.getString(11));
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Student id or semester number doesn't exist");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //check score id is already exits
    public boolean isIdExist(int id) {
        try {
            ps = con.prepareStatement("select * from score where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //check whether the student id semester exist or not
    public boolean isSemesterNoExist(int sid, int semesterNo) {
        try {
            ps = con.prepareStatement("select * from score where student_id = ? and semester = ?");
            ps.setInt(1, sid);
            ps.setInt(2, semesterNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //get all the score from database score table
    public void getScoreValue(JTable table, String searchValue) {
        String sql = "select * from score where concat(id,student_id,semester) like ? order by id desc";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ResultSet rs = ps.executeQuery();
            DefaultTableModel model = (DefaultTableModel) table.getModel();
            model.setRowCount(0); 

            Object[] row;
            while (rs.next()) {
                row = new Object[20];
                row[0] = rs.getInt(1);
                row[1] = rs.getInt(2);
                row[2] = rs.getInt(3);
                row[3] = rs.getString(4);
                row[4] = rs.getDouble(5);
                row[5] = rs.getString(6);
                row[6] = rs.getDouble(7);
                row[7] = rs.getString(8);
                row[8] = rs.getDouble(9);
                row[9] = rs.getString(10);
                row[10] = rs.getDouble(11);
                row[11] = rs.getString(12);
                row[12] = rs.getDouble(13);
                row[13] = rs.getString(14);
                row[14] = rs.getDouble(15);
                row[15] = rs.getString(16);
                row[16] = rs.getDouble(17);
                row[17] = rs.getString(18);
                row[18] = rs.getDouble(19);
                row[19] = rs.getDouble(20);
                model.addRow(row);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //insert data int score table
    public void insert(int id, int sid, int semester, String course1, String course2, String course3, String course4,
            String course5, String course6, String course7, String course8, double score1, double score2, double score3, double score4, double score5,
            double score6, double score7, double score8, double average) {
        String sql = "insert into score values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, sid);
            ps.setInt(3, semester);
            ps.setString(4, course1);
            ps.setDouble(5, score1);
            ps.setString(6, course2);
            ps.setDouble(7, score2);
            ps.setString(8, course3);
            ps.setDouble(9, score3);
            ps.setString(10, course4);
            ps.setDouble(11, score4);
            ps.setString(12, course5);
            ps.setDouble(13, score5);
            ps.setString(14, course6);
            ps.setDouble(15, score6);
            ps.setString(16, course7);
            ps.setDouble(17, score7);
            ps.setString(18, course8);
            ps.setDouble(19, score8);
            ps.setDouble(20, average);
            if (ps.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Score added succesfully!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "SQL Error: " + ex.getMessage());
        }
    }

    //update Score
    public void update(int id, double score1, double score2, double score3, double score4,
                   double score5, double score6, double score7, double score8, double average) {
    String sql = "UPDATE score SET score1=?, score2=?, score3=?, score4=?, score5=?, " +
                 "score6=?, score7=?, score8=?, average=? WHERE id=?";
    try {
        ps = con.prepareStatement(sql);
        ps.setDouble(1, score1);
        ps.setDouble(2, score2);
        ps.setDouble(3, score3);
        ps.setDouble(4, score4);
        ps.setDouble(5, score5);
        ps.setDouble(6, score6);
        ps.setDouble(7, score7);
        ps.setDouble(8, score8);
        ps.setDouble(9, average);
        ps.setInt(10, id); // ini baru tempat yang benar buat id
        if (ps.executeUpdate() > 0) {
            JOptionPane.showMessageDialog(null, "Score updated successfully!");
        }
    } catch (SQLException ex) {
        Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
    }
    }
}