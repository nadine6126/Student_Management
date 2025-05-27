
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {

    private static final String username = "root";
    private static final String password = "nadine061206";
    private static final String dataConn = "jdbc:mysql://localhost:3306/students_management?serverTimezone=UTC";
    private static Connection con;

    public static Connection getConnection() {
        if (con == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(dataConn, username, password);
                System.out.println("Database Connected.");
            } catch (ClassNotFoundException | SQLException ex) {
                System.out.println("Connection Failed:");
                ex.printStackTrace();  // Tampilkan stack trace lengkap
            }
        }
        return con;
    }
}

