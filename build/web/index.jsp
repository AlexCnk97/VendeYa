<%-- 
    Document   : index.jsp
    Created on : 09-29-2019, 01:57:44 PM
    Author     : cnk
--%>
<%@page import="Categoria.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Categoria.CategoriaDAO"%>
<%@page import="Categoria.GetCategorias"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google" content="notranslate">
        <jsp:include page="./headers/css.jsp"/>
        <title>VendeYa! SV </title>
    </head>

    <body>
        <jsp:include page="./headers/navbar.jsp" />
        <!--Header-->
        <header class="main-header" style="background: url(./img/bg-main2.jpeg);">
            <div class="background-overlay text-white py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-center justify-content-center align-self-center ">
                            <h1 class="font-italic">¿QUERÉS VENDER Y COMPRAR POR INTENET?</h1>
                            <br>
                            <h2>VendeYa! ¡Es tu Mejor Opción!</h2>
                            <h3>Publicá Tu Artículo con Nosotros y verás la
                                Diferencia.</h3>
                            <a href="./Vender" data-toggle="tooltip" data-placement="right" title="Comenzar!"
                               class=" mt-3 btn btn-primary btn-outline-none btn-lg text-white">Comenzá ya</a>
                        </div>
                        <div class="col-md-6 justify-content-center align-self-center py-5">
                            <img class="img-fluid img-fluido" src="img/Compra.jpg">
                            <div class="container mt-auto">
                                <div class="row text-center">
                                    <div class="col-6 justify-content-center align-self-center">
                                        <a class=" text-center text-white " href="#">Políticas y Términos de uso.</a>
                                    </div>
                                    <div class="col-6 justify-content-center align-self-center">
                                        <a class=" text-center text-white" href="#">Condiciones.</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!--CATEGORIES-->
        <div class="container">
            <div class="row container">
                <h2 class="py-5 font-italic">Encontrá lo que Buscás en Todas
                    Nuestras Categorías.</h2>
            </div>
            <div class="row">
                <%--Categorias--%>

                <%
                    GetCategorias gc = new GetCategorias();
                    ArrayList<Categoria> lstC = gc.getAllCategorias();
                %>
                <%for (int i = 0; i < lstC.size(); i++) {%>
                <div class="col-lg-3 col-sm-6 mb-5">
                    <div class="card text-center">
                        <div class="card-body">
                            <i class="<%=lstC.get(i).getImg()%>"></i>
                            <h5 class="card-title"> <%=lstC.get(i).getNombre()%> </h5>
                            <p class="card-text"><%=lstC.get(i).getDescripcion()%></p>

                            <form action="<%=request.getContextPath()%>/Search" method="get"
                                  class="d-none d-xl-block d-lg-block d-xl-none  form-inline my-2 my-lg-2 ml-auto justify-content-center align-self-center">
                                <input name="query" class="form-control mr-sm-3 py-1 pr-5" type="hidden">
                                <input name="category" value="<%=lstC.get(i).getIdCategoria()%>" type="hidden">
                                <input name="page" value="" type="hidden">
                                <button  data-toggle="tooltip" data-placement="top" title="Buscar"
                                         class="btn btn-primary  btn-outline-none my-2 my-sm-2 " type="submit">Ver Publicaciones</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>


            </div>
        </div>
    </div>

</div>
<br>
<br>
<br>
<jsp:include page="./headers/footer.jsp" />
<jsp:include page="headers/javascript.jsp"/>
<!--Funcion de Tooltip-->
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $('.dropdown-toggle').dropdown();
    })


</script>
</body>

</html>
