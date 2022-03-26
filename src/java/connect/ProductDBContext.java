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
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AdminProduct;
import model.Brand;
import model.Cart;
import model.Category;
import model.Image;
import model.Img;
import model.Product;
import model.ProductStatus;
import model.Seller;

/**
 *
 * @author PC
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getAll() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT Top 4 [Product].[ProductID]\n"
                    + "      ,[Product].[ProductName]\n"
                    + "      ,[Product].[Description]\n"
                    + "      ,[Product].[SellPrice]\n"
                    + "      ,[Product].[Amount]\n"
                    + "	  ,[Category].[CategoryID]\n"
                    + "	  ,[Category].[CategoryName]\n"
                    + "	  ,[ProductImg].[ProductImgURL]\n"
                    + "      \n"
                    + "  FROM [Product] inner join [Category] on [Product].[SubCategoryID] = [Category].[CategoryID]\n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID] ORDER BY NEWID()";
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

    public AdminProduct getAdminProduct(int ProID) {
        ArrayList<AdminProduct> products = new ArrayList<>();
        try {

            String sql = "SELECT p.[ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[Description]\n"
                    + "      ,[OriginalPrice]\n"
                    + "      ,[SellPrice]\n"
                    + "      ,[SalePercent]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Username]\n"
                    + "      ,[Amount]\n"
                    + "      ,[StatusName]\n"
                    + "      ,[BrandName]\n"
                    + "      ,[height]\n"
                    + "      ,[width]\n"
                    + "      ,[weight]\n"
                    + "	  ,ProductImgURL\n"
                    + "  FROM [Product] p inner join Category c on p.SubCategoryID = c.CategoryID\n"
                    + "  inner join Users u on p.SellerID = u.UserID \n"
                    + "  inner join ProductStatus ps on p.StatusID = ps.StatusID\n"
                    + "  inner join Brand b on p.BrandID = b.BrandID\n"
                    + "  inner join ProductImg i on p.ProductID = i.ProductID Where p.[ProductID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ProID);
            ResultSet rs = stm.executeQuery();
            AdminProduct s = null;
            while (rs.next()) {

                if (s == null) {
                    s = new AdminProduct();
                    s.setId(rs.getInt("ProductID"));
                    s.setName(rs.getString("ProductName"));

                    s.setDescrip(rs.getString("Description"));
                    s.setOprice(rs.getInt("OriginalPrice"));
                    s.setSprice(rs.getInt("SellPrice"));
                    s.setSellper(rs.getInt("SalePercent"));

                    Category c = new Category();
                    c.setName(rs.getString("CategoryName"));

                    Seller se = new Seller();
                    se.setName(rs.getString("Username"));

                    s.setSeller(se);
                    s.setStock(rs.getInt("Amount"));

                    ProductStatus ps = new ProductStatus();
                    ps.setName(rs.getString("StatusName"));
                    s.setStatus(ps);

                    Brand b = new Brand();
                    b.setName(rs.getString("BrandName"));
                    s.setBrand(b);

                    Image i = new Image();
                    i.setImage(rs.getString("ProductImgUrl"));

                    s.setHei(rs.getInt("height"));
                    s.setWid(rs.getInt("width"));
                    s.setWei(rs.getInt("weight"));
                    s.setCate(c);
                    s.setImg(i);

                }

            }
            return s;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public ArrayList<Product> searchByCate(int CateID) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT [Category].[CategoryID]\n"
                    + "      ,[Category].[CategoryName]\n"
                    + "	  ,[Product].[ProductID]\n"
                    + "	  ,[Product].[ProductName]\n"
                    + "	  ,[Product].[Description]\n"
                    + "	  ,[Product].[SellPrice]\n"
                    + "	  ,[Product].[Amount]\n"
                    + "	  ,[ProductImg].[ProductImgURL]\n"
                    + "  FROM [Product] inner join [Category] on [Category].[CategoryID] = [Product].[SubCategoryID] \n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID]\n"
                    + "  Where [Category].[CategoryID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, CateID);
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

    public ArrayList<Product> searchByBrand(int BrandID) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT p.[ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[Description]\n"
                    + "      ,[SellPrice]\n"
                    + "	  ,[Amount]\n"
                    + "	  ,[ProductImgUrl]\n"
                    + "	  ,b.[BrandID]\n"
                    + "	  ,[BrandName]\n"
                    + "  FROM [Product] p inner join [ProductImg] i on p.[ProductID] = i.ProductID\n"
                    + "  inner join Brand b on p.BrandID = b.BrandID where b.BrandID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, BrandID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product s = new Product();
                s.setProduct_id(rs.getInt("ProductID"));
                s.setProduct_name(rs.getString("ProductName"));

                s.setDescription(rs.getString("Description"));
                s.setPrice(rs.getInt("SellPrice"));
                s.setStock(rs.getInt("Amount"));

                Image i = new Image();
                i.setImage(rs.getString("ProductImgURL"));
                s.setImg(i);

                products.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> search(String ProductName) {
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
                    + "  FROM [Product] inner join [Category] on [Product].[SubCategoryID] = [Category].[CategoryID]\n"
                    + "  inner join [ProductImg] on [Product].[ProductID] = [ProductImg].[ProductID]"
                    + "WHERE\n"
                    + "(1=1)\n";

            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramIndex = 0;

            if (ProductName != null) {
                sql += "AND ProductName like '%' + ? + '%' ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = ProductName;
                params.put(paramIndex, param);
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            //parameters
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    stm.setInt(index, Integer.parseInt(value[1].toString()));
                } else if (type.equals(String.class.getName())) {
                    stm.setString(index, value[1].toString());
                } else if (type.equals(Date.class.getName())) {
                    stm.setDate(index, (Date) value[1]);
                } else if (type.equals(Boolean.class.getName())) {
                    stm.setBoolean(index, (Boolean) value[1]);
                }
            }
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

    public ArrayList<AdminProduct> getAllProduct() {
        ArrayList<AdminProduct> products = new ArrayList<>();
        try {

            String sql = "SELECT p.[ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[Description]\n"
                    + "      ,[OriginalPrice]\n"
                    + "      ,[SellPrice]\n"
                    + "      ,[SalePercent]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Username]\n"
                    + "      ,[Amount]\n"
                    + "      ,[StatusName]\n"
                    + "      ,[BrandName]\n"
                    + "      ,[height]\n"
                    + "      ,[width]\n"
                    + "      ,[weight]\n"
                    + "	  ,ProductImgURL\n"
                    + "  FROM [Product] p inner join Category c on p.SubCategoryID = c.CategoryID\n"
                    + "  inner join Users u on p.SellerID = u.UserID \n"
                    + "  inner join ProductStatus ps on p.StatusID = ps.StatusID\n"
                    + "  inner join Brand b on p.BrandID = b.BrandID\n"
                    + "  inner join ProductImg i on p.ProductID = i.ProductID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                AdminProduct s = new AdminProduct();
                s.setId(rs.getInt("ProductID"));
                s.setName(rs.getString("ProductName"));

                s.setDescrip(rs.getString("Description"));
                s.setOprice(rs.getInt("OriginalPrice"));
                s.setSprice(rs.getInt("SellPrice"));
                s.setSellper(rs.getInt("SalePercent"));

                Category c = new Category();
                c.setName(rs.getString("CategoryName"));

                Seller se = new Seller();
                se.setName(rs.getString("Username"));

                s.setSeller(se);
                s.setStock(rs.getInt("Amount"));

                ProductStatus ps = new ProductStatus();
                ps.setName(rs.getString("StatusName"));
                s.setStatus(ps);

                Brand b = new Brand();
                b.setName(rs.getString("BrandName"));
                s.setBrand(b);

                Image i = new Image();
                i.setImage(rs.getString("ProductImgUrl"));

                s.setHei(rs.getInt("height"));
                s.setWid(rs.getInt("width"));
                s.setWei(rs.getInt("weight"));
                s.setCate(c);
                s.setImg(i);

                products.add(s);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return products;
    }

    public AdminProduct getProductById(int ProID) {
        ArrayList<AdminProduct> products = new ArrayList<>();
        try {

            String sql = "SELECT p.[ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[Description]\n"
                    + "      ,[OriginalPrice]\n"
                    + "      ,[SellPrice]\n"
                    + "      ,[SalePercent]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Username]\n"
                    + "      ,[Amount]\n"
                    + "      ,[StatusName]\n"
                    + "      ,[BrandName]\n"
                    + "      ,[height]\n"
                    + "      ,[width]\n"
                    + "      ,[weight]\n"
                    + "	  ,ProductImgURL\n"
                    + "  FROM [Product] p inner join Category c on p.SubCategoryID = c.CategoryID\n"
                    + "  inner join Users u on p.SellerID = u.UserID \n"
                    + "  inner join ProductStatus ps on p.StatusID = ps.StatusID\n"
                    + "  inner join Brand b on p.BrandID = b.BrandID\n"
                    + "  inner join ProductImg i on p.ProductID = i.ProductID where p.[ProductID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ProID);
            ResultSet rs = stm.executeQuery();
            AdminProduct s = null;
            while (rs.next()) {

                if (s == null) {
                    s = new AdminProduct();
                    s.setId(rs.getInt("ProductID"));
                    s.setName(rs.getString("ProductName"));

                    s.setDescrip(rs.getString("Description"));
                    s.setOprice(rs.getInt("OriginalPrice"));
                    s.setSprice(rs.getInt("SellPrice"));
                    s.setSellper(rs.getInt("SalePercent"));

                    Category c = new Category();
                    c.setName(rs.getString("CategoryName"));

                    Seller se = new Seller();
                    se.setName(rs.getString("Username"));

                    s.setSeller(se);
                    s.setStock(rs.getInt("Amount"));

                    ProductStatus ps = new ProductStatus();
                    ps.setName(rs.getString("StatusName"));
                    s.setStatus(ps);

                    Brand b = new Brand();
                    b.setName(rs.getString("BrandName"));
                    s.setBrand(b);

                    Image i = new Image();
                    i.setImage(rs.getString("ProductImgUrl"));

                    s.setHei(rs.getInt("height"));
                    s.setWid(rs.getInt("width"));
                    s.setWei(rs.getInt("weight"));
                    s.setCate(c);
                    s.setImg(i);

                }

            }
            return s;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void insert(AdminProduct product) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([ProductID]\n"
                    + "           ,[ProductName]\n"
                    + "           ,[Description]\n"
                    + "           ,[OriginalPrice]\n"
                    + "           ,[SellPrice]\n"
                    + "           ,[SalePercent]\n"
                    + "           ,[SubCategoryID]\n"
                    + "           ,[SellerID]\n"
                    + "           ,[Amount]\n"
                    + "           ,[StatusID]\n"
                    + "           ,[BrandID]\n"
                    + "           ,[height]\n"
                    + "           ,[width]\n"
                    + "           ,[weight])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, product.getId());
            stm.setString(2, product.getName());
            stm.setString(3, product.getDescrip());
            stm.setInt(4, product.getOprice());
            stm.setInt(5, product.getSprice());
            stm.setInt(6, product.getSellper());
            stm.setInt(7, product.getCate().getId());
            stm.setString(8, product.getSeller().getId());
            stm.setInt(9, product.getStock());
            stm.setInt(10, product.getStatus().getId());
            stm.setInt(11, product.getBrand().getId());
            stm.setInt(12, product.getHei());
            stm.setInt(13, product.getWid());
            stm.setInt(14, product.getWei());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<ProductStatus> getProductStatus() {
        ArrayList<ProductStatus> status = new ArrayList<>();
        try {
            String sql = "SELECT [StatusID]\n"
                    + "      ,[StatusName]\n"
                    + "  FROM [ProductStatus]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductStatus p = new ProductStatus();
                p.setId(rs.getInt("StatusID"));
                p.setName(rs.getString("StatusName"));
                status.add(p);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return status;
    }

    public ArrayList<Brand> getBrand() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "SELECT [BrandID]\n"
                    + "      ,[BrandName]\n"
                    + "  FROM [Brand]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setId(rs.getInt("BrandID"));
                b.setName(rs.getString("BrandName"));
                brands.add(b);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return brands;
    }

    public ArrayList<Seller> getSeller() {
        ArrayList<Seller> sellers = new ArrayList<>();
        try {
            String sql = "SELECT [UserID]\n"
                    + "      ,[Username]\n"
                    + "  FROM [Users] where RoleID = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Seller s = new Seller();
                s.setId(rs.getString("UserID"));
                s.setName(rs.getString("Username"));
                sellers.add(s);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return sellers;
    }

    public void insertImg(Img image) {
        try {
            String sql = "INSERT INTO [ProductImg]\n"
                    + "           ([ProductID]\n"
                    + "           ,[ProductImgURL])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, image.getId());
            stm.setString(2, image.getUrl());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE Product WHERE ProductID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteImg(int id) {
        try {
            String sql = "DELETE ProductImg WHERE ProductID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(AdminProduct product) {
        try {
            String sql = "UPDATE [Product]\n"
                    + "   SET \n"
                    + "       [ProductName] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[OriginalPrice] = ?\n"
                    + "      ,[SellPrice] = ?\n"
                    + "      ,[SalePercent] = ?\n"
                    + "      ,[SubCategoryID] = ?\n"
                    + "      ,[SellerID] = ?\n"
                    + "      ,[Amount] = ?\n"
                    + "      ,[StatusID] = ?\n"
                    + "      ,[BrandID] = ?\n"
                    + "      ,[height] = ?\n"
                    + "      ,[width] = ?\n"
                    + "      ,[weight] = ?\n"
                    + " WHERE ProductID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(14, product.getId());
            stm.setString(1, product.getName());
            stm.setString(2, product.getDescrip());
            stm.setInt(3, product.getOprice());
            stm.setInt(4, product.getSprice());
            stm.setInt(5, product.getSellper());
            stm.setInt(6, product.getCate().getId());
            stm.setString(7, product.getSeller().getId());
            stm.setInt(8, product.getStock());
            stm.setInt(9, product.getStatus().getId());
            stm.setInt(10, product.getBrand().getId());
            stm.setInt(11, product.getHei());
            stm.setInt(12, product.getWid());
            stm.setInt(13, product.getWei());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateImg(Img Image) {
        try {
            String sql = "UPDATE [ProductImg]\n"
                    + "   SET [ProductImgURL] = ?"
                    + " WHERE ProductID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, Image.getId());
            stm.setString(1, Image.getUrl());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public ArrayList<Cart> getCart(int id) {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            query = "SELECT [Order_ID]\n"
                    + "      ,o.[ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[ProductPrice]\n"
                    + "      ,[Quantity]\n"
                    + "	  ,[ProductImgUrl]\n"
                    + "  FROM [Order_Detail] o \n"
                    + "  inner join [ProductImg] p on o.[ProductId] = p.[ProductId]\n"
                    + "  where [Order_ID] = ?";

            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setId(rs.getInt("ProductID"));
                c.setName(rs.getString("ProductName"));
                c.setPrice(rs.getInt("ProductPrice"));
                c.setAmount(rs.getInt("Quantity"));
                c.setImg(rs.getString("ProductImgURL"));
                list.add(c);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDBContext db = new ProductDBContext();
//        System.out.println(db.getProduct(2).getProduct_name());
//        System.out.println(db.getProduct(2).getPrice());
//        System.out.println(db.getAll().get(0).getCate().getName());
//        System.out.println(db.getAll().get(0).getImg().getImage());
//        for (Product product : db.searchByCate(3)) {
//            System.out.println(product.getPrice());
//        }

//        for (AdminProduct product : db.getAllProduct()) {
//            System.out.println(product.getImg().getImage());
//        }
//        int id = 19;
//        String name = "test";
//        String des = "test";
//        int op = 1;
//        int sp = 1;
//        int sper = 1;
//        Category c = new Category();
//        int cate = 3;
//        c.setId(cate);
//        String sellerid = "2";
//        int am = 100;
//        int sid = 1;
//        int bid = 1;
//        int h = 1;
//        int w = 1;
//        int w1 = 1;
//        
//        AdminProduct p = new AdminProduct();
//        p.setId(id);
//        p.setName(name);
//        p.setDescrip(des);
//        p.setOprice(op);
//        p.setSprice(sp);
//        p.setSellper(sper);
//        p.setCate(c);
//        p.setSellerid(sellerid);
//        p.setStock(am);
//        p.setSid(sid);
//        p.setBid(bid);
//        p.setHei(h);
//        p.setWid(w);
//        p.setWei(w1);
//        db.insert(p);
//        System.out.println(db.getProductById(12).getCate().getName());
//        System.out.println(db.getAdminProduct(1).getName());
        AdminProduct product = new AdminProduct();

        db.update(product);
    }
}
