/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookDtls;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface BookDAO {
    public boolean addBooks(BookDtls book);
    
    public List<BookDtls> getAllBook();
    
    public BookDtls getBookById(int id);
    
    public boolean editBook(BookDtls book);
    
    public boolean deleteBook(int id);
    
    public List<BookDtls> getNewBook();
    
    public List<BookDtls> getRecentBook();
    
    public List<BookDtls> getOldBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllOldBook();
    
    public List<BookDtls> getBookByName(String name);
}
