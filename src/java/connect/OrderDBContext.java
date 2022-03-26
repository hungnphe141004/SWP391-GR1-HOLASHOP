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
import model.Order;
import model.OrderDetail;

/**
 *
 * @author PC
 */
public class OrderDBContext extends DBContext {

    public int insert(Order order) {
        try {
            String sql = "INSERT INTO dbo.Orders (UserID,TotalPrice,Note,Status,Date) VALUES(?,?,?,1,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, order.getUserId());
            stm.setDouble(2, order.getTotalPrice());
            stm.setNString(3, order.getNote());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Order getOrderId(int id) {
        ArrayList<Order> order = new ArrayList<>();
        try {

            String sql = "SELECT [ID]\n"
                    + "       ,[UserId]\n"
                    + "  FROM [Orders]\n"
                    + "  where UserId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Order s = null;
            while (rs.next()) {
                if (s == null) {
                    s = new Order();
                    s.setId(rs.getInt("ID"));
                    s.setUserId(rs.getInt("UserId"));
                }
            }
            return s;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int insertOrderDetail(OrderDetail order) {
        try {
            String sql = "INSERT INTO [Order_Detail]\n"
                    + "           ([Order_ID]\n"
                    + "           ,[ProductID]\n"
                    + "           ,[ProductName]\n"
                    + "           ,[ProductPrice]\n"
                    + "           ,[Quantity])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, order.getOrderid());
            stm.setInt(2, order.getProduct_id());
            stm.setString(3, order.getProduct_name());
            stm.setInt(4, order.getPrice());
            stm.setInt(5, order.getAmount());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Cart]\n"
                    + "      WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        OrderDBContext db = new OrderDBContext();
//        int id = 1;
//        int price = 10000;
//        String note = "mot con vit";
//        
//        Order o = new Order();
//        o.setUserId(id);
//        o.setTotalPrice(price);
//        o.setNote(note);
//        
//        db.insert(o);

//        System.out.println(db.getOrderId(4).getUserId());
        OrderDetail detail = new OrderDetail();
        detail.setOrderid(db.getOrderId(1).getId());
        detail.setProduct_id(1);
        detail.setProduct_name("Bread");
        detail.setPrice(10000);
        detail.setAmount(1);

        db.insertOrderDetail(detail);
    }
}
