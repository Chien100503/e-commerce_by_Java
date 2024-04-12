<%-- 
    Document   : home
    Created on : Jan 4, 2024, 6:34:22 PM
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
    </head>
    <body>
        <h1>User Home</h1>
        <c:if test="${not empty userobj}" >
            <p class="text-center text-danger">Name: ${userobj}.name</p>
            <p class="text-center text-danger">Name: ${userobj}.email</p>
        </c:if>  
</body>
</html>
