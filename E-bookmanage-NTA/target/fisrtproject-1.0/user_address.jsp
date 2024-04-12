<%-- 
    Document   : user_address
    Created on : Apr 12, 2024, 11:40:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Address</title>
        <%@include file="all_component/allCss.jsp" %>
        <%@include file="all_component/navbar.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Address</h4>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Landmark:</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">City:</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phone">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Pincode:</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phone">                                    
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
    <footer>
        <%@include file="all_component/footer.jsp" %>
    </footer>
</html>
