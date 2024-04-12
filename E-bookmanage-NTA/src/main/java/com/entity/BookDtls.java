/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Admin
 */
public class BookDtls {
    private int id;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String status;
    private String photoName;
    private String email;

    public BookDtls() {
    }
    
    public BookDtls(String bookName, String author, String price, String bookCategory, String status, String photoName, String email) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "BookDtls{" + "id=" + id + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookCategory=" + bookCategory + ", status=" + status + ", photoName=" + photoName + ", email=" + email + '}';
    }
    
    
}
