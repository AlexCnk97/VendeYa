
<%@page import="Publicacion.Publicacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Cuenta.CuentaDAO"%>
<%@page import="Usuario.Usuario"%>
<%@page import="Cuenta.Cuenta"%>
<%
    Cuenta ct = new Cuenta();
    ct = (Cuenta) request.getSession().getAttribute("cuentaObjeto");
    Usuario user = (Usuario) request.getSession().getAttribute("usuarioObjeto");

    CuentaDAO ctDao = new CuentaDAO();
    ArrayList<Publicacion> listPos = ctDao.leerPublicacion(ct);

    ///Crearemos una lista donde se imprimiran las publicaciones vendidas...
    ArrayList<Publicacion> listVend = ctDao.leerPublicacionVendida(ct);


%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google" content="notranslate">
        <jsp:include page="../headers/profile.jsp"/>
        <title>VendeYa! | <%=user.getNombre()%></title>
    <input id="id" type="hidden" value="<%=user.getIdUsuario()%>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
</head>

<body>
    <%///Obtenemos el puerto
        int port = request.getServerPort();
    %>
    <input id="port" type="hidden" value="<%=port%>"/>
    <!--Navbar-->
    <jsp:include page="../headers/navbarquestions.jsp" />
    <!--Modal-->
    <div id="OptionModal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content" id="ModalOptions">

            </div>
        </div>
    </div>

    <%--Modal para los vendidos--%>
    <div id="Mi-Modal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">   
            <div class="modal-content" id="ModalVendidos">


            </div>
        </div>

    </div>

    <%--Modal para actualizar--%>
    <div class="modal fade" id="Mi-Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleModal"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="Actualizar">

                </div>
            </div>
        </div>
    </div

    <br>
    <div class="card text-center mr-2 ml-2">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs" id="nav-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#Activos" role="tab" aria-controls="home" aria-selected="true">
                        Mis anuncios
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#Vendidos" role="tab" aria-controls="profile" aria-selected="false">
                        Vendidos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats" role="tab" aria-controls="chats" aria-selected="false">
                        Chats
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
                        Mis Datos
                    </a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="Activos" role="tabpanel" aria-labelledby="home-tab">
                    <div class="jumbotron">
                        <div class="row">
                            <%if (listPos.isEmpty()) {%>
                            <div class="col-12 alert alert-info text-muted" role="alert">
                                No has hecho un anuncio
                            </div>
                            <%} else {
                                    for (int i = 0; i < listPos.size(); i++) {%>
                            <div class="col-12 col-sm-6 col-md-12 col-lg-6 col-xl-6 my-2">
                                <div class="card mb-3" style="width: 100%">
                                    <div class="row no-gutters">
                                        <div class="col-md-6">
                                            <a style="padding: 2px; opacity: 1px" onclick="showOptions(<%=listPos.get(i).getArticulo().getIdArticulo()%>)" href="#" class="bg-light my-2 mx-2 position-absolute" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                <i style="font-size: 1.5em" class="text-primary fas fa-ellipsis-v"></i>
                                            </a>
                                            <%
                                                String str = listPos.get(i).getArticulo().getImagesList().get(0);
                                                int pos = (listPos.get(i).getArticulo().getImagesList().get(0)).lastIndexOf("/");
                                                String ch = "%2F";
                                                str = str.substring(0, pos)
                                                        + ch
                                                        + str.substring(pos + 1);

                                            %>
                                            <img style="max-height: 180px; object-fit: cover;" src="<%=str%>" class="card-img-top" height="100%" alt="...">

                                        </div>
                                        <div class="col-md-6">
                                            <div class="card-body">
                                                <span class="badge badge-primary float-left">Titulo:</span><br>
                                                <span  class="text-muted float-left "><%=listPos.get(i).getArticulo().getNombre()%></span><br>
                                                <span class="badge badge-primary float-left">Categoria:</span><br>
                                                <span  class="text-muted float-left "><%=listPos.get(i).getArticulo().getSubCategoria().getNom()%></span><br>
                                                <span class="badge badge-primary float-left">Publicado:</span><br>
                                                <span  class="text-muted float-left date">
                                                    <script>

                                                        moment.locale('es');
                                                        var date = "<%=(listPos.get(i).getFecha_pos()).replace(".0", "")%>";
                                                        var fromNow = moment(date, "YYYY-MM-DD HH:mm:ss").fromNow();
                                                        document.getElementsByClassName('date')[<%=i%>].innerHTML = fromNow;

                                                    </script>
                                                </span><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                    }%>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade show" id="Vendidos" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="jumbotron">
                        <div class="row">
                            <%if (listVend.isEmpty()) {%>
                            <div class="col-12 alert alert-info text-muted" role="alert">
                                No has Vendido ningun Articulo.
                            </div>
                            <%} else {
                                    for (int i = 0; i < listVend.size(); i++) {%>
                            <div class="col-12 col-sm-6 col-md-12 col-lg-6 col-xl-6 my-2">
                                <div class=" bg-secondary card mb-3" style="width: 100%">
                                    <div class="row no-gutters">
                                        <div class="col-md-6">
                                            <a style="padding: 3px;"  onclick="VerOpciones(<%=listVend.get(i).getArticulo().getIdArticulo()%>)" href="#" class="bg-secondary mx-2 my-2 position-absolute" data-toggle="modal" data-target="#Mi-Modal">
                                                <i style="font-size: 1.2em;" class="text-light fas fa-trash-alt"></i>
                                            </a>
                                            <%
                                                String str = listVend.get(i).getArticulo().getImagesList().get(0);
                                                int pos = (listVend.get(i).getArticulo().getImagesList().get(0)).lastIndexOf("/");
                                                String ch = "%2F";
                                                str = str.substring(0, pos)
                                                        + ch
                                                        + str.substring(pos + 1);

                                            %>
                                            <img style="max-height: 180px; object-fit: cover;" src="<%=str%>" class="card-img-top" height="100%" alt="...">

                                        </div>
                                        <div class="col-md-6">
                                            <div class="card-body">
                                                <span class="badge badge-light float-left">Titulo:</span><br>
                                                <span  class="text-light float-left "><%=listVend.get(i).getArticulo().getNombre()%></span><br>
                                                <span class="badge badge-light float-left">Categoria:</span><br>
                                                <span  class="text-light float-left "><%=listVend.get(i).getArticulo().getSubCategoria().getNom()%></span><br>
                                                <span class="badge badge-light float-left ">Publicado:</span><br>
                                                <span  class="text-light float-left date">
                                                    Vendido.
                                                </span><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                    }%>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="chats" role="tabpanel" aria-labelledby="chats-tab">
                    <div class="alert alert-info text-muted" role="alert">
                        No tienes mensajes
                    </div>
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="jumbotron">
                        <div class="row">
                            <div class="col-3 col-lg-3 col-md-3 col-sm-12 d-flex flex-column">
                                <div class="row">
                                    <img  width="200px" height="200px" src="<%=ct.getFoto()%>" alt="Image User" class=" img-fluid img-thumbnail rounded-circle">
                                </div>
                                <div class="row">
                                    <a class="ml-5"href="#">Cambiar foto</a>
                                </div>

                            </div>
                            <div class="col-9 col-lg-9 col-md-9 col-sm-12">
                                <h5 class="float-left ">Datos de Cuenta</h5>
                                <br>
                                <hr class="clearfix">
                                <span class="float-left px-2 ">Nombre Usuario:</span>
                                <span class="float-left text-muted"><%=user.getNombre()%></span>
                                <a href="#" class="float-left px-3" onclick="actualizar(1)" data-toggle="modal" data-target="#Mi-Modal2">Cambiar</a>
                                <br>
                                <span class="float-left px-2 ">Password:</span>
                                <span class="float-left text-muted">********</span>
                                <a href="#" class="float-left px-3" onclick="actualizar(2)"data-toggle="modal" data-target="#Mi-Modal2">Cambiar</a>
                                <br>
                                <span class="float-left px-2 ">Contacto:</span>
                                <span class="float-left text-muted"><%=user.getNumero()%></span>
                                <a href="#" class="float-left px-3" onclick="actualizar(3)"data-toggle="modal" data-target="#Mi-Modal2">Cambiar</a>
                            </div>
                        </div>
                    </div>
                </div>
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
    <script src="main.js"></script>
    <script src="Vendido.js"></script>
    <script src="Actualizar.js"></script>
</body>

</html>