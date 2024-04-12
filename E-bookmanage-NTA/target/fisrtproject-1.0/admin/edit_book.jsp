<%-- 
    Document   : add_book
    Created on : Jan 5, 2024, 6:37:51 AM
    Author     : Admin
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
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
        <div class="container">
            <div class="row mt-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">                                                        
                            <h4 class="text-center">Edit Book</h4>
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
                                BookDtls book = dao.getBookById(id);
                            %>    
                            <form action="../edit_book" method="post"">
                                <input type="hidden" name = "id" value="<%=book.getId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name</label>
                                    <input type="String" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname" required="required" value="<%=book.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Author Name</label>
                                    <input type="String" class="form-control" id="exampleInputPassword1" name="author" required="required" value="<%=book.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="price" required="required" value="<%=book.getPrice()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Book Catagories</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="btype" required="required">

                                        <%
                                            if ("New".equals(book.getBookCategory())) {
                                        %>
                                        <option value="New">New Book</option>
                                        <option value="Old">Old Book</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Old">Old Book</option>
                                        <option value="New">New Book</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Book Status</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="bstatus" required="required" value="<%=book.getStatus()%>">
                                        <%
                                            if ("Active".equals(book.getStatus())) {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div> 
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-custom text-white">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
