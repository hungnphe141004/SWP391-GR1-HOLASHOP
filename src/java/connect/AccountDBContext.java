/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import model.User;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GroupAccount;
import model.UserInfo;

/**
 *
 * @author PC
 */
public class AccountDBContext extends DBContext {

    public int register(User account) {
        try {
            String sql = "INSERT INTO [Users]\n"
                    + "           ([Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[email]\n"
                    + "           ,[RoleID]\n"
                    + "           ,[StatusID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,'3'\n"
                    + "           ,'1')";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUserName());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getEmail());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int insert(GroupAccount account) {
        try {
            String sql = "INSERT INTO [GroupAccount]\n"
                    + "           ([gid]\n"
                    + "           ,[username])\n"
                    + "     VALUES\n"
                    + "           ('3'\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int insertInfo(UserInfo account) {
        try {
            String sql = "INSERT INTO [UserAddress]\n"
                    + "           ([UserID])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account.getUserid());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        AccountDBContext db = new AccountDBContext();
        User u = new User();
        u.setUserName("test");
        u.setPassword("test");
        u.setEmail("test@gmail.com");
        db.register(u);
    }
}
