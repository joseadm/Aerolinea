<%-- 
    Document   : tiposAviones
    Created on : May 18, 2017, 12:27:38 AM
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
              <li class="active"><a href="aviones.jsp">Aviones</a></li>
              <li><a href="viajes.jsp">Viajes</a></li>
              <li><a href="ciudades.jsp">Ciudades</a></li>
              <li><a href="vuelos.jsp">Vuelos</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Aviones</h1>
            <div class="form-group">
                  <label class="control-label">Placa</label><input type="text" class ="form-control" id="Placa" placeholder="Ingrese la placa"><br>
                  <label class="control-label">Modelo</label><input type="text" class ="form-control" id="Modelo" placeholder="Ingrese la modelo"> <br>
                  <label class="control-label">Marca</label><input type="text" class ="form-control" id="Marca" placeholder="Ingrese la marca"> <br>
                  <label class="control-label">Año</label><input type="text" class ="form-control" id="Anno" placeholder="Ingrese la año"><br>
                  <label class="control-label">Cantidad Pasajeros</label><input type="text" class ="form-control" id="cantidad_pasajeros" placeholder="Ingrese la cantidad de pasajeros"> <br>
                  <label class="control-label">Cantidad Filas</label><input type="text" class ="form-control" id="cantidad_filas" placeholder="Ingrese la cantidad de filas"> <br>
                  <label class="control-label">Cantidad Asientos Fila</label><input type="text" class ="form-control" id="cantidad_asientos" placeholder="Ingrese la cantidad de asientos por fila"><br>
                  <button class="btn btn-success" id="agregarRuta">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
              </div>
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Placa</th>
                    <th>Modelo</th>
                    <th>Marca</th>
                    <th>Año</th>
                    <th>Pasajeros</th>
                    <th>Filas</th>
                    <th>Ascientos</th>
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
