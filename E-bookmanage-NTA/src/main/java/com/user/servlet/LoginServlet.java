/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.UserDAOImp;
import com.DB.DBConnect;
import com.entity.User;
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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOImp dao = new UserDAOImp(DBConnect.getConnect());
            
            HttpSession session = req.getSession();
            
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if ("tuananhbhnd@gmail.com".equals(email) && "123456".equals(password)) {
                User user = new User();
                user.setName("Admin");
                
                session.setAttribute("userobj", user);
                resp.sendRedirect("admin/home.jsp");
            } else {
                User user = dao.login(email, password);
                if(user != null){
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("index.jsp");
                }else{
                    session.setAttribute("failMsg", "Email and password invalid");
                    resp.sendRedirect("login.jsp");
                }
                resp.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
