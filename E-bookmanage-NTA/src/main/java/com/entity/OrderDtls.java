/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Admin
 */
public class OrderDtls {
    private int id; 
    private String orderId, userName, email, address, phone, bookName, author, payment;
    private double price;

    public OrderDtls() {
    }

    public OrderDtls(int id, String orderId, String userName, String email, String address, String phone, String bookName, String author, String payment, double price) {
        this.id = id;
        this.orderId = orderId;
        this.userName = userName;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.bookName = bookName;
        this.author = author;
        this.payment = payment;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDtls{" + "id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", address=" + address + ", phone=" + phone + ", bookName=" + bookName + ", author=" + author + ", payment=" + payment + ", price=" + price + '}';
    }
    
    
}
