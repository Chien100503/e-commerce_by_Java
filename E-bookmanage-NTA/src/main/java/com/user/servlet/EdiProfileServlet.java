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
@WebServlet("/edit_profile")
public class EdiProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");

            UserDAOImp dao = new UserDAOImp(DBConnect.getConnect());

            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);

            HttpSession session = req.getSession();

            boolean f = dao.checkIdPass(id, password);
            if (f) {
                dao.updateProfile(user);
                if (f) {
                    //System.out.println("User Register Success");
                    session.setAttribute("successMsg", "Profile Update Successfully.");
                    resp.sendRedirect("edit_profile.jsp");
                } else {
                    //System.out.println("Somthing wrong");
                    session.setAttribute("failMsg", "Something wrong...");
                    resp.sendRedirect("edit_profile.jsp");
                }
            } else {
                session.setAttribute("failMsg", "Your password is incorrect...");
                resp.sendRedirect("edit_profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
