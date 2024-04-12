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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);

            HttpSession session = req.getSession();

            if (check != null) {
                UserDAOImp dao = new UserDAOImp(DBConnect.getConnect());
                boolean f1 = dao.checkUser(email);
                if (f1) {
                    boolean f = dao.userRegister(us);
                    if (f) {
                        //System.out.println("User Register Success");
                        session.setAttribute("successMsg", "Registration Successfully. You can login now");
                        resp.sendRedirect("login.jsp");
                    } else {
                        //System.out.println("Somthing wrong");
                        session.setAttribute("failMsg", "Something wrong...");
                        resp.sendRedirect("register.jsp");
                    }
                } else {
                    session.setAttribute("failMsg", "User already exist. Try with another email");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                //System.out.println("Please check Agree to tearm");
                session.setAttribute("failMsg", "Please read and agree to the terms...");
                resp.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
        }
    }

}
