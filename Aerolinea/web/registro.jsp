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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDomGs0dCkbZbNVwNybUTcmtwAtDcNlm-A&callback=initMap" async defer></script>
        <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <!-- ....................................Formulario Contacto............................................... -->
        <div class="container">
            <div  id="myform" class="form-group well form-horizontal">
                <fieldset>
                    <legend align="center">Registro</legend>
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4 control-label">Usuario</label>
                    <div class=" col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="usuario" name="usuario" placeholder="Usuario" class="form-control"  type="text" maxlength="45">
                        </div>
                    </div>
                    </div><br><br><br>

                    <!-- Password-->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label" >Contraseña</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" name="password" placeholder="********" class="form-control" type="password" maxlength="45">
                        </div>
                    </div>
                    </div><br><br><br>
                    <!-- Nombre -->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label">Nombre</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="nombre"  name="nombre" placeholder="Nombre" class="form-control"  type="text" maxlength="45">
                        </div>
                    </div>
                    </div><br><br><br>

                    <!-- Apellido-->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label" >Apellidos</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="apellidos" name="apellidos" placeholder="Apellidos" class="form-control"  type="text" maxlength="45">
                        </div>
                    </div>
                    </div><br><br><br>

                    <!-- Correo-->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-sm-6 col-md-4   control-label">Correo Electrónico</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input id="correo" name="correo" placeholder="Correo Electronico" class="form-control"  type="text" maxlength="45">
                        </div>
                    </div>
                    </div><br><br><br>
                    <!-- Fecha de nacimiento-->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label">Fecha de Nacimiento</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class='input-group date' id='fechaNacimiento' name="fechaNacimiento">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <input type='text' id="fecha" class="form-control" />
                        </div>
                    </div>
                    </div><br><br><br>
                    <!-- Telefono-->

                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label">Teléfono</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input id="telefono" name="telefono" placeholder="(562)8990-3452" class="form-control" type="text" onKeyPress="return controller.justNumbers(event)">
                        </div>
                    </div>
                    </div><br><br><br>
                    <!-- Celular-->
                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4 control-label">Celular</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input id="celular" name="celular" placeholder="(562)8990-3452" class="form-control" type="text" onKeyPress="return controller.justNumbers(event)">
                        </div>
                    </div>
                    </div><br><br><br>

                    <!-- Direccion-->

                    <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label" >Direccion</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input id="direccion" name="direccion" placeholder="Direccion" class="form-control"  type="text" disabled>
                        </div>
                    </div>
                    </div>
                    <br>
                    <!--Mapa....................................................................... -->
                    <center>
                        <div class="col-md-6 col-md-offset-3">
                            <h3>Direccion</h3></div>
                        <div id="map"action="javascript:initMap();"></div>

                    </center>
                    <br>
                    <!--............................................. -->
                    <!-- Success message -->
                    <div class="alert alert-success" role="alert" id="exito">Exito al enviar <i class="glyphicon glyphicon-thumbs-up"></i> Gracias por contactarnos, nos comunicaremos pronto</div>

                    <!-- Button -->
                    <label class="col-md-6 col-md-offset-3 control-label"></label>
                    <div class="col-md-6 col-md-offset-3 inputGroupContainer" align="center">
                        <button id="Registrar" class="btn btn-primary" onclick="controller.UsuarioAdd();">Registrar<span class="glyphicon glyphicon-save"></span></button>
                    </div>
                    <div class="col-md-6 col-md-offset-3 inputGroupContainer" align="center">
                        <p align="center">¿Ya tiene una cuenta? <a href="login.jsp">Inicia sesión</a><span class="fontawesome-arrow-right"></span></p>
                    </div>
                </fieldset>
            </div>
            <!-- .......................................................................................................-->

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
                        format: 'dd/mm/yyyy'
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
                        placeMarker(e.latLng, map, marker);
                    });

                }
                function placeMarker(position, map, marker) {
                    var geocoder = new google.maps.Geocoder;
                    var infowindow = new google.maps.InfoWindow({
                        content: 'An InfoWindow'
                    });
                    infowindow.close();
                    marker.setPosition(position);
                    geocodeLatLng(geocoder, map, infowindow, position, marker);
                    map.panTo(position);
                }

                function geocodeLatLng(geocoder, map, infowindow, position, marker) {
                    geocoder.geocode({'location': position}, function (results, status) {
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

                Model.prototype = {
                    Model: function () {
                        this.usuarios = [];
                    }
                };
            </script>
            <script> // Controller
                function Controller(model, view) {
                    this.Controller(model, view);
                }

                Controller.prototype = {
                    Controller: function (model, view) {
                        this.model = model;
                        this.view = view;
                        /*Proxy.getUsuarios(function (result) {
                         model.usuarios = result;
                         });*/
                        this.initUsuario();
                    },
                    initUsuario: function () {
                        var model = this.model;
                        model.usuario = new Usuario();
                    },

                    UsuarioAdd: function () {
                        var model = this.model;
                        var view = this.view;
                        this.model.usuario.usuario = this.view.document.getElementById("usuario").value;
                        this.model.usuario.contrasena = this.view.document.getElementById("password").value;
                        this.model.usuario.nombre = this.view.document.getElementById("nombre").value;
                        this.model.usuario.apellidos = this.view.document.getElementById("apellidos").value;
                        this.model.usuario.correo = this.view.document.getElementById("correo").value;
                        this.model.usuario.fecha_nac = $("#fechaNacimiento").find("input").val();
                        this.model.usuario.telefono = this.view.document.getElementById("telefono").value;
                        this.model.usuario.celular = this.view.document.getElementById("celular").value;
                        this.model.usuario.direccion = this.view.document.getElementById("direccion").value;
                        this.model.usuario.tipo = 1;
                        if (view.validacionForm())
                            this.view.showMessage();
                        if (view.validacionForm() /*&&!(usuarioExiste(this.model.usuario.usuario))*/) {
                            Proxy.UsuarioAdd(this.model.usuario, function (UsuarioNumber) {
                                document.location = "/Aerolinea/registro.jsp";
                            });


                        }

                    },
                    justNumbers: function (e) {
                        var key = window.Event ? e.which : e.keyCode;
                        return (key >= 48 && key <= 57);
                    },
                    usuarioExiste: function (val) {
                        var resultado;
                        Proxy.usuarioExiste(val, function (result) {
                            resultado = result;
                        });
                        if (resultado === true) {
                            return true; //usuario ya existe

                        }
                        return false;
                    }


                };
            </script>
            <script> // View
                var model;
                var controller;
                function pageLoad(event) {
                    model = new Model();
                    controller = new Controller(model, window);

                }
                function showMessage() {
                    window.alert("Registro exitoso");
                }
                function validacionForm() {
                    var tam = 0;
                    var usuarioE = document.getElementById("usuario");
                    if (!(validarVacio(usuarioE.value))) {
                        tam++;
                        usuarioE.style.borderColor = "red";
                    } else {
                        usuarioE.style.borderColor = "gray";
                    }
                    var passwordE = document.getElementById("password");
                    if (!(validarVacio(passwordE.value))) {
                        tam++;
                        passwordE.style.borderColor = "red";
                    } else {
                        passwordE.style.borderColor = "gray";
                    }
                    var nombreE = document.getElementById("nombre");
                    if (!(validarVacio(nombreE.value))) {
                        tam++;
                        nombreE.style.borderColor = "red";
                    } else {
                        nombreE.style.borderColor = "gray";
                    }
                    var apellidosE = document.getElementById("apellidos");
                    if (!(validarVacio(apellidosE.value))) {
                        tam++;
                        apellidosE.style.borderColor = "red";
                    } else {
                        apellidosE.style.borderColor = "gray";
                    }
                    var correoE = document.getElementById("correo");
                    if (!(validarVacio(correoE.value))) {
                        tam++;
                        correoE.style.borderColor = "red";
                    } else {
                        correoE.style.borderColor = "gray";
                    }
                    var fechaE = document.getElementById("fecha");
                    if (!(validarVacio(fechaE.value))) {
                        tam++;
                        fechaE.style.borderColor = "red";
                    } else {
                        fechaE.style.borderColor = "gray";
                    }
                    var telefonoE = document.getElementById("telefono");
                    if (!(validarVacio(telefonoE.value))) {
                        tam++;
                        telefonoE.style.borderColor = "red";
                    } else {
                        telefonoE.style.borderColor = "gray";
                    }
                    var celularE = document.getElementById("celular");
                    if (!(validarVacio(celularE.value))) {
                        tam++;
                        celularE.style.borderColor = "red";
                    } else {
                        celularE.style.borderColor = "gray";
                    }
                    var direccionE = document.getElementById("direccion");
                    if (!(validarVacio(direccionE.value))) {
                        tam++;
                        direccionE.style.borderColor = "red";
                    } else {
                        direccionE.style.borderColor = "gray";
                    }
                    if (tam > 0) {

                        return false;
                    }
                    return true;
                }
                function validarVacio(valor) {
                    if (valor === null || valor.length === 0 || /^\s+$/.test(valor)) {

                        return false;
                    }
                    return true;
                }

                document.addEventListener("DOMContentLoaded", pageLoad);
            </script> 
    </body>
</html>
