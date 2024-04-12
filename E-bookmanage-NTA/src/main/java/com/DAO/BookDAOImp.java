/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BookDAOImp implements BookDAO {

    private Connection connect;

    public BookDAOImp(Connection connect) {
        this.connect = connect;
    }

    @Override
    public boolean addBooks(BookDtls book) {
        boolean f = false;
        try {
            String sql = "insert into book_dtls(bookname, author, price, bookCategory, status, photo, email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhotoName());
            ps.setString(7, book.getEmail());

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
    public List<BookDtls> getAllBook() {
        List<BookDtls> bookList = new ArrayList<BookDtls>();
        BookDtls book = null;
        try {
            String sql = "Select * from book_dtls";
            PreparedStatement ps = connect.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public BookDtls getBookById(int id) {
        BookDtls book = null;

        try {
            String sql = "select * from book_dtls where bookId=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public boolean editBook(BookDtls book) {
        boolean f = false;
        try {
            String sql = "update book_dtls set bookname=?, author=?, price=?, bookCategory=?, status=? where bookId=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setInt(6, book.getId());

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
    public boolean deleteBook(int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where bookId=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
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
    public List<BookDtls> getNewBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where bookCategory =? and status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getRecentBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getOldBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where bookCategory =? and status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where bookCategory =? and status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                System.out.println(book);
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllRecentBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                System.out.println(book);
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where bookCategory =? and status=? order by bookId DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                System.out.println(book);
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getBookByName(String name) {
        List<BookDtls> list = new ArrayList<>();
        BookDtls book = null;
        try {
            String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "%"+name+"%");
            ps.setString(2, "%"+name+"%");
            ps.setString(3, "%"+name+"%");
            ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new BookDtls();
                book.setId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                System.out.println(book);
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
