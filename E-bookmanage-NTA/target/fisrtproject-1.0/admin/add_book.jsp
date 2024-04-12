<%-- 
    Document   : add_book
    Created on : Jan 5, 2024, 6:37:51 AM
    Author     : Admin
--%>

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
        <div class="container">
            <div class="row mt-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">                                                        
                            <h4 class="text-center">Add Book</h4>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"></c:remove>
                            </c:if>
                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-danger">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>
                            <form action="../add_book" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name</label>
                                    <input type="String" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Author Name</label>
                                    <input type="String" class="form-control" id="exampleInputPassword1" name="author" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="price" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Book Catagories</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="btype" required="required">
                                        <option selected>--select--</option>
                                        <option value="New">New Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Book Status</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="bstatus" required="required">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-custom text-white">Add</button>
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
