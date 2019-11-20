<%-- 
    Document   : navbar
    Created on : 10-02-2019, 06:07:53 PM
    Author     : cnk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Navbar-->
<nav class="navbar navbarMine navbar-expand-lg navbar-dark bg-primary py-1">
    <div class="container">
        <a data-toggle="tooltip" data-placement="right" title="VendeYa!" class="navbar-brand mr-5" href="<%=request.getContextPath()%>/">
            <img src="../img/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            VendeYa!

        </a>


        <button hidden class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
                aria-controls="navbarTogglerDemo02" aria-expanded="true" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse show" id="navbarTogglerDemo02">
            <form class="navbar-toggler" action="#" method="POST"
                  class="form-inline my-1 my-lg-2 ml-auto justify-content-center align-self-center">
                <input class="form-control mr-sm-3 py-1 pr-5" type="search" placeholder="Buscá tu Articulo">
                <button hidden="" data-toggle="tooltip" data-placement="top" title="Buscar"
                        class="btn btn-light btn-outline-none my-2 my-sm-2 " type="submit">Buscar</button>
            </form>
            <ul class="d-flex justify-content-around navbar-nav  mt-lg-0 ml-auto text-center list-group list-group-horizontal ">
                <li class="nav-item active mr-2">
                    <a data-toggle="tooltip" data-placement="top" title="Inicio" class="nav-link"
                       href="<%=request.getContextPath()%>/">
                        <span class="d-none d-sm-block">Inicio</span>
                        <i style="font-size: 1.5em" class="d-none d-block d-sm-none fas fa-home mr-3 ml-3"></i>
                    </a>
                </li>
                <li class="nav-item active mr-2">
                    <a data-toggle="tooltip" data-placement="top" title="Vender" class="nav-link"
                       href="../Vender/">
                        <span class="d-none d-sm-block">Vender</span>
                        <i style="font-size: 1.5em" class="d-none d-block d-sm-none fas fa-cart-plus mr-3 ml-3"></i>
                    </a>
                </li>
                <li class="nav-item active mr-2">
                    <a data-toggle="tooltip" data-placement="top" title="¿Preguntas?" class="nav-link"
                       href="../Preguntas/">
                        <span class="d-none d-sm-block">Preguntas</span>
                        <i style="font-size: 1.5em" class="d-none d-block d-sm-none fas fa-question-circle mr-3 ml-3"></i>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%if (session.getAttribute("usuario") != null) {
                                    String user = (String) session.getAttribute("usuario");%>
                            <%=user%>
                            <%} else {%>
                            Cuenta
                            <%}%>
                    </a>
                    <div class="dropdown-menu position-absolute" aria-labelledby="navbarDropdown">
                        <%if (session.getAttribute("usuario") != null) {%>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/Profile/">Mi perfil</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/CerrarSesion">Cerrar Sesion</a>
                            <%} else {%>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/Login">Iniciar Sesion</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/Registrar">Registrarse</a>
                            <%}%>
                    </div>
                </li>
            </ul>
                            <form action="<%=request.getContextPath()%>/Search" method="get"
                                  class="d-none d-xl-block d-lg-block d-xl-none  form-inline my-2 my-lg-2 ml-auto justify-content-center align-self-center">
                                <input name="query" class="form-control mr-sm-3 py-1 pr-5" type="search" placeholder="Buscá tu Articulo">
                                <input name="category" value="" type="hidden">
                                <input name="page" value="" type="hidden">
                                <button  data-toggle="tooltip" data-placement="top" title="Buscar"
                                         class="btn btn-light btn-outline-none my-2 my-sm-2 " type="submit">Buscar</button>
                            </form>
        </div>
    </div>
</nav>
