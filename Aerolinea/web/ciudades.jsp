<%-- 
    Document   : horas
    Created on : May 18, 2017, 12:26:26 AM
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
              <li><a href="aviones.jsp">Aviones</a></li>
              <li><a href="viajes.jsp">Viajes</a></li>
              <li class="active"><a href="ciudades.jsp">Ciudades</a></li>
              <li><a href="vuelos.jsp">Vuelos</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Ciudades</h1>
            <div class="form-group">
                  <label class="control-label">Codigo</label><input type="text" class ="form-control" id="codigo" placeholder="Ingrese codigo de la ciudad"><br>
                  <label class="control-label">Pais</label><input type="text" class ="form-control" id="pais" placeholder="Ingrese pais de la ciudad"> <br>
                  <label class="control-label">Nombre</label><input type="text" class ="form-control" id="nombre" placeholder="Ingrese nombre de la ciudad"> <br>
                  <button class="btn btn-success" id="agregarRuta">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
              </div>
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Codigo</th>
                    <th>Pais</th>
                    <th>Nombre</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Contenido de la tabla -->
                </tbody>
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
