<%-- 
    Document   : cart
    Created on : Apr 12, 2024, 8:39:37 AM
    Author     : Admin
--%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
    </head>
    <body>
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if> 
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Cart</h3>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"></c:remove>
                            </c:if>
                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-danger">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Book</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userobj");
                                        CartDAOImp dao = new CartDAOImp(DBConnect.getConnect());
                                        List<Cart> carts = dao.getCartByUser(u.getId());
                                        int id = 1;
                                        double totalPrice = 0;
                                        for (Cart cart : carts) {
                                            totalPrice += cart.getPrice();
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=cart.getBookname()%></td>
                                        <td><%=cart.getAuthor()%></td>
                                        <td>$<%=cart.getPrice()%></td>
                                        <td><a href="delete_cart?cid=<%=cart.getCid()%>" class="btn btn-sm btn-danger text-white"><i class="fa-solid fa-trash"></i></a></td>
                                    </tr>
                                    <%
                                            id++;
                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td style="font-weight: bold;">Total Price:</td>
                                        <td></td>
                                        <td></td>
                                        <td>$<%=totalPrice%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Information</h3>
                            <c:if test="${not empty failMsg1}">
                                <p class="text-center text-danger">${failMsg1}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>
                            <form class="row g-3" action="oder" method="POST">
                                <input type="hidden" value="${userobj.id}" name="id">
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Name:</label>
                                    <input type="text" class="form-control" id="inputEmail4" value="<%=u.getName()%>" name="name" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="inputPassword4" value="<%=u.getEmail()%>" name="email" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Phone Number:</label>
                                    <input type="text" class="form-control" id="inputPassword4" value="<%=u.getPhone()%>" name="phone" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Country:</label>
                                    <input type="text" class="form-control" id="inputPassword4" value="" name="country" required>
                                </div>
                                <div class="col-12">
                                    <label for="inputAddress" class="form-label">Address:</label>
                                    <input type="text" class="form-control" id="inputAddress" value="" name="address" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputState" class="form-label">Payment Mode:</label>
                                    <select class="form-select" aria-label="Default select example" name="paymentType">
                                        <option value="CTD">Cash to delivery</option>
                                        <option value="OB">Online Banking</option>
                                    </select>
                                </div>
                                <div class="col-12 mt-4">
                                    <button type="submit" class="btn btn-success">Order Now</button>
                                    <a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
