/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.CartDBContext;
import connect.OrderDBContext;
import connect.ShipDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.ShipInfo;
import model.User;

/**
 *
 * @author PC
 */
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        OrderDBContext db = new OrderDBContext();
        Order order = db.getOrderId(user.getId());
        request.setAttribute("order", order);
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
        int price = Integer.parseInt(request.getParameter("totalprice"));
        String note = request.getParameter("message");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Order o = new Order();
        o.setUserId(user.getId());
        o.setTotalPrice(price);
        o.setNote(note);

        OrderDBContext db = new OrderDBContext();
        db.insert(o);
        
        CartDBContext cdb = new CartDBContext();
        List<Cart> carts = cdb.getCart(user.getId());
        for (Cart cart : carts) {
            OrderDetail detail = new OrderDetail(db.getOrderId(user.getId()).getId(), cart.getId(), cart.getName(), cart.getPrice(), cart.getAmount());
            db.insertOrderDetail(detail);
        }

//        detail.setOrderid(db.getOrderId(user.getId()).getId());
//        detail.setProduct_id(Integer.parseInt(request.getParameter("id")));
//        detail.setProduct_name(request.getParameter("name"));
//        detail.setPrice(Integer.parseInt(request.getParameter("price")));
//        detail.setAmount(Integer.parseInt(request.getParameter("amount")));
//        db.insertOrderDetail(detail);


        ShipInfo ship = new ShipInfo();
        ship.setOrderid(db.getOrderId(user.getId()).getId());
        ship.setName(request.getParameter("cusname"));
        ship.setAddress(request.getParameter("address"));
        ship.setCityid(Integer.parseInt(request.getParameter("city")));
        ship.setPhone(request.getParameter("phone"));
        ship.setNote(request.getParameter("message"));
        ship.setF0(Boolean.valueOf(request.getParameter("f0")));
        
        boolean f0 = Boolean.valueOf(request.getParameter("f0"));
        

        ShipDBContext sdb = new ShipDBContext();
        sdb.insert(ship);

        db.delete(user.getId());

//        db.insertOrderDetail(detail);
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
