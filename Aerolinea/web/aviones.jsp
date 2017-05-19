<%-- 
    Document   : aviones
    Created on : May 18, 2017, 12:25:37 AM
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
      <!--Side Bar and content -->
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
              <li><a href="tablero.jsp">Tablero</a></li>
              <li><a href="tiposAviones.jsp">Tipos de aviones</a></li>
              <li><a href="rutas.jsp">Rutas</a></li>
              <li><a href="horas.jsp">Horas</a></li>
              <li class="active"><a href="aviones.jsp">Aviones</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Aviones</h1>

          <form class="" action="index.jsp" method="post">
            <div class="form-group">
              <label for="ident">Id</label>
              <input type="text" class="form-control" id="ident" placeholder="Identificador">
            </div>
            <div class="form-group">
              <label for="ident">Ruta</label>
              <input type="text" class="form-control" id="ident" placeholder="Ruta a seguir">
            </div>
            <div class="form-group">
              <label for="ident">Horario</label>
              <input type="text" class="form-control" id="ident" placeholder="Horario de vuelo">
            </div>
            <div class="form-group">
              <label for="ident">Tipo</label>
              <input type="text" class="form-control" id="ident" placeholder="Tipo de avion">
            </div>
            <button type="submit" class="btn btn-primary">Ingresar</button>
          </form>

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
