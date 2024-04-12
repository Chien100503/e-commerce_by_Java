<%-- 
    Document   : all_books
    Created on : Jan 5, 2024, 6:54:11 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.entity.BookDtls" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="navbar.jsp" %>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #fff0fe">
        <c:if test="${empty userobj}">
            <c:redirect url="../index.jsp"></c:redirect>
        </c:if>
        <h3 class="text-center">Hello Admin</h3>
        <c:if test="${not empty successMsg}">
            <p class="text-center text-success">${successMsg}</p>
            <c:remove var="successMsg" scope="session"></c:remove>
        </c:if>
        <c:if test="${not empty failMsg}">
            <p class="text-center text-danger">${failMsg}</p>
            <c:remove var="failMsg" scope="session"></c:remove>
        </c:if>    
        <table class="table">
            <thead class="text-white" style="background-color: #f06292">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
                    List<BookDtls> bookList = dao.getAllBook();
                    int id = 1;
                    for (BookDtls book : bookList) {
                %>
                <tr>
                    <td><%=id%></td>
                    <td> <img src="../books/<%=book.getPhotoName()%>" alt="alt" style="height: 70px; width: 50px"/></td>
                    <td><%=book.getBookName()%></td>
                    <td><%=book.getAuthor()%></td>
                    <td><%=book.getPrice()%>$</td>
                    <td><%=book.getBookCategory()%></td>
                    <td><%=book.getStatus()%></td>
                    <td>
                        <a href="edit_book.jsp?id=<%=book.getId()%>" class="btn btn-sm text-white" style="background-color: #f06292"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                        <a href="../delete_book?id=<%=book.getId()%>" class="btn btn-sm text-white" style="background-color: #880e4f"><i class="fa-solid fa-trash"></i> Delete</a>
                    </td>
                </tr>
                <%
                        id++;
                    }
                %>               
            </tbody>
        </table>
    </body>
    <footer style="margin-top: 225px">
        <%@include file="footer.jsp" %>
    </footer>
</html>
