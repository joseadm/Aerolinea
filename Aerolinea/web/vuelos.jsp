<%-- 
    Document   : aviones
    Created on : May 18, 2017, 12:25:37 AM
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
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
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
                            <h1 class="page-header">Vuelos</h1>
                            <div class="form-group">
                                <label class="control-label">Ciudad Origen</label><input type="text" class ="form-control" id="ciudad_origen" placeholder="Ingrese la ciudad de origen"> <br>
                                <label class="control-label">Ciudad Destino</label><input type="text" class ="form-control" id="ciudad_destino" placeholder="Ingrese la ciudad de destino"><br>
                                <label class="control-label">Estado</label><input type="text" class ="form-control" id="estado" placeholder="Ingrese el estado"> <br>
                                <label class="control-label">Precio</label><input type="text" class ="form-control" id="precio" placeholder="Ingrese el precio"> <br>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-4 control-label">Dia</label>
                                        <label class="col-md-4 control-label">Hora</label>
                                        <label class="col-md-4 control-label">Duracion</label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class='input-group date' id='dia' name="dia">
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class='input-group date' id='hora' name="hora">
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class='input-group date' id='duracion' name="duracion">
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                        </div> <br>
                                    </div>
                                </div>
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
                                            <th>Dia</th>
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
            </fieldset>
        </div>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratisimo, Inc.</p>
            </footer>
        </div>
        <script type="text/javascript">
            $('#dia').datetimepicker({
                minDate: moment(),
                format: 'dddd',
                useCurrent: false
            });
            $('#hora').datetimepicker({
                format: 'hhss'
            });
            $('#duracion').datetimepicker({
                format: 'hhss'
            });
        </script> 
        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                    this.vuelos = [];
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
                    Proxy.getVuelos(function (result) {
                        model.vuelos = result;
                        view.showVuelos();
                    });
                },
                initVuelo: function () {
                    var model = this.model;
                    model.vuelo = new Vuelo();
                },
                VueloAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.vuelo.ciudad_origen = this.view.document.getElementById("ciudad_origen").value;
                    this.model.vuelo.ciudad_destino = this.view.document.getElementById("ciudad_destino").value;
                    this.model.vuelo.estado = this.view.document.getElementById("estado").value;
                    this.model.vuelo.precio = this.view.document.getElementById("precio").value;
                    this.model.vuelo.duracion = $("#duracion").find("input").val();
                    this.model.vuelo.hora = $("#hora").find("input").val();
                    this.model.vuelo.oferta = this.view.document.getElementById("oferta").value;
                    this.model.vuelo.imagen = "NOT YET";
                     this.model.vuelo.dia = $("#dia").find("input").val();
                    Proxy.VueloAdd(this.model.vuelo, function (result) {
                        document.location = "/Aerolinea/vuelos.jsp";
                        view.showMessage();
                    });

                }


            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showVuelos();
            }

            function showVuelos() {

                var tr;
                var tabla;
                var td;
                for (var index in model.vuelos) {
                    // ----------Agregar nueva fila----------------
                    tabla = document.getElementById("tablaVuelos");
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].numero_vuelo));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].ciudad_origen.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].ciudad_destino.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].estado));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].precio));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].duracion));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].hora));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].dia));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].oferta));
                    tr.appendChild(td);

                    tabla.appendChild(tr);

                }

            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
