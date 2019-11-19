<%@page import="Database.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Usuario.Usuario"%>
<%@page import="Usuario.UsuarioDAO"%>
<%@page import="Registrar.Registrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//           String nombre = "Alex";
//           String numero = "76142668";
//           String email = "cnk@gmail.com";
//           String pass = "123";
//           
//           Registrar register = new Registrar(nombre,pass,email,numero);
//           
//           register.crearUsuario();
//           register.crearCuenta();
//
//            Usuario usuario =  new Usuario();
//            usuario.setNombre("Alex");
//            usuario.setPassword("123");
//            Usuario newUser = new Usuario();
//            UsuarioDAO userDao = new UsuarioDAO();
//            newUser.setCorreo((userDao.leerUsuario(usuario)).getCorreo());
//            
//            out.println(newUser.getCorreo());



%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google" content="notranslate">
        <jsp:include page="../headers/css.jsp"/>
        <title>VendeYa! | Registro</title>

    </head>

    <body style="background: url(./img/bg.jpg) fixed no-repeat;">
        <!--Formulario de login-->
        <div class="modal-dialog text-center">
            <div class="col-sm-10 main-content">
                <div class="modal-content">
                    <div class="col-12 logo">
                        <img class="img-fluid" src="./img/logo.png">
                    </div>
                    <div class="modal-header">
                        <h4 class="modal-title">Registrarse.</h4>

                    </div>
                    <br>
                    <form class="col-12" action="../CrearCuenta" method="post">
                        <div id="Caja2">
                            <span id="mensaje" class="text-danger"></span>
                            <div class="form-group " id="user-group">
                                <input id="Usuario" name="nombre" type="text" class="form-control" placeholder="Nombre de Usuario"
                                       required>
                            </div>
                            <div class="form-group " id="number-group">
                                <input id="Num-tele" name="numero" type="text" class="form-control" placeholder="Numero de Teléfono"
                                       required>
                            </div>
                            <div class="form-group " id="email-group">
                                <input id="Correo" name="email" type="email" class="form-control" placeholder="Correo Electrónico"
                                       required>
                            </div>
                            <div class="form-group " id="password-group">
                                <input id="password" name="password" type="password" class="form-control" placeholder="Contraseña" required>
                            </div>
                            <div class="form-group " id="password-group">
                                <input id="password-confirm" type="password" class="form-control"
                                       placeholder="Confirmar Contraseña" required>
                            </div>
                            <button id="register" type="submit" class="btn btn-primary">
                                Registrarse</button>
                        </div>
                    </form>
                    <div class="col-12 register">
                        <br>
                        <a href="../Login/">¿Ya tienes Cuenta? ¡Inicia Sesión!</a>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../headers/javascript.jsp"/>
        <script src="../js/registrar.js"></script>
    </body>

</html>
