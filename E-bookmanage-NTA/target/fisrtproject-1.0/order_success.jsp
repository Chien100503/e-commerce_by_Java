<%-- 
    Document   : order_success
    Created on : Apr 12, 2024, 5:47:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
    </head>
    <body>
        <div class="container text-center mt-3">
            <i class="fa-solid fa-circle-check text-success fa-5x"></i>
            <h2>Your order successfully!!!</h2>
            <h3>Your order will be delivered within the next few days</h3>
            <a href="my_order.jsp" class="btn btn-primary mt-3">View Orders</a>
        </div>
    </body>
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
