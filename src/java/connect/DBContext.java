/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mr D
 */
public class DBContext {
    
    public Connection connection;
    public DBContext()
    {
        try {
            String username = "sa";
            String pass = "123@123a";
            String url = "jdbc:sqlserver://LAPTOP-550DG89Q\\SQLEXPRESS:1433;databaseName=HOLASHOP2";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
    }
    
}
