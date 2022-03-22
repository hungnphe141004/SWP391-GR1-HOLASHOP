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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Feedback;
import model.Image;
import model.Product;

/**
 *
 * @author PC
 */
public class FeedbackDBContext extends DBContext {

    public void insert(Feedback feedback) {
        try {
            String sql = "INSERT INTO [Comment]\n"
                    + "           ([Name]\n"
                    + "           ,[Email]\n"
                    + "           ,[CommentDate]\n"
                    + "           ,[CommentDetail]\n"
                    + "           ,[ProductId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, feedback.getName());
            stm.setString(2, feedback.getEmail());
            stm.setDate(3, feedback.getDate());
            stm.setString(4, feedback.getFeedback());
            stm.setInt(5, feedback.getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Feedback> getAll(int pagesize, int pageindex) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        try {
            String sql = "SELECT ID\n"
                    + "      ,Name\n"
                    + "      ,Email\n"
                    + "      ,CommentDate\n"
                    + "      ,CommentDetail\n"
                    + "      ,ProductId\n"
                    + "	  ,ProductImgURL\n"
                    + "	  ,ProductName\n"
                    + "  FROM (SELECT ROW_NUMBER() OVER (ORDER BY Comment.ID asc) as rownum, [Comment].[ID],\n"
                    + "  [Comment].[Name],[Comment].[Email],[Comment].[CommentDate],[Comment].[CommentDetail],\n"
                    + "  [Comment].[ProductId],[ProductImg].[ProductImgURL],[Product].[ProductName]\n"
                    + "  FROM [Comment] inner join [ProductImg] on [Comment].[ProductId] = [ProductImg].[ProductID]\n"
                    + "  inner join [Product] on [Comment].[ProductId] = [Product].[ProductID]) t where \n"
                    + "  rownum >= (? - 1)*? + 1 AND rownum <= ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback s = new Feedback();
                s.setName(rs.getString("Name"));
                s.setEmail(rs.getString("Email"));
                s.setDate(rs.getDate("CommentDate"));
                s.setFeedback(rs.getString("CommentDetail"));

                Image i = new Image();
                i.setImage(rs.getString("ProductImgURL"));
                s.setImg(i);

                Product p = new Product();
                p.setProduct_name(rs.getString("ProductName"));

                s.setProduct_name(p);
                feedbacks.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }

    public int getRowCount() {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Comment";
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

    public ArrayList<Feedback> getFeedback(int ProID, int pagesize, int pageindex) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        try {
            String sql = "SELECT ID\n"
                    + ",Name\n"
                    + ",Email\n"
                    + ",CommentDate\n"
                    + ",CommentDetail\n"
                    + "  FROM (select ROW_NUMBER() Over (Order by [ID] DESC) as rownum, [Comment].[ID],\n"
                    + "  [Comment].[Name],[Comment].[Email], [Comment].[CommentDate], [Comment].[CommentDetail] FROM\n"
                    + "  [Comment] inner join [Product] on [Comment].[ProductId] = [Product].[ProductID]\n"
                    + "  where [Product].[ProductID] = ?) t where rownum >= (? - 1)*? + 1 AND rownum <= ?*?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ProID);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback s = new Feedback();
                s.setName(rs.getString("Name"));
                s.setEmail(rs.getString("Email"));
                s.setDate(rs.getDate("CommentDate"));
                s.setFeedback(rs.getString("CommentDetail"));
                feedbacks.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }

    public int getCount(int ProID) {
        try {
            String sql = "SELECT Count(id) as count \n"
                    + "  FROM [dbo].[Comment] inner join [Product] on [Comment].[ProductId] = [Product].[ProductID]\n"
                    + "  where [Product].[ProductID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ProID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        FeedbackDBContext fdb = new FeedbackDBContext();
//        LocalDate date = java.time.LocalDate.now();
//        Feedback f = new Feedback();
//        f.setName("Aurora");
//        f.setEmail("littemice@gmail.com");
//        f.setFeedback("Wish i could get out of this shit place");
//        f.setDate(Date.valueOf(date));
//        f.setId(1);
//
//        fdb.insert(f);

//        System.out.println(fdb.getAll().get(0).getName());
//        System.out.println(fdb.getAll().get(0).getImg().getImage());
//        System.out.println(fdb.getAll().get(0).getProduct_name().getProduct_name());
    }
}
