/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class UserDAOImp implements UserDAO {

    private Connection connect;

    public UserDAOImp(Connection connect) {
        this.connect = connect;
    }

    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql = "insert into user(name, email, phone, password) value(?,?,?,?)";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User user = null;
        try {
            String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setCountry(rs.getString(7));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean checkIdPass(int id, String password) {
        boolean f = false;
        try {
            String sql = "Select * from user where id=? and password =?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f = false;
        try {
            String sql = "update user set name=?, email=?, phone=? where id=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setInt(4, user.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String email) {
        boolean f = true;
        try {
            String sql = "select * from user where email=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                f= false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
