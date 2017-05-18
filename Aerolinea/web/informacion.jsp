<%-- 
    Document   : informacion
    Created on : May 18, 2017, 12:26:42 AM
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
              <li class="active"><a href="informacion.jsp">Información</a></li>
              <li><a href="historia.jsp">Historia</a></li>
              <li><a href="contacto.jsp">Contacto</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="container">
        <div class="row">
          <div class="color1 col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <p>
              <h3>¿Quiénes somos?</h3>
              Baratisimo es una organización o compañía de transporte aéreo que
              se dedica exclusivamente al transporte de pasajeros, de carga, o
              de animales, mediante el uso de un avión o aeronave.
              Nos comprometemos con la seguridad, con el desarrollo del país,
              con promover la comunicación franca y el trabajo en equipo en el
              marco de una gestión empresaria eficiente y transparente.
              Este es un compromiso que asumimos con la voluntad de ser una
              aerolínea de clase mundial.

            </p>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <p>
              <h3>Aeronaves</h3>
              Son vehículos especialmente diseñados para desplazarse en el aire,
               o sea, sin entrar en contacto con la superficie ni con el agua.
               Dentro de este tipo de vehículos se pueden distinguir dos tipos,
               los aerodinos, que tienen un peso mayor al del aire y entonces
               tienen que lograr sustentarse mediante un mecanismo especial,
               y por otro lado, los aerostatos, que disponen de un peso inferior
               al aire, y por caso flotan con mayor simplicidad.
          </p>
          </div>
          <div class="color1 col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <p>
              <h3>Viajes</h3>
              Nuestros viajes han destacado por su precio tan bajo, incluyendo
              destinos turisticos populares, brindamos vuelos a todas partes
              del mundo, con los mejores servicios de traslado de equipo y
              servicios comodos para los clientes de nuestra aerolinea.
              Puedes buscar el viaje que mejor se apegue a tus fechas y destinos
              ademas, por medio de tu cuenta de baratisimo, podras realizar
              la compra de tiquetes para tus viajes, todo de manera comoda
              y segura desde internet.
            </p>
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
