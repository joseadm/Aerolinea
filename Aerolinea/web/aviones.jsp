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
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
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
                                            <input type="text" class ="form-control" id="placa" placeholder="Ingrese la placa" maxlength="45" required>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Modelo</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="modelo" placeholder="Ingrese la modelo" maxlength="45" required>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Marca</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="marca" placeholder="Ingrese la marca" maxlength="45" required>
                                        </div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Cantidad Filas</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="cant_filas" placeholder="Ingrese la cantidad de filas" onKeyPress="return controller.justNumbers(event)" required>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Cantidad Asientos Fila</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <select id="cant_asientos_por_fila" name="cant_asientos_por_fila" class="form-control" >
                                                <option>6</option>
                                                <option>9</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Año</label>
                                        <div class='input-group date' id='annio' name="annio">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" required/>
                                        </div>
                                    </div>
                                </div><br>
                                <button class="btn btn-success" id="agregarRuta" onclick="controller.AvionAdd();">Agregar</button>
                                <button onclick='controller.AvionUpdate();' class="btn btn-warning" id="agregarRuta">Actualizar</button>
                                <hr> 
                            </div>                       
                            <!-- Tabla de aviones............................................................... -->
                            <div class="container">
                                <div class="table-responsive">
                                    <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
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
                                        <tbody id="listaViajes">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--....................................................................................-->
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
            // For demo to fit into DataTables site builder...
            $('#paginacion')
                    .removeClass('display')
                    .addClass('table table-bordered table-hover');
        </script>

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
                    cantidadPasajeros = parseInt(this.view.document.getElementById("cant_filas").value) * parseInt(this.view.document.getElementById("cant_asientos_por_fila").value);
                    this.model.avion.cant_pasajeros = cantidadPasajeros;
                    if(this.model.avion.cant_filas>61){
                    if (view.validacionForm())
                        view.showMessage();
                    if (view.validacionForm()) {
                        Proxy.AvionAdd(this.model.avion, function (result) {
                            document.location = "/Aerolinea/aviones.jsp";
                        });
                    }
                    }else{
                        view.showMessageError();
                }
                },
                AvionUpdate: function (codigo) {
                    var model = this.model;
                    var view = this.view;
                    var cantidadPasajeros;
                    this.model.avion.placa = this.view.document.getElementById("placa").value;
                    this.model.avion.modelo = this.view.document.getElementById("modelo").value;
                    this.model.avion.marca = this.view.document.getElementById("marca").value;
                    this.model.avion.annio = $("#annio").find("input").val();
                    this.model.avion.cant_filas = this.view.document.getElementById("cant_filas").value;
                    this.model.avion.cant_asientos_por_fila = this.view.document.getElementById("cant_asientos_por_fila").value;
                    cantidadPasajeros = parseInt(this.view.document.getElementById("cant_filas").value) * parseInt(this.view.document.getElementById("cant_asientos_por_fila").value);
                    this.model.avion.cant_pasajeros = cantidadPasajeros;
                    if(this.model.avion.cant_filas>61){
                    if (view.validacionForm())
                        view.showMessageUpdate();
                    if (view.validacionForm()) {
                        Proxy.AvionUpdate(this.model.avion, function (result) {
                            document.location = "/Aerolinea/aviones.jsp"
                           
                        });
                    }
                    }else{
                        view.showMessageError();
                }
                },
                LimpiaPantalla: function () {
                    view.clean();
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode;
                    if (key==8 || key==127 || key==9) return true;
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
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in model.aviones) {
                    t.row.add([
                        model.aviones[index].placa,
                        model.aviones[index].modelo,
                        model.aviones[index].marca,
                        model.aviones[index].annio,
                        model.aviones[index].cant_pasajeros,
                        model.aviones[index].cant_filas,
                        model.aviones[index].cant_asientos_por_fila
                    ]).draw(false);
                }
            }

            $(document).ready(function () {
                var table = $('#paginacion').DataTable({
                    "columnDefs": [{
                            "targets": -2,
                            "data": null, 
                            "defaultContent":'<img class="btn-edit" src="images/edit.png">'
                            
                        }, {
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                    '<img class="btn-delete" src="images/delete.png">'
                        }]
                });
                
                $('#paginacion tbody').on( 'click', '.btn-edit', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                     Proxy.getAvion(data[0], function(result){
                        var placa = document.getElementById("placa"); placa.value=result.placa;
                        var modelo = document.getElementById("modelo"); modelo.value=result.modelo;
                        var marca = document.getElementById("marca"); marca.value=result.marca;
                        var cant_filas = document.getElementById("cant_filas"); cant_filas.value=result.cant_filas;
                        var cant_asientos_por_fila = document.getElementById("cant_asientos_por_fila"); cant_asientos_por_fila.value=result.cant_asientos_por_fila;
                     });
                 } );
                 
                 $('#paginacion tbody').on( 'click', '.btn-delete', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                     Proxy.AvionDelete(data[0], function(result){
                        document.location = "/Aerolinea/aviones.jsp"
                        this.showMessageDelete();
                     });
                 } );

            });
            function clean() {
                document.getElementById("placa").textContent = "";
            }
            function showMessage() {
                window.alert("Registro exitoso");
            }
            function showMessageError() {
                window.alert("Cantidad de filas excede el máximo permitido");
            }
            function showMessageUpdate() {
                window.alert("Actualizacion exitosa");
            }
            function showMessageDelete() {
                window.alert("Eliminacion exitosa");
            }
            function validacionForm() {
                var tam = 0;
                var placa = document.getElementById("placa");
                if (!(requiredField(placa.value))) {
                    tam++;
                    placa.style.borderColor = "red";
                } else {
                    placa.style.borderColor = "gray";
                }
                var modelo = document.getElementById("modelo");
                if (!(requiredField(modelo.value))) {
                    tam++;
                    modelo.style.borderColor = "red";
                } else {
                    modelo.style.borderColor = "gray";
                }
                var marca = document.getElementById("marca");
                if (!(requiredField(marca.value))) {
                    tam++;
                    marca.style.borderColor = "red";
                } else {
                    marca.style.borderColor = "gray";
                }
                var cant_filas = document.getElementById("cant_filas");
                if (!(requiredField(cant_filas.value))) {
                    tam++;
                    cant_filas.style.borderColor = "red";
                } else {
                    cant_filas.style.borderColor = "gray";
                }
                var annio = $("#annio").find("input");
                if (annio.val() === "") {
                    tam++;
                }
                if (tam > 0) {

                    return false;
                }
                return true;
            }
            function requiredField(valor) {
                if (valor === null || valor.length === 0 || /^\s+$/.test(valor)) {

                    return false;
                }
                return true;
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
