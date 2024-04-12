/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.CartDAOImp;
import com.DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet("/delete_cart")
public class DeleteCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid"));
        System.out.println("==========" + cid);
        CartDAOImp dao = new CartDAOImp(DBConnect.getConnect());
        boolean f = dao.deleteCart(cid);

        HttpSession session = req.getSession();
        if (f) {
            session.setAttribute("successMsg", "Delete successfully");
            resp.sendRedirect("cart.jsp");
        } else {
            session.setAttribute("failMsg", "Delete fail");
            resp.sendRedirect("cart.jsp");
        }
    }

}
