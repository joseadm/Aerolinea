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
              <li><a href="vuelos.jsp">Vuelos</a></li>
              <li><a href="ciudades.jsp">Ciudades</a></li>
              <li><a href="viajes.jsp">Viajes</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Aviones</h1>
            <div id="avion" class="form-group">
                <form>
                  <label class="control-label">Placa</label><input type="text" class ="form-control" id="placa" placeholder="Ingrese la placa"><br>
                  <label class="control-label">Modelo</label><input type="text" class ="form-control" id="modelo" placeholder="Ingrese la modelo"> <br>
                  <label class="control-label">Marca</label><input type="text" class ="form-control" id="marca" placeholder="Ingrese la marca"> <br>
                  <label class="control-label">Año</label><input type="text" class ="form-control" id="annio" placeholder="Ingrese la año"><br>
                  <label class="control-label">Cantidad Pasajeros</label><input type="text" class ="form-control" id="cant_pasajeros" placeholder="Ingrese la cantidad de pasajeros"> <br>
                  <label class="control-label">Cantidad Filas</label><input type="text" class ="form-control" id="cant_filas" placeholder="Ingrese la cantidad de filas"> <br>
                  <label class="control-label">Cantidad Asientos Fila</label><input type="text" class ="form-control" id="cant_asientos_por_fila" placeholder="Ingrese la cantidad de asientos por fila"><br>
                  <button class="btn btn-success" id="agregarRuta" onclick="controller.AvionAdd();">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta" onclick="controller.LimpiaPantalla();">Limpiar</button>
                </form>
            </div>
            <div class="table-responsive">
              <table id ="tablaAviones" class="table table-striped">
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
      
      <script> // Model
  function Model() {
    this.Model();
  }
  
  Model.prototype={
	Model: function(){
            this.aviones=[];
        }
  };
</script>
<script> // Controller
  function Controller(model,view) {
    this.Controller(model,view);
  }
  
  Controller.prototype={
	Controller: function(model,view){
		this.model=model;
		this.view=view;
                Proxy.getAviones(function (result) {
                model.aviones = result;
                 view.showAviones();
                });
                this.initAvion();
	},
        initAvion: function (){
            var model = this.model;       
            model.avion = new Avion();          
        },
        
        AvionAdd: function (){
            console.log("asdasd");
            var model = this.model;
            var view = this.view;
            this.model.avion.placa=this.view.document.getElementById("placa").value;
            this.model.avion.modelo=this.view.document.getElementById("modelo").value;
            this.model.avion.marca=this.view.document.getElementById("marca").value;
            this.model.avion.annio=this.view.document.getElementById("annio").value;
            this.model.avion.cant_pasajeros=this.view.document.getElementById("cant_pasajeros").value;
            this.model.avion.cant_filas=this.view.document.getElementById("cant_filas").value;
            this.model.avion.cant_asientos_por_fila=this.view.document.getElementById("cant_asientos_por_fila").value;
            Proxy.AvionAdd(this.model.avion,function(result){
                view.showMessage();
            });

        },
        LimpiaPantalla: function() {
            view.clean();
        }
        
  };
</script>
<script> // View
  var model;
  var controller;
  
	function pageLoad(event){
		model = new Model();  
		controller = new Controller(model,window);
                showAviones();
	}

    function showAviones() {

    var tr; 
    var tabla;
    var td;

    for(var index in model.aviones) {
    // ----------Agregar nueva fila----------------
    tabla = document.getElementById("tablaAviones");
    tr = document.createElement("tr");
    td = document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].placa));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].modelo));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].marca));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].annio));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].cant_pasajeros));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].cant_filas));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.aviones[index].cant_asientos_por_fila));
    tr.appendChild(td);
    
    tabla.appendChild(tr);
    
        }

    }
    function clean() {
        document.getElementById("placa").textContent = "";
    }
    function showMessage(){
            window.alert("Registro exitoso");
         }
        
	document.addEventListener("DOMContentLoaded",pageLoad);
</script> 
    </body>
</html>
