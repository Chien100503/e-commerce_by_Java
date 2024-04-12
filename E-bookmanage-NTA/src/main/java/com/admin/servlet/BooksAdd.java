/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.entity.BookDtls;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet("/add_book")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("btype");
            String status = req.getParameter("bstatus");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            BookDtls book = new BookDtls(bookName, author, price, categories, status, fileName, "admin");

            BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());

            boolean f = dao.addBooks(book);

            HttpSession session = req.getSession();
            if (f) {
                String path = getServletContext().getRealPath("") + "books";

                File file = new File(path);
                part.write(path + File.separator + fileName);

                session.setAttribute("successMsg", "Book Add Successfully");
                resp.sendRedirect("admin/add_book.jsp");
            } else {
                session.setAttribute("failMsg", "Book Add Fail");
                resp.sendRedirect("admin/add_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
