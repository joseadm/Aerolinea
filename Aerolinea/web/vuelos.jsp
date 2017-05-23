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
              <li ><a href="aviones.jsp">Aviones</a></li>
              <li class="active"><a href="vuelos.jsp">Vuelos</a></li>
              <li><a href="ciudades.jsp">Ciudades</a></li>
              <li><a href="viajes.jsp">Viajes</a></li>
            </ul>
          </div>
          <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Vuelos</h1>
            <div class="form-group">
                      <label class="control-label">Numero Vuelo</label><input type="text" class ="form-control" id="numero_vuelo" placeholder="Ingrese el numero de vuelo"><br>
                    <label class="control-label">Ciudad Origen</label><input type="text" class ="form-control" id="ciudad_origen" placeholder="Ingrese la ciudad de origen"> <br>
                  <label class="control-label">Ciudad Destino</label><input type="text" class ="form-control" id="ciudad_destino" placeholder="Ingrese la ciudad de destino"><br>
                  <label class="control-label">Estado</label><input type="text" class ="form-control" id="estado" placeholder="Ingrese el estado"> <br>
                  <label class="control-label">Precio</label><input type="text" class ="form-control" id="precio" placeholder="Ingrese el precio"> <br>
                  <label class="control-label">Duracion</label><input type="text" class ="form-control" id="duracion" placeholder="Ingrese la duracion de vuelo"><br>
                  <label class="control-label">Hora</label><input type="text" class ="form-control" id="hora" placeholder="Ingrese la hora"> <br>
                  <label class="control-label">Oferta</label><input type="text" class ="form-control" id="oferta" placeholder="Ingrese la oferta"><br>
                  <button class="btn btn-success" id="agregarRuta">Agregar</button>
                  <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
              </div>
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Numero Vuelo</th>
                    <th>Ciudad Origen</th>
                    <th>Ciudad Destino</th>
                    <th>Estado</th>
                    <th>Precio</th>
                    <th>Duracion</th>
                    <th>Hora</th>
                    <th>Oferta</th>
                  </tr>
                </thead>
                <tbody id="tablaVuelos">
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
            this.vuelos=[];
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
                Proxy.getVuelos(function (result) {
                model.vuelos = result;
                 view.showVuelos();
                });
	},
        initVuelo: function (){
            var model = this.model;
            model.vuelo = new Vuelo();   
        },
        VueloAdd: function (){
            var model = this.model;
            var view = this.view;
            this.model.vuelo.numero_vuelo=this.view.document.getElementById("numero_vuelo").value;
            this.model.vuelo.ciudad_origen=this.view.document.getElementById("ciudad_origen").value;
            this.model.vuelo.ciudad_destino=this.view.document.getElementById("ciudad_destino").value;
            this.model.vuelo.estado=this.view.document.getElementById("estado").value;
            this.model.vuelo.precio=this.view.document.getElementById("precio").value;
            this.model.vuelo.duracion=this.view.document.getElementById("duracion").value;
            this.model.vuelo.hora=this.view.document.getElementById("hora").value;
            this.model.vuelo.oferta=this.view.document.getElementById("oferta").value;
            this.model.vuelo.imagen="NOT YET";
            Proxy.VueloAdd(this.model.vuelo,function(result){
                document.location = "/Aerolinea/vuelos.jsp";
                view.showMessage();
            });

        }
        
        
  };
</script>
<script> // View
  var model;
  var controller;
	function pageLoad(event){
		model=new Model();  
		controller = new Controller(model,window);
                showVuelos();
	}

    function showVuelos() {

    var tr; 
    var tabla;
    var td;
    for(var index in model.vuelos) {
    // ----------Agregar nueva fila----------------
    tabla = document.getElementById("tablaVuelos");
    tr = document.createElement("tr");
    td = document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].numero_vuelo));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(city(model.vuelos[index].ciudad_origen.codigo)));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(city(model.vuelos[index].ciudad_destino.codigo)));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].estado));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].precio));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].duracion));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].hora));
    tr.appendChild(td);
    td =document.createElement("td");
    td.appendChild(document.createTextNode(model.vuelos[index].oferta));
    tr.appendChild(td);
    
    tabla.appendChild(tr);
    
        }

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
