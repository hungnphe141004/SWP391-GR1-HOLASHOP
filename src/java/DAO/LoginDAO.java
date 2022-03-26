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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feature;
import model.User;

/**
 *
 * @author ASUS
 */
public class LoginDAO extends DBContext {

    public User getAccountByUserAndPass(String username, String password) {
        try {
            String sql = "select u.UserID, u.Username, u.Password, u.email, u.RoleID,\n"
                    + "f.fid, f.url\n"
                    + "from Users u left join GroupAccount ga on u.Username = ga.username\n"
                    + "left join [Role] r on r.RoleID = ga.gid\n"
                    + "left join [GroupFeature] gf on gf.gid = r.RoleID\n"
                    + "left join [Feature] f on f.fid = gf.fid\n"
                    + "where u.Username = ? and u.Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            User user = null;
            while(rs.next())
            {
                if(user == null){
                user = new User();
                user.setUserName(username);
                user.setPassword(password);
                user.setId(Integer.parseInt(rs.getString("UserID")));
                user.setRole(Integer.parseInt(rs.getString("RoleID")));
                }
                int fid = rs.getInt("fid");
                if(fid !=0)
                {
                    Feature f = new Feature();
                    f.setId(fid);
                    f.setUrl(rs.getString("url"));
                    user.getFeatures().add(f);
                }
            }
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
