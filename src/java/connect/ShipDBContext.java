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
import model.Ship;

/**
 *
 * @author PC
 */
public class ShipDBContext extends DBContext {

    public ArrayList<Ship> getAllShip() {
        ArrayList<Ship> ship = new ArrayList<>();
        try {
            String sql = "SELECT [Order_ID]\n"
                    + "      ,[CustomerName]\n"
                    + "      ,[ShippingAddress]\n"
                    + "      ,[ShipCityID]\n"
                    + "      ,[PhoneNum]\n"
                    + "      ,[Note]\n"
                    + "      ,[Delivered]\n"
                    + "      ,[Shipper]\n"
                    + "      ,[f0]\n"
                    + "  FROM [ShipInfo] where Delivered = 'True'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Ship s = new Ship();
                s.setOrderid(rs.getInt("Order_ID"));
                s.setCus_name(rs.getString("CustomerName"));
                s.setAddress(rs.getString("ShippingAddress"));
                s.setCityid(rs.getInt("ShipCityID"));
                s.setPhone(rs.getString("PhoneNum"));
                s.setNote(rs.getString("Note"));
                s.setDeli(rs.getBoolean("Delivered"));
                s.setShipper(rs.getString("Shipper"));
                s.setF0(rs.getBoolean("f0"));

                ship.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShipDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ship;
    }
    
    public void update(Ship ship) {
        try {
            String sql = "UPDATE [ShipInfo]\n"
                    + "   SET [Delivered] = ?\n"
                    + "      ,[Shipper] = ?\n"
                    + " WHERE Order_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, ship.isDeli());
            stm.setString(2, ship.getShipper());
            stm.setInt(3, ship.getOrderid());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ShipDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Ship> getAllShip1() {
        ArrayList<Ship> ship = new ArrayList<>();
        try {
            String sql = "SELECT [Order_ID]\n"
                    + "      ,[CustomerName]\n"
                    + "      ,[ShippingAddress]\n"
                    + "      ,[ShipCityID]\n"
                    + "      ,[PhoneNum]\n"
                    + "      ,[Note]\n"
                    + "      ,[Delivered]\n"
                    + "      ,[Shipper]\n"
                    + "      ,[f0]\n"
                    + "  FROM [ShipInfo] where Delivered = 'False'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Ship s = new Ship();
                s.setOrderid(rs.getInt("Order_ID"));
                s.setCus_name(rs.getString("CustomerName"));
                s.setAddress(rs.getString("ShippingAddress"));
                s.setCityid(rs.getInt("ShipCityID"));
                s.setPhone(rs.getString("PhoneNum"));
                s.setNote(rs.getString("Note"));
                s.setDeli(rs.getBoolean("Delivered"));
                s.setShipper(rs.getString("Shipper"));
                s.setF0(rs.getBoolean("f0"));

                ship.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShipDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ship;
    }
    
    public Ship get(int id) {

        try {
            String sql = "SELECT [Order_ID]\n"
                    + "      ,[CustomerName]\n"
                    + "      ,[ShippingAddress]\n"
                    + "      ,[ShipCityID]\n"
                    + "      ,[PhoneNum]\n"
                    + "      ,[Note]\n"
                    + "      ,[Delivered]\n"
                    + "  FROM [ShipInfo]\n"
                    + " WHERE Order_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Ship s = new Ship();
                s.setOrderid(rs.getInt("Order_ID"));
                s.setCus_name(rs.getString("CustomerName"));
                s.setAddress(rs.getString("ShippingAddress"));
                s.setCityid(rs.getInt("ShipCityID"));
                s.setPhone(rs.getString("PhoneNum"));
                s.setNote(rs.getString("Note"));
                s.setDeli(rs.getBoolean("Delivered"));

                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShipDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        ShipDBContext db = new ShipDBContext();
        System.out.println(db.get(0));
    }
}
