<%-- 
    Document   : home
    Created on : Jan 4, 2024, 6:35:40 PM
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
        <%@include file="allCss.jsp" %>
        <%@include file="navbar.jsp" %>
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: black;
            }
            .card-hov:hover{
                background-color: #fce4ec;
            }
        </style>
    </head>
    <body style="background-color: #fff0fe">
        <c:if test="${empty userobj}">
            <c:redirect url="../index.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_book.jsp">
                        <div class="card card-hov">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus fa-3x" style="color: #ec407a"></i>
                                <h4>Add Book</h4>
                                --------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a href="all_books.jsp">
                        <div class="card card-hov">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x" style="color: #42a5f5"></i>
                                <h4>All Books</h4>
                                --------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">
                        <div class="card card-hov">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x" style="color: #66bb6a"></i>
                                <h4>Oder</h4>
                                --------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a href="../logout.jsp" data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card card-hov">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-arrow-right-from-bracket fa-3x"></i>
                                <h4>Logout</h4>
                                --------
                            </div>
                        </div>
                    </a>    
                </div>
            </div>
        </div>
        <!--Start logout modal-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa-regular fa-face-sad-tear fa-5x text-custom"></i>
                            <h4 class="mt-2">Do you want logout</h4>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="../logout" type="button" class="btn text-white" style="background-color: #ab47bc">Logout</a>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--End logout modal-->
    </body>
    <footer style="margin-top: 238px">
        <%@include file="footer.jsp" %>
    </footer>
</html>
