/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.OrderDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAOImp implements OrderDAO {

    private Connection con;

    public OrderDAOImp(Connection con) {
        this.con = con;
    }

    @Override
    public boolean saveOrder(List<OrderDtls> orders) {
        boolean f = false;
        try {
            String sql = "insert into `order` (orderId, userName, email, address, phone, bookName, author, price, payment) values (?,?,?,?,?,?,?,?,?)";

            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement(sql);

            for (OrderDtls order : orders) {
                ps.setString(1, order.getOrderId());
                ps.setString(2, order.getUserName());
                ps.setString(3, order.getEmail());
                ps.setString(4, order.getAddress());
                ps.setString(5, order.getPhone());
                ps.setString(6, order.getBookName());
                ps.setString(7, order.getAuthor());
                ps.setDouble(8, order.getPrice());
                ps.setString(9, order.getPayment());
                ps.addBatch();
            }

            int[] count = ps.executeBatch();
            con.commit();
            f = true;
            con.setAutoCommit(true);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<OrderDtls> getOrder(String email) {
        List<OrderDtls> orders = new ArrayList<OrderDtls>();
        OrderDtls order = null;

        try {
            String sql = "select * from `order` where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = new OrderDtls();
                order.setId(rs.getInt(1));
                order.setOrderId(rs.getString(2));
                order.setUserName(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setAddress(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBookName(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getDouble(9));
                order.setPayment(rs.getString(10));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<OrderDtls> getAllOrder() {
        List<OrderDtls> orders = new ArrayList<OrderDtls>();
        OrderDtls order = null;

        try {
            String sql = "select * from `order`";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                order = new OrderDtls();
                order.setId(rs.getInt(1));
                order.setOrderId(rs.getString(2));
                order.setUserName(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setAddress(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBookName(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getDouble(9));
                order.setPayment(rs.getString(10));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

}
