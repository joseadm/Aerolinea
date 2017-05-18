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
    </head>
    <body>
      <!-- Titulo de la pagina -->
      <header>
        <div class="container"><h1>&nbsp;&nbsp;Baratisimo <span class="glyphicon glyphicon-plane avion"></span></h1></div>
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
              <li><a href="informacion.jsp">Informacion</a></li>
              <li><a href="historia.jsp">Historia</a></li>
              <li><a href="contacto.jsp">Contacto</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <li class="dropdown active">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Usuario <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="usuario.jsp">Perfil</a></li>
              <li><a href="tablero.jsp">Administracion</a></li>
              <li><a href="index.jsp">Cerrar Sesion</a></li>
            </ul>
          </li>
        </ul>
          </div>
        </div>
      </nav>
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
