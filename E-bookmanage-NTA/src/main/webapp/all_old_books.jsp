<%-- 
    Document   : all_old_books
    Created on : Apr 11, 2024, 11:35:01 PM
    Author     : Admin
--%>

<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Books</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
        <style>.card {
                width: 300px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                margin-bottom: 20px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                overflow: hidden;
            }

            .card:hover {
                transform: translateY(-5px); /* Hiệu ứng dịch chuyển khi di chuột vào */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
            }

            .card-body {
                padding: 20px;
            }

            .btn-add-to-cart {
                transition: transform 0.3s ease;
            }

            .btn-add-to-cart:hover {
                transform: scale(1.1); /* Hiệu ứng phóng to khi di chuột vào */
            }</style>
    </head>
    <body>
        <div class = "container-fluid">
            <div class = "row">
                <%
                    BookDAOImp dao = new BookDAOImp(DBConnect.getConnect());
                    List<BookDtls> books = dao.getAllOldBook();
                    for (BookDtls book : books) {
                %>
                <div class="col-md-3">
                    <div class="card card-hov">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=book.getPhotoName()%>" style="width: 200px; height: 250px" class="img-thumblin">
                            <p><%=book.getBookName()%></p>
                            <p><%=book.getAuthor()%></p>
                            <p>Categorie: <%=book.getBookCategory()%></p>
                            <div class="row">
                                <a href="book_detail.jsp?id=<%=book.getId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-2">$<%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>

                </div> 
                <%
                    }
                %>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>