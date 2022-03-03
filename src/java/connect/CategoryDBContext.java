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
import model.Category;

/**
 *
 * @author PC
 */
public class CategoryDBContext extends DBContext {

    public ArrayList<Category> getCates() {
        ArrayList<Category> cates = new ArrayList<>();
        try {
            String sql = "SELECT [CategoryID]\n"
                    + "      ,[CategoryName]\n"
                    + "  FROM [Category]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category d = new Category();
                d.setId(rs.getInt("CategoryID"));
                d.setName(rs.getString("CategoryName"));
                cates.add(d);

            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return cates;
    }

    public static void main(String[] args) {
        CategoryDBContext db = new CategoryDBContext();
        System.out.println(db.getCates().get(0).getName());

    }
}
