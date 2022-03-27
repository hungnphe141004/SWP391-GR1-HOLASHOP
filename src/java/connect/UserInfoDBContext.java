/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserAddress;
import model.UserInfo;

/**
 *
 * @author PC
 */
public class UserInfoDBContext extends DBContext {

    public ArrayList<UserAddress> getUserAddress(int id) {
        ArrayList<UserAddress> adds = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[ShipName]\n"
                    + "      ,[ShipAddress]\n"
                    + "      ,[ShipCityID]\n"
                    + "      ,[PhoneNum]\n"
                    + "  FROM [UserAddress] where UserId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserAddress ua = new UserAddress();
                ua.setId(rs.getString("UserID"));
                ua.setName(rs.getString("ShipName"));
                ua.setAddress(rs.getString("ShipAddress"));
                ua.setCityid(rs.getInt("ShipCityID"));
                ua.setPhonenum(rs.getString("PhoneNum"));

                adds.add(ua);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return adds;
    }

    public UserInfo getUserInfo(int id) {
        ArrayList<UserInfo> user = new ArrayList<>();
        try {
            String sql = "SELECT [Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[email]\n"
                    + "	  ,b.[ShipName]\n"
                    + "	  ,b.[ShipAddress]\n"
                    + "	  ,b.[PhoneNum]\n"
                    + "  FROM [Users] a inner join [UserAddress] b on a.[UserID] = b.[UserID]\n"
                    + "  where a.[UserID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            UserInfo s = null;
            while (rs.next()) {

                if (s == null) {
                    s = new UserInfo();
                    s.setUsername(rs.getString("Username"));
                    s.setPassword(rs.getString("Password"));
                    s.setEmail(rs.getString("email"));
                    s.setShipname(rs.getString("ShipName"));
                    s.setShipaddress(rs.getString("ShipAddress"));
                    s.setPhone(rs.getString("PhoneNum"));

                }

            }
            return s;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateAccount(UserInfo acc) {
        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [Password] = ?\n"
                    + "      ,[email] = ?\n"
                    + " WHERE [UserId] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc.getPassword());
            stm.setString(2, acc.getEmail());
            stm.setInt(3, acc.getUserid());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateInfo(UserAddress info) {
        try {
            String sql = "UPDATE [UserAddress]\n"
                    + "   SET [ShipName] = ?\n"
                    + "      ,[ShipAddress] = ?\n"
                    + "      ,[PhoneNum] = ?\n"
                    + " WHERE [UserID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, info.getName());
            stm.setString(2, info.getAddress());
            stm.setString(3, info.getPhonenum());
            stm.setInt(4, info.getUserid());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        UserInfoDBContext db = new UserInfoDBContext();
//        ArrayList<UserAddress> u = db.getUserAddress(4);
//        for (UserAddress cart : db.getUserAddress(4)) {
//            System.out.println(cart.getName());
//        }
        UserAddress a = new UserAddress();
        a.setName("xue");
        a.setAddress("sao hoa");
        a.setPhonenum("11111111");
        a.setUserid(3);
        db.updateInfo(a);

    }
}
