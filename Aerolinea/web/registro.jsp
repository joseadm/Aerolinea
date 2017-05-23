<%-- 
    Document   : registro
    Created on : May 18, 2017, 12:27:07 AM
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
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key= AIzaSyCJPWUmBSUk3VbURUYaADFq2ois9Zcl--I &callback=initMap"></script>
        <script type="text/javascript" src="js/Bootstrap-datepicker.js"></script>
    </head>
    <body>
       <%@ include file="Header.jspf" %>
      <!-- ....................................Formulario Contacto............................................... -->
        <div class="container-fluid">
        <div class="row">
        <div class="col-sm-8 col-md-10 main">
        <h1 class="page-header">Registro</h1>
                   <div id="avion" class="form-group">
                       <form>
                        <label class="control-label">Usuario</label><input type="text" class ="form-control" id="usuario" placeholder="Ingrese nombre de usuario"><br>
                        <label class="control-label">Contraseña</label><input type="password" class ="form-control" id="password" placeholder="Ingrese la contraseña"> <br>
                        <label class="control-label">Nombre</label><input type="text" class ="form-control" id="nombre" placeholder="Ingrese su nombre"> <br>
                        <label class="control-label">Apellidos</label><input type="text" class ="form-control" id="apellidos" placeholder="Ingrese sus apellidos"><br>
                        <label class="control-label">Correo</label><input type="text" class ="form-control" id="correo" placeholder="Ingrese su correo electronico"> <br>
                        <label class="control-label">Fecha de Nacimiento</label>
                        <div class='input-group date' id='fechaNacimiento' name="fechaNacimiento">
                        <input type='text' class="form-control" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span></div><br>
                        <label class="control-label">Telefono  </label><input type="text" class ="form-control" id="telefono" placeholder="Ingrese su número de telefono"><br>
                        <label class="control-label">Celular  </label><input type="text" class ="form-control" id="celular" placeholder="Ingrese su número de celular"><br>
                        <center>
                        <h3>Direccion</h3>
                        <div id="map"action="javascript:initMap();"></div>
                        </center>
                        <br>
                        <button class="btn btn-success" id="Registrar" onclick="controller.UsuarioAdd();">Registrar</button>
                       </form>
                   </div>
       <!-- .......................................................................................................-->
        <p align="center">¿Ya tiene una cuenta? <a href="login.jsp">Inicia sesión</a><span class="fontawesome-arrow-right"></span></p>
        </div><!-- /.container -->
        </div>
        </div>
      <br>
      <!-- Footer -->
      <div class="container">
        <footer class="footer">
          <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
      </div>
    <!-- ................................................................................... -->
    <script type="text/javascript">
        $(function () {
        $('#fechaNacimiento').datepicker({
            format: 'dd/MM/yyyy'
        });
        });
        function initMap() {
        var uluru = {lat: 10.0000000, lng: -84.0000000};

        var map = new google.maps.Map(document.getElementById("map"), {
            zoom: 4,
            center: uluru
        });

        var marker = new google.maps.Marker({position: uluru, map: map, title: 'Click to zoom'});
        marker.addListener('click', function () {
            map.setZoom(8);
            marker.setPosition(uluru);
            map.setCenter(marker.getPosition());
        });

        google.maps.event.addListener(map, 'click', function (e) {
            placeMarker(e.latLng, map,marker);
        });

        }
        function placeMarker(position, map,marker) {
            var geocoder = new google.maps.Geocoder;
            var infowindow = new google.maps.InfoWindow;
            marker.setPosition(position);
            geocodeLatLng(geocoder,map,infowindow,position,marker);
            map.panTo(position);
        }

        function geocodeLatLng(geocoder, map, infowindow,position,marker) {
            geocoder.geocode({'location': position}, function(results, status) {
              if (status === 'OK') {
                if (results[1]) {
                  infowindow.setContent(results[0].formatted_address);
                  infowindow.open(map, marker);
                  document.getElementById("direccion").value = results[0].formatted_address;
                } else {
                  window.alert('No results found');
                }
              } else {
                window.alert('Geocoder failed due to: ' + status);
              }
            });
        }
    </script>
     <!-- ................................................................................... -->
    <script> // Model
  function Model() {
    this.Model();
  }
  
  Model.prototype={
	Model: function(){
            this.usuarios=[];
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
                Proxy.getUsuarios(function (result) {
                model.usuarios = result;
                 //view.showAviones();
                });
                this.initUsuario();
	},
        initUsuario:function (){
            var model = this.model;       
            model.usuario = new Usuario();          
        },
        
        UsuarioAdd: function (){
            var model = this.model;
            var view = this.view;
            this.model.usuario.usuario=this.view.document.getElementById("usuario").value;
            this.model.usuario.contrasena=this.view.document.getElementById("password").value;
            this.model.usuario.nombre=this.view.document.getElementById("nombre").value;
            this.model.usuario.apellidos=this.view.document.getElementById("apellidos").value;
            this.model.usuario.correo=this.view.document.getElementById("correo").value;
            this.model.usuario.fecha_nac=this.view.document.getElementById("fechaNacimiento").value;
            this.model.usuario.direccion= "Heredia";
            this.model.usuario.telefono=this.view.document.getElementById("telefono").value;
            this.model.usuario.celular=this.view.document.getElementById("celular").value;
            this.model.usuario.tipo=1;
            Proxy.UsuarioAdd(this.model.usuario,function(result){
                document.location = "/Aerolinea/registro.jsp"
                view.showMessage();
            });

        }
        
  };
</script>
    <script> // View
      var model;
      var controller;

            function pageLoad(event){
                    model = new Model();  
                    controller = new Controller(model,window);
            }
        function showMessage(){
                window.alert("Registro exitoso");
             }

            document.addEventListener("DOMContentLoaded",pageLoad);
    </script> 
    </body>
</html>
