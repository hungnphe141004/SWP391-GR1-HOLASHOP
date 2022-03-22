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
import model.Cart;

/**
 *
 * @author PC
 */
public class CartDBContext extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public void addtoCart(int id, int ProID) {
        try {
            query = "Update dbo.Cart Set Amount = Amount+1 Where UserID = ? And ProductID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, ProID);
            long Updatedline = ps.executeUpdate();
            if (Updatedline == 0) {
                query = "INSERT INTO dbo.Cart VALUES( ? , ? , 1 )";
                ps = connection.prepareStatement(query);
                ps.setInt(1, id);
                ps.setInt(2, ProID);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);

            return;
        }
    }

    public ArrayList<Cart> getCart(int id) {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            query = "SELECT c.[ProductID]\n"
                    + "	  ,p.[ProductName]\n"
                    + "      ,c.[Amount]\n"
                    + "	  ,p.[SellPrice]\n"
                    + "	  ,i.[ProductImgURL]\n"
                    + "  FROM [Cart] c inner join [Product] p on c.[ProductID] = p.[ProductID] \n"
                    + "  inner join [ProductImg] i on c.[ProductID] = i.[ProductID]\n"
                    + "  where c.[UserID] = ?";

            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setId(rs.getInt("ProductID"));
                c.setName(rs.getString("ProductName"));
                c.setAmount(rs.getInt("Amount"));
                c.setPrice(rs.getInt("SellPrice"));
                c.setImg(rs.getString("ProductImgURL"));
                list.add(c);
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public void plusCart(int id,int ProID) {
        try {
            query = "Update dbo.Cart Set Amount = Amount + 1 Where UserID = ? And ProductID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, ProID);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }
    
    public void minusCart(int id,int ProID) {
        try {
            query = "Update dbo.Cart Set Amount = Amount - 1 Where UserID = ? And ProductID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, ProID);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }
    
    public void deleteCart(int id,int ProID) {
        try {
            query = "DELETE from dbo.Cart Where UserID = ? And ProductID = ?"; 
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, ProID);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return;
    }

    public static void main(String[] args) {
        CartDBContext cdb = new CartDBContext();
//        cdb.addtoCart(1, 1);

          ArrayList<Cart> c1 = cdb.getCart(3);
          for (Cart cart: cdb.getCart(3)) {
              System.out.println(cart.getId());
//        }
    }
    }
}
