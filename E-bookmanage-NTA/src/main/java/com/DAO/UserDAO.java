/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.User;
/**
 *
 * @author Admin
 */
public interface UserDAO {
    public boolean userRegister(User us); 
    public User login(String email, String password);
    
    public boolean checkIdPass(int id, String password);
    public boolean updateProfile(User user);
    
    public boolean checkUser(String email);
}
