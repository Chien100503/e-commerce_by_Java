<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recent Books</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
            BookDtls book = dao.getBookById(id);

            User u = (User) session.getAttribute("userobj");
        %>
        <div class="container">
            <div class="row p-5">
                <div class = "col-md-6 text-center p-5 border">
                    <image src="books/<%=book.getPhotoName()%>" style="width: 150px; height: 220px">
                </div>

                <div class = "col-md-6 text-center p-5 border">
                    <h5>Book Name: <%=book.getBookName()%></h5>
                    <h5>Author Name: <%=book.getAuthor()%></h5>
                    <h5>Category: <%=book.getBookCategory()%></h5>
                    <%
                        if (book.getBookCategory().equals("Old")) {
                    %>
                    <p style="color: red;">This product is currently no longer for sale</p>
                    <a href="index.jsp" class="btn btn-success btn-sm ml-5">Continue Shopping</a>
                    <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                    <%
                    } else {
                    %>
                    <% if (u == null) {
                    %>
                    <a href="login.jsp" class="btn btn-success btn-sm ml-5"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                    <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>   
                    <%
                    } else {
                    %>
                    <a href="cartServlet" class="btn btn-success btn-sm ml-5"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                    <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                    <%
                        }
                    %>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
