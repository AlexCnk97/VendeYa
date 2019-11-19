<%-- 
    Document   : index
    Created on : 10-08-2019, 10:39:54 PM
    Author     : cnk
--%>

<%@page import="Categoria.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Categoria.GetCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="./header/css.jsp"/>
        <title>VendeYa | Vender</title>  
    </head>

    <body>
        <%
            int port = request.getServerPort();
        %>
        <input id="port" type="hidden" value="<%=port%>"/>

        <div id="publicando" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content" id="Content">
                    <div class="alert alert-success" role="alert">
                        <div class="spinner-grow" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                        <span id="MessagePost">Publicando Anuncio...</span>

                    </div>
                </div>
            </div>
        </div>
        <div id="imagesURL">
            <ul id="list">

            </ul>
        </div>

        <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-interval="10000">
                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12" style="padding: 50px;">
                            <h5 class="text-muted position-fixed"><a href="../">X</a> Publicar Articulo(paso 1 de 4)</h5>
                            <br><br><br><br><br>
                            <p class="h1">Empieza por ponerle un titulo al anuncio</p>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <input type="text" class="form-control form-control-lg" id="colFormLabelLg"
                                           placeholder="Introduce el titulo de tu anuncio">
                                </div>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                <label class="form-check-label" for="defaultCheck1">
                                    Acepto los <a href="#">terminos y condiciones</a>
                                </label>
                            </div>
                            <br>
                            <button id="next1" disabled="true" type="button" class="btn btn-secondary btn-lg" href="#carouselExampleInterval" role="button"
                                    data-slide="next">
                                Continuar
                            </button>
                        </div>
                        <div class="col-sm-12 col-lg-6 col-md-12 position-relative">

                            <img class="img-fluid d-md-none d-lg-block d-sm-none d-md-block" src="https://cdn.lynda.com/course/383551/383551-636410925018252700-16x9.jpg">

                        </div>
                    </div>
                </div>
                <div class="carousel-item" data-interval="2000">
                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12" style="padding: 50px;">
                            <h5 class="text-muted position-fixed"><a href="../">X</a> Publicar Articulo(paso 2 de 4)</h5>
                            <br><br><br><br><br>
                            <p class="h1">Agrega el precio y una breve descripcion</p>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <input id="price" type="number" class="form-control" aria-label="Amount (to the nearest dollar)">
                            </div>
                            <div class="form-group">
                                <textarea id="desc" placeholder="Describe tu articulo" class="form-control" id="exampleFormControlTextarea1"
                                          rows="3"></textarea>
                            </div>

                            <br>
                            <button type="button" class="btn btn-light" href="#carouselExampleInterval" role="button" data-slide="prev">
                                Anterior
                            </button>
                            <button id="next2" disabled="true"  type="button" class=" float-right btn btn-secondary btn-lg" href="#carouselExampleInterval"
                                    role="button" data-slide="next">
                                Continuar
                            </button>
                        </div>
                        <div class="col-sm-12 col-lg-6 position-relative">

                            <img class="img-fluid d-md-none d-lg-block d-sm-none d-md-block" src="https://actitudvisual.com.ar/wp-content/uploads/2017/09/Ecommerce-2-1.png">

                        </div>
                    </div>
                </div>
                <div class="carousel-item" data-interval="2000">
                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12" style="padding: 50px;">
                            <h5 class="text-muted position-fixed"><a href="../">X</a> Publicar Articulo(paso 3 de 4)</h5>
                            <br><br>
                            <p class="h1">Elige la categoria</p>
                            <br>
                            <%
                                GetCategorias gc = new GetCategorias();
                                ArrayList<Categoria> lstC = gc.getAllCategorias();
                            %>
                            <div class="row">
                                <div class="col-7">
                                    <div class="list-group" id="list-tab" role="tablist">
                                        <%for (int i = 0; i < lstC.size(); i++) {%>                  
                                        <a onclick="getInfo(this)" class="list-group-item list-group-item-action" id="<%=lstC.get(i).getNombre()%>" data-toggle="list"
                                           href="#list-<%=lstC.get(i).getNombre()%>" role="tab" aria-controls="<%=lstC.get(i).getNombre()%>"><%=lstC.get(i).getNombre()%></a>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="tab-content" id="nav-tabContent">
                                        <%for (int i = 0; i < lstC.size(); i++) {%>


                                        <div class="tab-pane fade show" id="list-<%=lstC.get(i).getNombre()%>" role="tabpanel"
                                             aria-labelledby="list-<%=lstC.get(i).getNombre()%>-list">
                                            <div class="form-group">
                                                <label for="example<%=lstC.get(i).getNombre()%>"></label>
                                                <select class="form-control" id="example<%=lstC.get(i).getNombre()%>">
                                                    <option>Elegir...</option>
                                                    <%for (int j = 0; j < lstC.get(i).getSubcategoriaList().size(); j++) {%>
                                                    <option value="<%=lstC.get(i).getSubcategoriaList().get(j).getIdCat()%>">
                                                        <%=lstC.get(i).getSubcategoriaList().get(j).getNom()%>
                                                    </option>

                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <%}%>
                                        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...
                                        </div>
                                        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...
                                        </div>
                                    </div>
                                    <br><br>
                                    <button type="button" class="btn btn-light" href="#carouselExampleInterval" role="button" data-slide="prev">
                                        Anterior
                                    </button>
                                    <button id="next3" type="button" disabled="true"  class=" float-right btn btn-secondary btn-lg" href="#carouselExampleInterval"
                                            role="button" data-slide="next">
                                        Continuar
                                    </button>
                                </div>
                            </div>
                            <br>

                        </div>
                        <div class="col-sm-12 col-lg-6 position-relative">

                            <img class="img-fluid d-md-none d-lg-block d-sm-none d-md-block" src="https://www.ascommultiservice.it/wp-content/uploads/2013/09/voucher-01.png">

                        </div>
                    </div>
                </div>
                <div class="carousel-item" data-interval="2000">
                    <div class="row">
                        <div class="col-sm-7" style="padding: 50px;">
                            <h5 class="text-muted position-fixed"><a href="../">X</a> Publicar Articulo(paso 4 de 4)</h5>
                            <br><br>
                            <p class="h1">Agrega fotos de tu articulo y la ubicacion</p>
                            <div>
                                <i class="material-icons">room</i>
                                <a href="#" onclick="showPosition()">Agregar ubicacion</a>
                            </div>
                            <div id='map'></div>
                            <br>
                            <button type="button" class="btn btn-light" href="#carouselExampleInterval" role="button" data-slide="prev">
                                Anterior
                            </button>
                            <button id="publicar" disabled="true"  type="button" class=" float-right btn btn-secondary btn-lg" href="#carouselExampleInterval"
                                    role="button" data-slide="next">
                                Publicar
                            </button>
                        </div>

                        <div class="col-sm-12 col-lg-5 ">
                            <br>
                            <div  style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img1"  width="145px" height="145px">



                                        <button id="btn1" type="button" class="ml-2 mb-1 close align-self-start"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img2" width="145px" height="145px">



                                        <button id="btn2" type="button" class="ml-2 mb-1 close align-self-start" 
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div  style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img3" width="145px" height="145px">



                                        <button id="btn3" type="button" class="ml-2 mb-1 close align-self-start" 
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img4" width="145px" height="145px">



                                        <button id="btn4" type="button" class="ml-2 mb-1 close align-self-start" 
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img5" width="145px" height="145px">

                                        <button id="btn5" type="button" class="ml-2 mb-1 close align-self-start" 
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 200px; height: 200px;" class="float-left mr-3">
                                <div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
                                    <div class="toast-header">

                                        <img src="https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg"
                                             class="rounded mr-2 imgs" alt="..." id="img6" width="145px" height="145px">



                                        <button id="btn6" type="button" class="ml-2 mb-1 close align-self-start" 
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <input type="file" id="file1" hidden>
                            <input type="file" id="file2" hidden>
                            <input type="file" id="file3" hidden>
                            <input type="file" id="file4" hidden>
                            <input type="file" id="file5" hidden>
                            <input type="file" id="file6" hidden>
                            <!--Alerta de formato-->
                            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Error de formato</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>No se permite formatos diferentes de JPG,JPEG,PNG,GIF</p>
                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/Hash.js"></script>                                      
        <!-- The core Firebase JS SDK is always required and must be listed first -->
        <script src="https://www.gstatic.com/firebasejs/7.2.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/6.2.3/firebase-storage.js"></script>
        <jsp:include page="./header/javascript.jsp"/>
        <script type="text/javascript">
                                    $('.carousel').carousel({
                                        pause: true,
                                        interval: false,
                                        wrap: false
                                    });
                                    $('.toast').toast('show');

        </script>



    </body>

</html>
