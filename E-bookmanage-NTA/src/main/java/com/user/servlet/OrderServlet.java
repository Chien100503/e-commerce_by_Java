/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.CartDAOImp;
import com.DAO.OrderDAOImp;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.OrderDtls;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
@WebServlet("/oder")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            HttpSession session = req.getSession();
            int id = Integer.parseInt(req.getParameter("id"));

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            String country = req.getParameter("country");
            String paymentType = req.getParameter("paymentType");

            CartDAOImp dao = new CartDAOImp(DBConnect.getConnect());
            List<Cart> carts = dao.getCartByUser(id);

            if (carts.isEmpty()) {
                session.setAttribute("failMsg", "Your cart is empty!!!");;
                resp.sendRedirect("cart.jsp");
            } else {
                OrderDAOImp dao2 = new OrderDAOImp(DBConnect.getConnect());
                OrderDtls order = new OrderDtls();
                Random r = new Random();

                ArrayList<OrderDtls> orders = new ArrayList<OrderDtls>();
                for (Cart cart : carts) {
                    order.setOrderId("ORDER" + r.nextInt());
                    order.setUserName(name);
                    order.setEmail(email);
                    order.setAddress(address);
                    order.setPhone(phone);
                    order.setBookName(cart.getBookname());
                    order.setAuthor(cart.getAuthor());
                    order.setPrice(cart.getPrice());
                    order.setPayment(paymentType);
                    orders.add(order);
                }

                boolean f = dao2.saveOrder(orders);
                if (f) {
                    resp.sendRedirect("order_success.jsp");
                } else {
                    session.setAttribute("failMsg1", "Something wrong...");
                    resp.sendRedirect("cart.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
