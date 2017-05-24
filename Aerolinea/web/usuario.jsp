<%-- 
    Document   : usuario
    Created on : May 18, 2017, 12:28:13 AM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <br><br><br><br>
                    <img src="images/person-icon.png">
                </div>
                <div class="col-sm-8">
                    <h1 class="page-header">Informacion Personal</h1>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr><td><strong>Usuario</strong></td></tr>
                            <tr><td><strong>Contraseña</strong></td></tr>
                            <tr><td><strong>Nombre</strong></td></tr>
                            <tr><td><strong>Apellidos</strong></td></tr>
                            <tr><td><strong>Correo Electronico</strong></td></tr>
                            <tr><td><strong>Fecha Nacimiento</strong></td></tr>
                            <tr><td><strong>Direccion</strong></td></tr>
                            <tr><td><strong>Telefono trabajo</strong></td></tr>
                            <tr><td><strong>Celular</strong></td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratisimo, Inc.</p>
            </footer>
        </div>
    </body>
</html>
