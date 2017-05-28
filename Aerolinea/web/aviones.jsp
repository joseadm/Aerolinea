<%-- 
    Document   : tiposAviones
    Created on : May 18, 2017, 12:27:38 AM
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
                        <div class="col-sm-8 col-md-12 main">
                            <h1 class="page-header">Aviones</h1>
                            <div id="avion" class="form-group">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Placa</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="placa" placeholder="Ingrese la placa" maxlength="45">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Modelo</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="modelo" placeholder="Ingrese la modelo" maxlength="45">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Marca</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="marca" placeholder="Ingrese la marca" maxlength="45">
                                        </div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Cantidad Filas</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="cant_filas" placeholder="Ingrese la cantidad de filas" onKeyPress="return controller.justNumbers(event)">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Cantidad Asientos Fila</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="cant_asientos_por_fila" placeholder="Ingrese la cantidad de asientos por fila" onKeyPress="return controller.justNumbers(event)">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Año</label>
                                        <div class='input-group date' id='annio' name="annio">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" />
                                        </div>
                                    </div>
                                </div><br>
                                <button class="btn btn-success" id="agregarRuta" onclick="controller.AvionAdd();">Agregar</button>
                                <button class="btn btn-warning" id="limpiarRuta" onclick="controller.LimpiaPantalla();">Limpiar</button>
                                </form>
                            </div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Placa</th>
                                        <th>Modelo</th>
                                        <th>Marca</th>
                                        <th>Año</th>
                                        <th>Pasajeros</th>
                                        <th>Filas</th>
                                        <th>Ascientos</th>
                                        <th>Editar</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaAviones">
                                    <!-- Contenido de la tabla -->
                                </tbody>
                            </table>
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
                    this.aviones = [];
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
                    Proxy.getAviones(function (result) {
                        model.aviones = result;
                        view.showAviones();
                    });
                    this.initAvion();
                },
                initAvion: function () {
                    var model = this.model;
                    model.avion = new Avion();
                },
                AvionAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    var cantidadPasajeros;
                    this.model.avion.placa = this.view.document.getElementById("placa").value;
                    this.model.avion.modelo = this.view.document.getElementById("modelo").value;
                    this.model.avion.marca = this.view.document.getElementById("marca").value;
                    this.model.avion.annio = $("#annio").find("input").val();
                    this.model.avion.cant_filas = this.view.document.getElementById("cant_filas").value;
                    this.model.avion.cant_asientos_por_fila = this.view.document.getElementById("cant_asientos_por_fila").value;
                    cantidadPasajeros = parseInt(this.view.document.getElementById("cant_filas").value)*parseInt(this.view.document.getElementById("cant_asientos_por_fila").value);
                    this.model.avion.cant_pasajeros = cantidadPasajeros;
                    Proxy.AvionAdd(this.model.avion, function (result) {
                        document.location = "/Aerolinea/aviones.jsp"
                        view.showMessage();
                    });

                },
                LimpiaPantalla: function () {
                    view.clean();
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode;
                    return (key >= 48 && key <= 57);
                }

            };
        </script>
        <script> // View
            var model;
            var controller;

            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showAviones();
            }

            function showAviones() {

                var tr;
                var tabla;
                var td;

                for (var index in model.aviones) {
                    // ----------Agregar nueva fila----------------
                    tabla = document.getElementById("tablaAviones");
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].placa));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].modelo));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].marca));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].annio));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].cant_pasajeros));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].cant_filas));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.aviones[index].cant_asientos_por_fila));
                    tr.appendChild(td);

                    td = document.createElement("td");
                    img = document.createElement("img");
                    img.src = "images/edit.png";
                    img.title = "Editar"
                    //img.addEventListener("click", function(e){doQuery(per);});
                    td.appendChild(img);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    img = document.createElement("img");
                    img.src = "images/delete.png";
                    img.title = "Eliminar"
                    //img.addEventListener("click", function(e){doDelete(per);});
                    td.appendChild(img);
                    tr.appendChild(td);

                    tabla.appendChild(tr);

                }

            }
            function clean() {
                document.getElementById("placa").textContent = "";
            }
            function showMessage() {
                window.alert("Registro exitoso");
            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script> 
        <script type="text/javascript">
            $('#annio').datetimepicker({
                viewMode: 'years',
                format: 'YYYY'
            });
        </script> 
    </body>
</html>
