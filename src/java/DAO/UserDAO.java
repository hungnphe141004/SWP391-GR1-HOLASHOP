/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ASUS
 */
public class UserDAO extends DBContext{
    public void register(User model) {

        try {
            String sql = "INSERT INTO [Users]\n"
                   
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                     + "           ,?\n"
                     + "           ,3\n"
                    + "           ,1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUserNamme());
             stm.setString(2, model.getPassword());
            stm.setString(3, model.getEmail());
          
           
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    public ArrayList<User> getUserList() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String url = "SELECT Username,Password,email FROM [Users]";
            PreparedStatement stm = connection.prepareStatement(url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserNamme(rs.getString("Username"));
                 u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("email"));
               
               
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;

    }
}
