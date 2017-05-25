<%-- 
    Document   : login
    Created on : May 18, 2017, 6:54:36 PM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="Imports.jspf" %>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="container"><h1>&nbsp;&nbsp;Baratísimo <span class="glyphicon glyphicon-plane avion"></span></h1></div>
        </header>
        <!-- Menu de Navegacion -->
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Principal</a></li>
                        <li><a href="informacion.jsp">Información</a></li>
                        <li><a href="historia.jsp">Historia</a></li>
                        <li><a href="contacto.jsp">Contacto</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">      
            <form action="/Aerolinea/AirlineService?action=userLogin" class="well form-horizontal"  method="POST"  id="formulario">
                <fieldset>
                    <!-- Nombre Formulario -->
                    <legend align="center">Ingresar</legend>

                    <!-- Correo -->
                    <%if (request.getAttribute("error") != null) {%>
                    <h4 style="color: red;text-align: center;"><%=request.getAttribute("error")%></h4>
                    <%}%>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Usuario</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="usuario" name="usuario" placeholder="Nombre de Usuario" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Password-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Contraseña</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="contrasena" name="contrasena" placeholder="********" class="form-control" type="password">
                            </div>
                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4" align="center">
                            <button id="submit" type="submit" class="btn btn-success" value="IniciarSesion">Iniciar Sesión</button>
                        </div>
                    </div>
                    <br>
                    <p align="center">¿No tienes cuenta? <a href="registro.jsp">Regístrate</a><span class="fontawesome-arrow-right"></span></p>
                </fieldset>
            </form>
            <!-- .......................................................................................................-->
        </div><!-- /.container -->
        <br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratísimo, Inc.</p>
            </footer>
        </div>
        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                }
            };
        </script>
        <script> // Controller
            function Controller(model, view) {
                this.Controller(model, view);
            }

            Controller.prototype = {
                Controller: function (model, view) {
                    this.model = model;
                    this.view = view;
                }
            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
            }
            function showErrorMessage() {
                window.alert("Usuario incorrecto...");
            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
