<%-- 
    Document   : rutas
    Created on : May 18, 2017, 12:27:17 AM
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
              <li><a href="vuelos.jsp">Vuelos</a></li>
              <li><a href="ciudades.jsp">Ciudades</a></li>
              <li class="active"><a href="viajes.jsp">Viajes</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Viajes</h1>
            <div class="form-group">
                  <label class="control-label">Fecha</label><input type="text" class ="form-control" id="fecha" placeholder="Ingrese la fecha"> <br>
                  <label class="control-label">Avion</label><input type="text" class ="form-control" id="avion" placeholder="Ingrese el avion"> <br>
                  <label class="control-label">Vuelo</label><input type="text" class ="form-control" id="vuelo" placeholder="Ingrese el vuelo"><br>
                  <button onclick="controller.ViajeAdd();" class="btn btn-success" id="agregarRuta">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
              </div>
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Numero Viaje</th>
                    <th>Numero Vuelo</th>
                    <th>Ciudad Origen</th> <!--OPCIONAL -->
                    <th>Ciudad Destino</th> 
                    <th>Avion</th>
                    <th>Fecha</th>
                  </tr>
                </thead>
                <tbody id="tablaViajes">
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
            this.viajes=[];
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
                Proxy.getViajes(function (result) {
                model.viajes = result;
                 view.showViajes();
                });
                this.initViaje();
	},
        initViaje: function (){
            var model = this.model;
            model.viaje = new Viaje();   
        },
        
        ViajeAdd: function (){
            var model = this.model;
            var view = this.view;
            this.model.viaje.fecha=this.view.document.getElementById("fecha").value;
            this.model.viaje.avion=this.view.document.getElementById("avion").value;
            this.model.viaje.vuelo=this.view.document.getElementById("vuelo").value;
            Proxy.ViajeAdd(this.model.viaje,function(result){
                document.location = "/Aerolinea/viajes.jsp";
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
                showViajes();
	}

    function showViajes() {

    var tr; 
    var tabla;
    var td;

    for(var index in model.viajes) {
    // ----------Agregar nueva fila----------------
    tabla = document.getElementById("tablaViajes");
    tr = document.createElement("tr");
    td = document.createElement("td");
    td.appendChild(document.createTextNode(model.viajes[index].numero_viaje));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.viajes[index].vuelo.numero_vuelo));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(city(model.viajes[index].vuelo.ciudad_origen.codigo)));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(city(model.viajes[index].vuelo.ciudad_destino.codigo)));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.viajes[index].avion.placa));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.viajes[index].fecha));
    tr.appendChild(td);
    
    tabla.appendChild(tr);
    
        }

    }
    function showMessage(){
            window.alert("Registro exitoso");
         }
    function city(codigo){
      switch(codigo) {
          case "SJO":
              return "San Jose";
              break;
          case "MIA":
              return "Miami";
              break;
          case "MAD":
              return "Madrid";
              break;
          case "CAN":
              return "Cancun";
              break;
          case "ROM":
              return "Roma";
              break;
          case "VIE":
              return "Viena";
              break;
      }
  }
        
	document.addEventListener("DOMContentLoaded",pageLoad);
</script> 
    </body>
</html>
