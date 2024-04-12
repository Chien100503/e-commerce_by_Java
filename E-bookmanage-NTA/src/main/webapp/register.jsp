<%-- 
    Document   : register
    Created on : Jan 4, 2024, 11:23:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
    </head>
    <body style="background-color: #fff0fe">
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Registration</h4>

                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-danger">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"></c:remove>
                            </c:if>
                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-danger">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>

                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email*</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone number*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phone">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password*</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                    <label class="form-check-label" for="exampleCheck1">I have read and agree to the Terms</label>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-custom text-white mt-2">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <<footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
