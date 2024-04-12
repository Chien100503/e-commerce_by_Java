/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartDAOImp implements CartDAO {

    private Connection con;

    public CartDAOImp(Connection con) {
        this.con = con;
    }

    @Override
    public boolean addCart(Cart cart) {
        boolean f = false;
        try {
            String sql = "Insert into cart (userId, bookId, bookname, author, price) values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cart.getUserId());
            ps.setInt(2, cart.getBookId());
            ps.setString(3, cart.getBookname());
            ps.setString(4, cart.getAuthor());
            ps.setDouble(5, cart.getPrice());
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
    public List<Cart> getCartByUser(int userId) {
        List<Cart> cartList = new ArrayList<>();
        Cart cart = null;
        try {
            String sql = "Select * from cart where userId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cart = new Cart();
                cart.setCid(rs.getInt(1));
                cart.setUserId(rs.getInt(2));
                cart.setBookId(rs.getInt(3));
                cart.setBookname(rs.getString(4));
                cart.setAuthor(rs.getString(5));
                cart.setPrice(rs.getDouble(6));
                cartList.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    @Override
    public boolean deleteCart(int cid) {
        boolean f = false;
        try {
            String sql = "Delete from cart where cid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cid);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
