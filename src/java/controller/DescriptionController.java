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
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Feedback;
import model.Product;

/**
 *
 * @author PC
 */
public class DescriptionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DescriptionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DescriptionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ProID = Integer.parseInt(request.getParameter("ProID"));
        ProductDBContext db = new ProductDBContext();
        Product product = db.getProduct(ProID);
        request.setAttribute("product", product);

        ArrayList<Product> products = db.getAll();
        request.setAttribute("products", products);

        CategoryDBContext cdb = new CategoryDBContext();
        ArrayList<Category> cates = cdb.getCates();
        request.setAttribute("cates", cates);

        request.getRequestDispatcher("/product/detail.jsp").forward(request, response);
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
        LocalDate date = java.time.LocalDate.now();
        request.setAttribute("date", date);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        int id = Integer.valueOf(request.getParameter("id"));

        FeedbackDBContext fdb = new FeedbackDBContext();
        ProductDBContext db = new ProductDBContext();
        ArrayList<Product> products = db.getAll();
        request.setAttribute("products", products);
        Feedback f = new Feedback();
        f.setName(name);
        f.setEmail(email);
        f.setFeedback(feedback);
        f.setDate(Date.valueOf(date));
        f.setId(id);
        fdb.insert(f);

        response.sendRedirect("list");
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
