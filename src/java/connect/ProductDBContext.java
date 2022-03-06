/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Image;
import model.Product;

/**
 *
 * @author PC
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getAll() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT [Product].[ProductID]\n"
                    + "      ,[Product].[ProductName]\n"
                    + "      ,[Product].[Description]\n"
                    + "      ,[Product].[SellPrice]\n"
                    + "      ,[Product].[Amount]\n"
                    + "	  ,[Category].[CategoryID]\n"
                    + "	  ,[Category].[CategoryName]\n"
                    + "	  ,[ProductImg].[ProductImgURL]\n"
                    + "      \n"
                    + "  FROM [Product] inner join [Category] on [Product].[SubCategoryID] = [Category].[CategoryID]\n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product s = new Product();
                s.setProduct_id(rs.getInt("ProductID"));
                s.setProduct_name(rs.getString("ProductName"));

                s.setDescription(rs.getString("Description"));
                s.setPrice(rs.getInt("SellPrice"));
                s.setStock(rs.getInt("Amount"));

                Category d = new Category();
                d.setId(rs.getInt("CategoryID"));
                d.setName(rs.getString("CategoryName"));

                Image i = new Image();
                i.setImage(rs.getString("ProductImgURL"));
                s.setImg(i);
                s.setCate(d);

                products.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Product> pagging(int pagesize, int pageindex) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT ProductID\n"
                    + "      ,ProductName\n"
                    + "      ,Description\n"
                    + "      ,SellPrice\n"
                    + "      ,Amount\n"
                    + "	  ,CategoryID\n"
                    + "	  ,CategoryName\n"
                    + "	  ,ProductImgURL\n"
                    + "	   FROM (SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID asc) as rownum, [Product].[ProductID]\n"
                    + "	   ,[Product].[ProductName],[Product].[Description],[Product].[SellPrice],[Product].[Amount]\n"
                    + "	   ,[Category].[CategoryID] ,[Category].[CategoryName],[ProductImg].[ProductImgURL]\n"
                    + "  FROM [Product] inner join [Category] on [Product].[SubCategoryID] = [Category].[CategoryID]\n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID]) t where \n"
                    + "  rownum >= (? - 1)*? + 1 AND rownum <= ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product s = new Product();
                s.setProduct_id(rs.getInt("ProductID"));
                s.setProduct_name(rs.getString("ProductName"));

                s.setDescription(rs.getString("Description"));
                s.setPrice(rs.getInt("SellPrice"));
                s.setStock(rs.getInt("Amount"));

                Category d = new Category();
                d.setId(rs.getInt("CategoryID"));
                d.setName(rs.getString("CategoryName"));

                Image i = new Image();
                i.setImage(rs.getString("ProductImgURL"));
                s.setImg(i);
                s.setCate(d);

                products.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public int getRowCount() {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Product getProduct(int ProID) {
        ArrayList<Product> products = new ArrayList<>();
        try {

            String sql = "SELECT [Product].[ProductID]\n"
                    + "      ,[Product].[ProductName]\n"
                    + "      ,[Product].[Description]\n"
                    + "      ,[Product].[SellPrice]\n"
                    + "      ,[Product].[Amount]\n"
                    + "	  ,[ProductImg].[ProductImgURL]\n"
                    + "      \n"
                    + "  FROM [Product]\n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID] Where [Product].[ProductID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ProID);
            ResultSet rs = stm.executeQuery();
            Product s = null;
            while (rs.next()) {

                if (s == null) {
                    s = new Product();
                    s.setProduct_id(rs.getInt("ProductID"));
                    s.setProduct_name(rs.getString("ProductName"));

                    s.setDescription(rs.getString("Description"));
                    s.setPrice(rs.getInt("SellPrice"));
                    s.setStock(rs.getInt("Amount"));
                    
                    Image i = new Image();
                    i.setImage(rs.getString("ProductImgURL"));
                    s.setImg(i);

                }

            }
            return s;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDBContext db = new ProductDBContext();
        System.out.println(db.getProduct(2).getProduct_name());
        System.out.println(db.getProduct(2).getPrice());
        System.out.println(db.getAll().get(0).getCate().getName());
        System.out.println(db.getAll().get(0).getImg().getImage());
    }
}
