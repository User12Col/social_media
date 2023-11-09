/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP ADMIN
 */
public class ConnnectDatabase {
    static Connection con;
    public static Connection getConnection(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String conStr = "jdbc:sqlserver://localhost:1433;databaseName=Test";
            con = DriverManager.getConnection(conStr, "sa", "123456789");
            return con;
        } catch (Exception ex) {
            Logger.getLogger(ConnnectDatabase.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
            
}
