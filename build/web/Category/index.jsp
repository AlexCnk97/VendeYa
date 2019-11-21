<%-- 
    Document   : index
    Created on : 11-19-2019, 01:22:02 PM
    Author     : Arévalo
--%>

<%@page import="Articulo.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../headers/css.jsp"/>
        <title>VendeYa | Publicaciones</title>
        <%
            ArrayList<Articulo> list = (ArrayList<Articulo>) request.getAttribute("ArticuloList");
        %>
        <%///Obtenemos el puerto
            int port = request.getServerPort();
        %>
    </head>
    <body class="bg-light">

        <!--Navbar-->
        <jsp:include page="../headers/navbar.jsp" />

        <br><br>
        <div class="container">
            <div class="row ">

                <div class="card col-12 center">
                    <h5 class="card-header">Categoría <%=request.getParameter("category")%></h5>

                    <div class="card-body">
                        <div class="row">
                            <%if (list.isEmpty()) {%>
                            <div class="alert alert-primary col-12" role="alert">
                                Aun no se ha publicado nada, sé el primero en hacerlo!
                            </div>
                            <%} else {%>

                            <% for (int i = 0; i < list.size(); i++) {%>
                           

                            <div class="col-12 col-lg-3 col-md-3 col-sm-6 ">
                                <%
                                    String str = list.get(i).getImagesList().get(0);
                                    int pos = (list.get(i).getImagesList().get(0)).lastIndexOf("/");
                                    String ch = "%2F";
                                    str = str.substring(0, pos)
                                            + ch
                                            + str.substring(pos + 1);

                                %>
                                <a href="http://localhost:<%=port%>/VendeYa/Anuncio?idArticulo=<%=list.get(i).getIdArticulo()%>" class="text-decoration-none">
                                    <div class="card mb-3">
                                        <img style="object-fit: cover" src="<%=str%>" class="card-img-top" alt="..." width="200px" height="200px">
                                        <div class="card-body">
                                            <span class="card-title text-dark font-size"><%=list.get(i).getNombre()%></span>
                                            <p class="card-text text-dark"><span class="text-muted">
                                                    $<%=list.get(i).getPrecio()%>
                                                </span>
                                            </p>
                                            <a href="http://localhost:<%=port%>/VendeYa/Anuncio?idArticulo=<%=list.get(i).getIdArticulo()%>" class="btn btn-primary mt-3">Ver Detalles</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <%}%>

                        </div>
                    </div>

                    <div>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>

    <!--JavaScript-->
    <jsp:include page="../headers/javascript.jsp"/>
    <!--Funcion de Tooltip-->
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</body>
</html>
