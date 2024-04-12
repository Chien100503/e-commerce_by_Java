<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="allCss.jsp" %>
<style>
    /* Thêm CSS t?i ?ây */
    .container-fluid {
        background-color: #ffcccc; /* Màu n?n t??i sáng */
        padding: 20px;
    }
    .btn-custom,
    .btn {
        background-color: #496989 !important; /* Màu nút sáng */
    }
    .navbar {
        background-color: #003C43 !important; /* Màu n?n navbar */
    }
    .header {
        background-color: #58A399;
    }
</style>
<div class="container-fluid header">
    <div class="row">
        <div class="col-md-3 text-custom">
            <h3>
                <i class="fas fa-book" style="color: #ff6f61;"></i> <a href="index.jsp">Ebook</a>
            </h3>
        </div>
        <div class="col-md-6">
             <form class="form-inline my-2 my-lg-0" action="search_result.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-custom my-2 my-sm-0 text-white button" type="submit">Search</button>
            </form>
        </div>

        <c:if test = "${empty userobj}">
            <div class="col-md-3">
                <a href="login.jsp" class="button btn text-white btn-custom"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="register.jsp" class="button btn text-white btn-custom"><i class="fas fa-user-plus"></i> Register</a>
            </div>
        </c:if>

        <c:if test = "${not empty userobj}">
            <div class="col-md-3 d-flex" style="right: 10px;">
                <a href="cart.jsp" class="btn text-white button"><i class="fas fa-shopping-cart fa-2x"></i></a>
                <a href="edit_profile.jsp" class="btn btn-custom text-white button"><i class="fas fa-user-tie"></i> ${ userobj.name }</a>
                <a class="btn text-white button" style="background-color: #ff6f61" data-toggle="modal" data-target="#exampleModalCenter"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </c:if>

    </div>
</div>
<!--Start logout modal-->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <i class="far fa-sad-tear fa-5x text-custom"></i>
                    <h4 class="mt-2">Do you want logout</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="./logout" type="button" class="btn text-white" style="background-color: #ff6f61">Logout</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--End logout modal-->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand text-white" href="index.jsp"><i class="fas fa-home fa-2x" style="color: #fff;"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item  active">
                <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown active" >
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Books
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #496989;">
                    <a style="background-color: #496989;" class="dropdown-item" href="all_recent_books.jsp">Recent Book</a>
                    <div class="dropdown-divider"></div>
                    <a style="background-color: #496989;" class="dropdown-item" href="all_new_books.jsp"></i> New Book</a>
                    <div class="dropdown-divider"></div>
                    <a style="background-color: #496989;" class="dropdown-item" disabled" href="all_old_books.jsp">Old Book</a>
                </div>
            </li>
            <c:if test = "${not empty userobj}">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown"style="background-color: #496989;">
                        <a style="background-color: #496989;"class="dropdown-item" href="edit_profile.jsp">Edit Profile</a>
                        <div class="dropdown-divider"></div>
                        <a style="background-color: #496989;"class="dropdown-item" href="user_address.jsp">My Address</a>
                        <div class="dropdown-divider"></div>
                        <a style="background-color: #496989;"class="dropdown-item" href="my_order.jsp">My Order</a>
                    </div>
                </li>
            </c:if>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fas fa-phone" style="color: #ff6f61;"></i> Contact us</button>
        </form>
    </div>
</nav>
