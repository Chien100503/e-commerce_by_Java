/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.DAO.BookDAOImp;
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
@WebServlet("/delete_book")
public class DeleteBook extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            
            BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
            boolean f = dao.deleteBook(id);
            
            HttpSession session = req.getSession();
            if(f){
                session.setAttribute("successMsg", "Delete successfully");
                resp.sendRedirect("admin/all_books.jsp");
            }else{
                session.setAttribute("failMsg", "Delete fail");
                resp.sendRedirect("admin/all_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
