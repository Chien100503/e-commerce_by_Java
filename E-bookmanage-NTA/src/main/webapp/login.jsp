<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="path/to/style.css">
        <%@include file="all_component/allCss.jsp"%>
        <%@include file="all_component/navbar.jsp"%>
        <style>
            .card {
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .card-body {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            /* ??nh d?ng tiêu ?? */
            h4.text-center {
                color: #333;
                font-weight: bold;
            }

            /* ??nh d?ng nút ??ng nh?p */
            .btn-custom {
                background-color: #d81b60;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }

            .btn-custom:hover {
                background-color: #c2185b;
            }

            /* ??nh d?ng liên k?t t?o tài kho?n */
            a.create-account {
                color: #d81b60;
                text-decoration: none;
            }

            a.create-account:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body style="background-color: #fff0fe">
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Login</h4>                             

                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>     
                                <c:remove var="successMsg" scope="session"></c:remove>
                            </c:if>

                            <c:if test="${not empty failMsg}" >
                                <p class="text-center text-danger">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"></c:remove>
                            </c:if>   
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email*</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password*</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                                </div>
                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-custom text-white">Login</button><br>
                                    <a href="register.jsp" class="create-account">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer style="margin-top: 125px">
            <%@include file="all_component/footer.jsp" %>
        </footer>
    </body>
</html>
