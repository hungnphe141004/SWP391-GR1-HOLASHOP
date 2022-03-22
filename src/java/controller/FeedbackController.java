/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.CategoryDBContext;
import connect.FeedbackDBContext;
import connect.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Feedback;
import model.Product;

/**
 *
 * @author PC
 */
public class FeedbackController extends HttpServlet{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }
        int page = Integer.parseInt(raw_page);
        FeedbackDBContext fdb = new FeedbackDBContext();
        int pagesize = 2;
        ArrayList<Feedback> feedbacks = fdb.getAll(pagesize, page);
        request.setAttribute("feedbacks", feedbacks);

        int count = fdb.getRowCount();
        int totalpage = (count % pagesize == 0) ? count / pagesize : (count / pagesize) + 1;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", page);

        ProductDBContext db = new ProductDBContext();
        ArrayList<Product> products = db.getAll();
        request.setAttribute("products", products);

        CategoryDBContext cdb = new CategoryDBContext();
        ArrayList<Category> cates = cdb.getCates();
        request.setAttribute("cates", cates);

        ArrayList<Brand> brands = db.getBrand();
        request.setAttribute("brands", brands);

        request.getRequestDispatcher("/product/feedbacklist.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
