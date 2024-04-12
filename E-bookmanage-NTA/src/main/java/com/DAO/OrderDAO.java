/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.OrderDtls;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface OrderDAO {
    public boolean saveOrder(List<OrderDtls> order);
    public List<OrderDtls> getOrder(String email);
    public List<OrderDtls> getAllOrder();
}
