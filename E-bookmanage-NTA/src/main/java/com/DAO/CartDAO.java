/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.Cart;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CartDAO {
    public boolean addCart(Cart cart);
    public List<Cart> getCartByUser(int userId);
    public boolean deleteCart(int cid);
}
