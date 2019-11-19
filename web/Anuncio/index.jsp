<%-- 
    Document   : index
    Created on : 07-nov-2019, 12:01:41
    Author     : César
--%>
<%@page import="Cuenta.CuentaDAO"%>
<%@page import="Cuenta.Cuenta"%>
<%@page import="Usuario.Usuario"%>
<%@page import="Publicacion.Publicacion"%>
<%@page import="Publicacion.PublicacionDAO"%>
<%@page import="Categoria.SubCategoria"%>
<%@page import="Categoria.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Articulo.ArticuloDAO"%>
<%@page import="Articulo.Articulo"%>
<%
    ///Instancias para visualizar el Articulo solicitado
    int idArticulo = Integer.parseInt(request.getParameter("idArticulo"));
    Articulo articulo = new Articulo();
    ArticuloDAO DAO = new ArticuloDAO();
    articulo = DAO.LeerArticulo(idArticulo);
    CategoriaDAO cat = new CategoriaDAO();
    PublicacionDAO pub = new PublicacionDAO();
    SubCategoria sub = new SubCategoria();
    //Obtenemos las subcategorias
    sub = cat.leerSubCategoria(articulo.getSubCategoria().getIdCat());

    ///Listamos las imagenes
    ArrayList<String> list = articulo.getImagesList();

    ///Accedemos a la publicacion junto con su articulo y Usuario
    Publicacion publicacion = new Publicacion();
    publicacion = pub.LeerPublicacion(idArticulo);

    CuentaDAO ctDao = new CuentaDAO();
    Cuenta cuenta = ctDao.LeerCuenta(publicacion.getCuenta().getIdCuenta());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VendeYa! | <%= articulo.getNombre()%></title>
        <jsp:include page="../headers/css.jsp"/>

    </head>
    <body>
        <jsp:include page="../headers/navbarquestions.jsp" />


        <!--Modal para imagenes-->


        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="background: #000;">
                    <div id="carouselExampleCaptions" class="carousel slide justify-content-start align-items-start" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <%for (int i = 0; i < list.size(); i++) {%>
                            <%if (i != 0) {%>
                            <li data-target="#carouselExampleCaptions" data-slide-to="<%=i%>"></li>
                                <%} else {%>
                            <li data-target="#carouselExampleCaptions" data-slide-to="<%=i%>" class="active"></li>
                                <%}%>
                                <%}%>
                        </ol>
                        <div class="carousel-inner" data-toggle="modal" data-target=".bd-example-modal-xl">
                            <%for (int i = 0; i < list.size(); i++) {%>
                            <%
                                String str = list.get(i);
                                if (list.get(i) != "unknown") {

                                    int pos = (str).lastIndexOf("/");
                                    String ch = "%2F";
                                    str = str.substring(0, pos)
                                            + ch
                                            + str.substring(pos + 1);
                                }

                            %>
                            <%if (i != 0) {%>

                            <div class="carousel-item">
                                <img src="<%=str%>" style="padding-left:  100px; padding-right: 100px;"class="d-block w-100" alt="..." width="350px" height="600px">
                                <div class="carousel-caption d-none d-md-block">

                                </div>
                            </div>
                            <%} else {%>
                            <div class="carousel-item active">
                                <img src="<%=str%>" style="padding-left: 100px; padding-right: 100px;" class="d-block w-100" alt="..." width="350px" height="600px">
                                <div class="carousel-caption d-none d-md-block">

                                </div>
                            </div>
                            <%}%> 
                            <%}%>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12 col-12">
                    <div class="card bg-white pl-2 pr-2 shadow p-3 mb-5  rounded">
                        <div class="card-body">
                            <div class="row">
                                <div class="row">
                                    <div class="pl-4 col-4">
                                        <img src="<%=cuenta.getFoto()%>" alt="User Foto" class=" rounded-circle" width="50px" height="50px">
                                    </div>
                                    <div class="col-8">
                                        <span class=""><%=cuenta.getUser().getNombre()%></span><br>

                                        <span class="badge badge-primary">Enviar Mensaje

                                        </span>
                                        <%--cuenta.getUser().getNumero()--%>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-6">
                                    <h5 class="float-left card-title"><%= articulo.getNombre()%></h5>
                                </div>
                                <div class="col-sm-6">
                                    <h5 class="float-right card-title">$<%= articulo.getPrecio()%></h5>
                                </div>
                            </div>
                            <p class="card-text text-justify">
                                <%= articulo.getDescripcion()%>
                            </p>
                            <div class="row">
                                <div class="col-sm-6">
                                    <p class="float-left card-text">
                                        <i class="far fa-clock"></i>
                                        <small class="pl-1 text-muted" id="date"><%= publicacion.getFecha_pos()%></small>
                                    </p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="card-text">
                                        <small class="float-right pl-1 text-muted"><%= publicacion.getUbicacion()%></small>
                                        <i class="float-right fas fa-map-marker-alt"></i>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="bd-example">
                            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">

                                <div class="carousel-inner" data-toggle="modal" data-target=".bd-example-modal-lg">
                                    <%for (int i = 0; i < list.size(); i++) {%>
                                    <%

                                        String str = list.get(i);
                                        if (list.get(i) != "unknown") {
                                            int pos = (str).lastIndexOf("/");
                                            String ch = "%2F";
                                            str = str.substring(0, pos)
                                                    + ch
                                                    + str.substring(pos + 1);
                                        }

                                    %>
                                    <%if (i != 0) {%>
                                    <div class="carousel-item">
                                        <img src="<%=str%>" class="d-block w-100" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                    <%} else {%>
                                    <div class="carousel-item active">
                                        <img src="<%=str%>" class="d-block w-100" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                    <%}%>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 col-12">
                    <div class="list-group">
                        <h5>Sugerencias</h5>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <p class="">
                                <span style="margin-top: 130px" class="badge badge-dark position-absolute">$5700</span>
                                <img style="object-fit:cover" src="https://scontent.fsal2-1.fna.fbcdn.net/v/t1.0-0/s370x247/73515810_2392301434356515_2090641031442726912_n.jpg?_nc_cat=106&_nc_oc=AQmqVjvvI2geBtM83rKPmpZyzCt-McEN2KmKup1PWCzSYFgRblfxBlrHg6erRlK_BdQ&_nc_ht=scontent.fsal2-1.fna&oh=693c39103cf6d3efbc838afe7f0b1418&oe=5E4ACD90" alt="" width="100%" height="150px">
                            </p>
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="card-title text-dark mb-1">NISSAN SENTRA S 2016</h5>

                            </div>
                            <small>Hace 3 dias · Apaneca,Sonsonate</small>
                        </a>


                    </div>
                </div>
            </div>
        </div>






        <!--JavaScript-->
        <jsp:include page="../headers/javascript.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
        <script>
            moment.locale('es');
            var fecha = moment($("#date").text());
            var tiempoTranscurrido = moment(fecha, "YYYYMMDD").fromNow();
            $("#date").text(tiempoTranscurrido);
        </script>
    </body>
</html>
