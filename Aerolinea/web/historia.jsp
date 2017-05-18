<%-- 
    Document   : historia
    Created on : May 18, 2017, 12:26:12 AM
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
              <li class="active"><a href="historia.jsp">Historia</a></li>
              <li><a href="contacto.jsp">Contacto</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="container">
        <div class="row">
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>1995</h2>
            <p>Se funda la compañia</p>
            <hr>
          </div>
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>2000</h2>
            <p>Primeros viajes alrededor del continente</p>
            <hr>
          </div>
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>2005</h2>
            <p>Se realizan viajes internacionales</p>
            <hr>
          </div>
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>2010</h2>
            <p>Se convierte en la aerolinea mas barata del pais</p>
            <hr>
          </div>
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>2014</h2>
            <p>Ofrece los mejores servicios para los clientes</p>
            <hr>
          </div>
          <div class="reseña col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h2>2017</h2>
            <p>Lanza su primera aplicacion web para venta de tiquetes aereos</p>
            <hr>
          </div>
        </div>
      </div>
      <br>
      <!-- Footer -->
      <div class="container">
        <footer class="footer">
          <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
      </div>
    </body>
</html>
