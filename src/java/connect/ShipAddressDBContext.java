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
import model.ShipAddress;

/**
 *
 * @author PC
 */
public class ShipAddressDBContext extends DBContext {

    public ArrayList<ShipAddress> getAddress() {
        ArrayList<ShipAddress> adds = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[CityName]\n"
                    + "      ,[ShipPrice]\n"
                    + "  FROM [Ship]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ShipAddress s = new ShipAddress();
                s.setId(rs.getInt("id"));
                s.setCityname(rs.getString("CityName"));
                s.setPrice(rs.getInt("ShipPrice"));
                adds.add(s);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return adds;
    }
}
