<%-- 
    Document   : rutas
    Created on : May 18, 2017, 12:27:17 AM
    Author     : AndreyCh
--%>

<%@page import="airline.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
    </head>
    <body>
        <%@ include file="HeaderAdmi.jspf" %>
        <!--Side Bar and content -->
        <div class="container">
            <fieldset>
                <legend align="center">Menu Administrativo</legend>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-8 col-md-10 main">
                            <h1 class="page-header">Viajes</h1>
                            <div class="form-group">
                                <label class="control-label">Avion</label><input type="text" class ="form-control" id="avion" placeholder="Ingrese el avion"> <br>
                                <label class="control-label">Vuelo</label><input type="text" class ="form-control" id="vuelo" placeholder="Ingrese el vuelo"><br>
                                <label class="col-md-4 control-label">Fecha</label><br><br>
                                <div class="col-md-4 inputGroupContainer">
                                    <div class='input-group date' id='fechaVuelo' name="fechaVuelo">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        <input type='text' class="form-control" />
                                    </div>
                                </div><br><br>
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
            </fieldset>
        </div>
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

            Model.prototype = {
                Model: function () {
                    this.viajes = [];
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
                    Proxy.getViajes(function (result) {
                        model.viajes = result;
                        view.showViajes();
                    });
                    this.initViaje();
                },
                initViaje: function () {
                    var model = this.model;
                    model.viaje = new Viaje();
                },

                ViajeAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.viaje.fecha = $("#fechaVuelo").find("input").val();
                    this.model.viaje.avion = this.view.document.getElementById("avion").value;
                    this.model.viaje.vuelo = this.view.document.getElementById("vuelo").value;
                    Proxy.ViajeAdd(this.model.viaje, function (result) {
                        document.location = "/Aerolinea/viajes.jsp";
                        view.showMessage();
                    });

                },
                LimpiaPantalla: function () {
                    view.clean();
                }

            };
        </script>
        <script> // View
            var model;
            var controller;

            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showViajes();
            }

            function showViajes() {

                var tr;
                var tabla;
                var td;

                for (var index in model.viajes) {
                    // ----------Agregar nueva fila----------------
                    tabla = document.getElementById("tablaViajes");
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].numero_viaje));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.numero_vuelo));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.ciudad_origen.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.ciudad_destino.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].avion.placa));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].fecha));
                    tr.appendChild(td);

                    tabla.appendChild(tr);

                }

            }
            function showMessage() {
                window.alert("Registro exitoso");
            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script> 
        <script type="text/javascript">
            $('#fechaVuelo').datetimepicker({
                minDate: moment(),
                format: 'DD/MM/YYYY',
                useCurrent: false
            });
        </script> 
    </body>
</html>
