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
import model.UserAddress;

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
    
    public static void main(String[] args) {
        UserInfoDBContext db = new UserInfoDBContext();
        ArrayList<UserAddress> u = db.getUserAddress(4);
         for (UserAddress cart: db.getUserAddress(4)) {
              System.out.println(cart.getName());
//        }
    }
    }
}
