/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Admin
 */
public class Cart {

    private int cid, userId, bookId;
    private String bookname, author;
    private double price;

    public Cart() {
    }

    public Cart(int cid, int userId, int bookId, String bookname, String author, double price) {
        this.cid = cid;
        this.userId = userId;
        this.bookId = bookId;
        this.bookname = bookname;
        this.author = author;
        this.price = price;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart{" + "cid=" + cid + ", userId=" + userId + ", bookId=" + bookId + ", bookname=" + bookname + ", author=" + author + ", price=" + price + '}';
    }

}
