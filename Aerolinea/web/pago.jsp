<%-- 
    Document   : pago
    Created on : May 18, 2017, 12:26:56 AM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <script type="text/javascript" src="js/ValidacionPago.js"></script>
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
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Usuario <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="usuario.jsp">Perfil</a></li>
                <li><a href="tablero.jsp">Administracion</a></li>
                <li><a href="index.jsp">Cerrar Sesion</a></li>
              </ul>
            </li></ul>
          </div>
        </div>
      </nav>
      <!-- Table -->
      <div class="container">
            <table class="table">
              <thead class="thead-default">
                <tr>
                  <th>Informacion del vuelo</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <!-- Cargar la info del vuelo -->
                </tr>
              </tbody>
            </table>
        </div>
        <div class="container">
      <div id="pago" class="jumbotron">
        <div class="row">
          <div id="imagenTarjeta" class="container">
            <img src="images/tarjetas.png" class="img-responsive img-center" alt="forma de pago">
          </div>
        </div>
        <hr>
        <form id="formPago" class="form-horizontal" role="form">
          <div class="form-group">
            <label for="inputType" class="col-md-5 control-label">Numero de Tarjeta: </label>
              <div class="col-md-7">
                  <input type="text" class="form-control" id="numTarjeta" placeholder="1234567890">
              </div>
          </div>
          <div class="form-group">
            <label for="inputType" class="col-md-5 control-label">Fecha de vencimiento: </label>
              <div class="col-md-3">
                  <select class="form-control" id="expirationMonth" name="expirationMonth" placeholder="Mes">
                    <option selected="selected">Enero</option><option>Febrero</option><option>Marzo</option>
                    <option>Abril</option><option>Mayo</option><option>Junio</option>
                    <option>Julio</option><option>Agosto</option><option>Setiembre</option>
                    <option>Octubre</option><option>Noviembre</option><option>Diciembre</option>
                  </select>
              </div>
              <div class="col-md-1">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
              </div>
              <div class="col-md-3">
                <select class="form-control" id="expirationYear" name="expirationYear" placeholder="Anio">
                  <option selected="selected">2017</option><option>2018</option><option>2019</option>
                  <option>2020</option><option>2021</option><option>2022</option>
                  <option>2023</option><option>2024</option><option>2025</option>
                  <option>2026</option><option>2027</option><option>2028</option>
                </select>
              </div>
          </div>
          <hr class="my-4">
          <div class="row">
          <div class="col-xs-2"></div>
          <div class="col-xs-8 text-center">
            <input type="submit" class="btn btn-default btn-lg" value="Aceptar" id="aceptar">
            <input type="button" class="btn btn-default btn-lg" value="Cancelar" id="cancelar">
          </div>
          </div>
          </form>
          </div>
        </div>
      <hr>
      <br><br><br>
      <!-- Footer -->
      <div class="container">
        <footer class="footer">
          <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
      </div>
    </body>
</html>
