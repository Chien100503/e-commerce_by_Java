<%-- 
    Document   : all_books
    Created on : Jan 5, 2024, 6:54:11 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.OrderDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImp"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <table class="table">
            <thead class="text-white" style="background-color: #f06292">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    OrderDAOImp dao = new OrderDAOImp(DBConnect.getConnect());
                    List<OrderDtls> orders = dao.getAllOrder();
                    for (OrderDtls order : orders) {
                %>
                <tr>
                    <td><%=order.getOrderId()%></td>
                    <td><%=order.getUserName()%></td>
                    <td><%=order.getEmail()%></td>
                    <td><%=order.getAddress()%></td>
                    <td><%=order.getPhone()%></td>
                    <td><%=order.getBookName()%></td>
                    <td><%=order.getAuthor()%></td>
                    <td><%=order.getPrice()%></td>
                    <td><%=order.getPayment()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
    <footer style="margin-top: 247px">
        <%@include file="footer.jsp" %>
    </footer>
</html>