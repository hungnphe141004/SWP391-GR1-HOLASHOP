/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import connect.UserInfoDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserAddress;
import model.UserInfo;

/**
 *
 * @author User
 */
public class UserController extends BasedRequiredAuthenController {

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        UserInfoDBContext db = new UserInfoDBContext();
        UserInfo info = db.getUserInfo(user.getId());
        request.setAttribute("info", info);

        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        UserInfo acc = new UserInfo();
        acc.setUserid(user.getId());
        acc.setPassword(request.getParameter("password"));
        acc.setEmail(request.getParameter("email"));
        
        UserAddress info = new UserAddress();
        info.setName(request.getParameter("shipname"));
        info.setAddress(request.getParameter("shipaddress"));
        info.setPhonenum(request.getParameter("phone"));
        info.setUserid(user.getId());
        
        UserInfoDBContext db = new UserInfoDBContext();
        db.updateAccount(acc);
        db.updateInfo(info);
        response.sendRedirect("UserController");
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
