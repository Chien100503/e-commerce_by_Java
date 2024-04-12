/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
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
@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(req.getParameter("id"));
            int userId = Integer.parseInt(req.getParameter("uid"));

            BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
            BookDtls book = dao.getBookById(bookId);
            System.err.println("==============" + book.getPrice());

            Cart cart = new Cart();
            cart.setBookId(bookId);
            cart.setUserId(userId);
            cart.setBookname(book.getBookName());
            cart.setAuthor(book.getAuthor());
            cart.setPrice(Double.parseDouble(book.getPrice()));

            CartDAOImp dao2 = new CartDAOImp(DBConnect.getConnect());
            boolean f = dao2.addCart(cart);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("addCart", "Book was added to cart");
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failed", "Book wasn't added to cart");
                resp.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
