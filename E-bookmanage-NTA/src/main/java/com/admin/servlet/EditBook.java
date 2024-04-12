/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.DAO.BookDAOImp;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.mysql.cj.Session;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet("/edit_book")
public class EditBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String category = req.getParameter("btype");
            String status = req.getParameter("bstatus");
            
            BookDtls book = new BookDtls();
            book.setId(id);
            book.setBookName(bookName);
            book.setAuthor(author);
            book.setPrice(price);
            book.setBookCategory(category);
            book.setStatus(status);
            
            BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
            boolean f = dao.editBook(book);
            
            HttpSession session = req.getSession();
            if(f){
                session.setAttribute("successMsg", "Edit Successfully");
                resp.sendRedirect("admin/all_books.jsp");
            }else{
                session.setAttribute("failMsg", "Edit faild");
                resp.sendRedirect("admin/all_books.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
