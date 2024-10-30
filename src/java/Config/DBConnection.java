/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

/**
 *
 * @author amali
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/petromar";
    private static final String USER = "root"; // Cambia esto por tu usuario de MySQL
    private static final String PASSWORD = ""; // Cambia esto por tu contraseña de MySQL

    public static Connection getConnection() {
        Connection connection = null;
     
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        
        return connection;
    }

    public static void closeConnection(Connection cnn) throws SQLException {
        if (cnn != null){
            cnn.close();
        }
    }
}