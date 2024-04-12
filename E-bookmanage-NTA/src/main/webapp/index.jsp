<%-- 
    Document   : index
    Created on : Jan 3, 2024, 7:05:11 PM
    Author     : Admin
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Books</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
        <style>
            .bg-img{
                background: url(images/book_background.jpg);
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .card-hov:hover{
                background-color: #fce4ec;
            }
            /* toast */
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: green;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            .card-hov:hover {
                transform: scale(1.05);
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            }

            .book-image {
                position: relative;
                overflow: hidden;
                height: 300px;
            }

            .book-image img {
                transition: transform 0.5s ease;
            }

            .book-image:hover img {
                transform: scale(1.1);
            }
            .card-hov {
                transition: box-shadow 0.3s ease;
            }
            .book-title {
                font-weight: bold;
                margin-top: 10px;
            }

            .book-author {
                color: #888;
            }

            .book-category {
                color: #888;
            }

            .button-group {
                margin-top: 10px;
            }
            .card-hov:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng khi di chuột vào */
            }

            /* Hiệu ứng đổ bóng cho nút */
            .btn {
                transition: box-shadow 0.3s ease; /* Tạo hiệu ứng chuyển đổi mượt mà */
            }

            .btn:hover {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng khi di chuột vào */
            }
            /* toast */
        </style>
    </head>
    <body  style="background-color: #77B0AA">
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>

            <script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script>
        </c:if>
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="banner_slider owl-carousel">
                            <div class="single_banner_slider">
                                <div class="row">
                                    <div class="col-lg-5 col-md-8">
                                        <div class="banner_text">
                                            <div class="banner_text_iner">
                                                <h1>Read & Feeling</h1>
                                                <p>Incididunt ut labore et dolore magna aliqua quis ipsum
                                                    suspendisse ultrices gravida. Risus commodo viverra</p>
                                                <a href="#" class="btn_2">buy now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner_img d-none d-lg-block">
                                        <img src="img/banner.png" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="slider-counter"></div>
                        </div>
                    </div>
                </div>
        </section>
        <hr/>
        <br/>
        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <!-- Start recent book -->
        <div class="container">
            <h1 class="text-center">Recent Book</h1>
            <div class="row">
                <%
                    BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
                    List<BookDtls> recentBooks = dao.getRecentBook();
                    for (BookDtls book : recentBooks) {
                %>
                <div class="col-md-3">
                    <div class="card card-hov">
                        <div class="card-body text-center">
                            <div class="book-image">
                                <img alt="" src="books/<%=book.getPhotoName()%>" class="img-thumbnail">
                            </div>
                            <p class="book-title"><%=book.getBookName()%></p>
                            <p class="book-author"><%=book.getAuthor()%></p>
                            <p class="book-category">Category: <%=book.getBookCategory()%></p>
                            <div class="button-group">
                                <%
                                    if (book.getBookCategory().equals("Old")) {
                                %>
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                                <%} else {
                                    if (u == null) {
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i></a>
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                                <%
                                } else {
                                %>
                                <a href="cartServlet?id=<%=book.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i></a>
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                                <%
                                    }
                                %>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>   
            </div>
            <div class="text-center mt-2">
                <a href="all_recent_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- End recent book -->
        <hr>
        <!-- Start new book -->
        <<div class="container">
            <h1 class="text-center">New Book</h1>
            <div class="row">
                <%
                    List<BookDtls> newBooks = dao.getNewBook();
                    for (BookDtls book : newBooks) {
                %>
                <div class="col-md-3">
                    <div class="card card-hov">
                        <div class="card-body text-center">
                            <div class="book-image">
                                <img alt="" src="books/<%=book.getPhotoName()%>" class="img-thumbnail">
                            </div>
                            <p class="book-title"><%=book.getBookName()%></p>
                            <p class="book-author"><%=book.getAuthor()%></p>
                            <p class="book-category">Category: <%=book.getBookCategory()%></p>
                            <div class="button-group">
                                <% if (u == null) {%>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i></a>
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                                <% } else {%>
                                <a href="cartServlet?id=<%=book.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i></a>
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <div class="text-center mt-2">
                <a href="all_new_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- End new book -->
        <hr>
        <!-- Start old book -->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    List<BookDtls> oldBooks = dao.getOldBook();
                    for (BookDtls book : oldBooks) {
                %>
                <div class="col-md-3">
                    <div class="card card-hov">
                        <div class="card-body text-center">
                            <div class="book-image">
                                <img alt="" src="books/<%=book.getPhotoName()%>" class="img-thumbnail">
                            </div>
                            <p class="book-title"><%=book.getBookName()%></p>
                            <p class="book-author"><%=book.getAuthor()%></p>
                            <p class="book-category">Category: <%=book.getBookCategory()%></p>
                            <div class="button-group">
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
            <div class="text-center mt-2">
                <a href="all_old_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
            <br/>
        <!-- End old book -->
    </body>
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
