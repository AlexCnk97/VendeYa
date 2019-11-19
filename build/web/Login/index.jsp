<%-- 
    Document   : Login
    Created on : 09-29-2019, 07:26:38 PM
    Author     : cnk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google" content="notranslate">
        <jsp:include page="../headers/css.jsp"/>
        <title>VendeYa! | Login</title>
    </head>

    <body style="background: url(./img/bg.jpg) fixed no-repeat;">

        <%///Obtenemos el puerto
            int port = request.getServerPort();
        %>
        <input id="port" type="hidden" value="<%=port%>"/>

        <!--Formulario de login-->
        <div class="modal-dialog text-center">
            <div class="col-sm-10 main-content">
                <div class="modal-content">
                    <div class="col-12 logo">
                        <img class="img-fluid" src="./img/logo.png">
                    </div>
                    <div class="modal-header">
                        <h4 class="modal-title">Inicio de Sesión.</h4>
                    </div>

                    <form class="col-12">
                        <div id="Caja2">
                            <br>
                            <span id="mensaje" class="text-danger"></span>
                            <div class="form-group " id="user-group">
                                <input id="Usuario" type="email" class="form-control" placeholder="Correo Electrónico"
                                       required>
                            </div>
                            <div class="form-group " id="password-group">
                                <input id="Password" type="password" class="form-control" placeholder="Contraseña"
                                       required>
                            </div>
                            <button id="Iniciar" type="submit" class="btn btn-primary">
                                Iniciar Sesion.</button>
                        </div>
                    </form>
                    <div class="col-12 register">
                        <br>
                        <br>
                        <a href="../Registrar/">¿No tienes Cuenta? ¡Registrate ya!</a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../headers/javascript.jsp"/>
        <script src="../js/login.js"></script>
</html>
