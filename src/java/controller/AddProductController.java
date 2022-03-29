/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.CategoryDBContext;
import connect.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminProduct;
import model.Brand;
import model.Category;
import model.Img;
import model.Product;
import model.ProductStatus;
import model.Seller;

/**
 *
 * @author PC
 */
public class AddProductController extends HttpServlet {

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
            out.println("<title>Servlet AddProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath() + "</h1>");
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
        CategoryDBContext cdb = new CategoryDBContext();
        ArrayList<Category> cates = cdb.getCates();
        request.setAttribute("cates", cates);

        ProductDBContext db = new ProductDBContext();
        ArrayList<ProductStatus> status = db.getProductStatus();
        request.setAttribute("status", status);

        ArrayList<Brand> brands = db.getBrand();
        request.setAttribute("brands", brands);

        ArrayList<Seller> sellers = db.getSeller();
        request.setAttribute("sellers", sellers);

        request.getRequestDispatcher("/product/add.jsp").forward(request, response);
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
        AdminProduct p = new AdminProduct();
        p.setId(Integer.parseInt(request.getParameter("id")));
        p.setName(request.getParameter("name"));
        p.setDescrip(request.getParameter("des"));
        p.setOprice(Integer.parseInt(request.getParameter("orginal")));
        p.setSprice(Integer.parseInt(request.getParameter("price")));
        p.setSellper(Integer.parseInt(request.getParameter("sale")));
        Category c = new Category();
        c.setId(Integer.parseInt(request.getParameter("cate")));
        p.setCate(c);
        Seller se = new Seller();
        se.setId(request.getParameter("seller"));
        p.setSeller(se);
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        ProductStatus ps = new ProductStatus();
        ps.setId(Integer.parseInt(request.getParameter("status")));
        p.setStatus(ps);
        Brand b = new Brand();
        b.setId(Integer.parseInt(request.getParameter("brand")));
        p.setBrand(b);
        p.setHei(Integer.parseInt(request.getParameter("height")));
        p.setWid(Integer.parseInt(request.getParameter("width")));
        p.setWei(Integer.parseInt(request.getParameter("weight")));
        
        Img i = new Img();
        i.setId(Integer.parseInt(request.getParameter("id")));
        i.setUrl(request.getParameter("img"));
        
        
        ProductDBContext db = new ProductDBContext();
        db.insert(p);
        db.insertImg(i);
        
        response.sendRedirect("adminlist");
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
