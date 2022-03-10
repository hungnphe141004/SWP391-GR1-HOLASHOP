/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Order;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> getAllOrders() {
        ArrayList<Order> list = new ArrayList<>();               
        try {
            String query = "select * from Orders";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6)           
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void deleteOrder(int order_id) {
        try {
            String sql = "DELETE FROM [Orders] WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Order> getAllOrder() {
        
        ArrayList<Order> list = new ArrayList<>();
        try {
            String query = "select o.ID , o.UserID , o.TotalPrice , o.Note , o.Status , o.Date , d.Order_ID , d.ProductID , d.ProductName  ,d.ProductPrice , d.Quantity from Orders o\n"
                + "join Order_Detail d on d.Order_ID = o.ID\n";
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
