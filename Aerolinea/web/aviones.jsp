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
              <li><a href="tiposAviones.jsp">Aviones</a></li>
              <li><a href="rutas.jsp">Viajes</a></li>
              <li><a href="horas.jsp">Ciudades</a></li>
              <li class="active"><a href="aviones.jsp">Vuelos</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Aviones</h1>
            <div class="form-group">
                      <label class="control-label">Numero Vuelo</label><input type="text" class ="form-control" id="numero_vuelo" placeholder="Ingrese el numero de vuelo"><br>
                  <label class="control-label">Tiempo</label><input type="text" class ="form-control" id="tiempo" placeholder="Ingrese el tiempo de vuelo"> <br>
                  <label class="control-label">Ciudad Origen</label><input type="text" class ="form-control" id="ciudad_origen" placeholder="Ingrese la ciudad de origen"> <br>
                  <label class="control-label">Ciudad Destino</label><input type="text" class ="form-control" id="ciudad_destino" placeholder="Ingrese la ciudad de destino"><br>
                  <label class="control-label">Estado</label><input type="text" class ="form-control" id="estado" placeholder="Ingrese el estado"> <br>
                  <label class="control-label">Precio</label><input type="text" class ="form-control" id="precio" placeholder="Ingrese el precio"> <br>
                  <label class="control-label">Duracion</label><input type="text" class ="form-control" id="duracion" placeholder="Ingrese la duracion de vuelo"><br>
                  <button class="btn btn-success" id="agregarRuta">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
              </div>
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Numero Vuelo</th>
                    <th>Tiempo</th>
                    <th>Ciudad Origen</th>
                    <th>Ciudad Destino</th>
                    <th>Estado</th>
                    <th>Precio</th>
                    <th>Duracion</th>
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
