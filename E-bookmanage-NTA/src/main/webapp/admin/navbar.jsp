<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid" style="height: 5px; background-color: #d81b60"></div>
<div class="container-fluid p-3" style="background-color: #fff0fe">
    <div class="row">
        <div class="col-md-3 text-custom">
            <h3>
                <i class="fa-solid fa-book"></i> Ebook
            </h3>
        </div>
        <div class="col-md-6" style="z-index: -2">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-custom my-2 my-sm-0 text-white" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-3">
            <c:if test="${not empty userobj}">
                <a href="" class="btn btn-custom text-white"><i class="fa-solid fa-user-tie"></i> ${ userobj.name }</a>
                <a class="btn text-white" style="background-color: #ab47bc" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="../login.jsp" class="btn btn-custom text-white"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="../register.jsp" class="btn text-white" style="background-color: #ab47bc"><i class="fa-solid fa-user-plus"></i> Register</a>
            </c:if>    

        </div>
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
                    <i class="fa-regular fa-face-sad-tear fa-5x text-custom"></i>
                    <h4 class="mt-2">Do you want logout</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../logout" type="button" class="btn text-white" style="background-color: #ab47bc">Logout</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--End logout modal-->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand text-white" href="../index.jsp"><i class="fa-solid fa-house fa-2x"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>