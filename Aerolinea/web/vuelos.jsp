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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
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
                            <h1 class="page-header">Vuelos</h1>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Ciudad Origen</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
                                            <select id="origen" name="ciudad_origen" class="form-control" ></select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Ciudad Destino</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
                                            <select id="destino" name="ciudad_destino" class="form-control" ></select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Estado</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-cog"></span></span>
                                            <select id="estado" name="estado" class="form-control" >
                                                <option  value=" ">Disponible</option>
                                                <option>Inhabilitado</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Dia</label>
                                        <div class='input-group date' id='dia' name="dia">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Hora</label>
                                        <div class='input-group date' id='hora' name="hora">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-time"></span>
                                            </span>
                                            <input type='text' class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Duracion</label>
                                        <div class='input-group date' id='duracion' name="duracion">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-time"></span>
                                            </span>
                                            <input type='text' class="form-control"/>
                                        </div>
                                    </div> 
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Precio</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                            <input type="text" class ="form-control" id="precio" placeholder="Ingrese el precio" onKeyPress="return controller.justNumbers(event)">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Oferta</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-cog"></span></span>
                                            <select id="oferta" name="oferta" class="form-control" >
                                                <option  value=" ">Aplicar Oferta</option>
                                                <option>No Aplicar</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Descuento</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                            <input type="text" class ="form-control" id="descuento" placeholder="Ingrese el descuento" onKeyPress="return controller.justNumbers(event)">
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-2 col-md-2">
                                        <button class="btn btn-success" id="agregarRuta" onclick="controller.VueloAdd();" >Agregar</button>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2">
                                        <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
                                    </div>
                                </div>
                            </div>
                            <!-- Tabla de vuelos............................................................... -->
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
                                            <th>Descuento</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaVuelos">
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
                    Proxy.getCiudades(function (result) {
                        model.ciudades = result;
                        view.listCiudades();
                    });
                },
                initVuelo: function () {
                    var model = this.model;
                    model.vuelo = new Vuelo();
                },
                VueloAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    var v = view.document.getElementById("origen").value;
                    var v2 = view.document.getElementById("destino").value;
                    model.vuelo.ciudad_origen = this.searchCity(v);
                    model.vuelo.ciudad_destino = this.searchCity(v2);
                    model.vuelo.estado = view.estado(view.document.getElementById("estado").value);
                    model.vuelo.precio = parseInt(view.document.getElementById("precio").value);
                    model.vuelo.duracion = $("#duracion").find("input").val();
                    model.vuelo.hora = $("#hora").find("input").val();
                    model.vuelo.oferta = view.oferta(view.document.getElementById("oferta").value);
                    model.vuelo.imagen = "NOT YET";
                    model.vuelo.dia = $("#dia").find("input").val();
                    model.vuelo.descuento = parseInt(view.document.getElementById("descuento").value);
                    Proxy.VueloAdd(this.model.vuelo, function (result) {
                        document.location = "/Aerolinea/vuelos.jsp";
                        view.showMessage();
                    });

                },
                searchCity: function (nombreC) {
                    for (var index in model.ciudades) {
                        if (model.ciudades[index].nombre === nombreC) {
                            return model.ciudades[index].codigo;
                        }
                    }
                },
                justNumbers: function (e) {
                        var key = window.Event ? e.which : e.keyCode
                        return (key >= 48 && key <= 57)
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
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.vuelos[index].descuento));
                    tr.appendChild(td);
                    
                    td= document.createElement("td");
                    img= document.createElement("img");
                    img.src="images/edit.png";
                    img.title="Editar"
                    //img.addEventListener("click", function(e){doQuery(per);});
                    td.appendChild(img);
                    tr.appendChild(td);

                    td= document.createElement("td");
                    img= document.createElement("img");
                    img.src="images/delete.png";
                    img.title="Eliminar"
                    //img.addEventListener("click", function(e){doDelete(per);});
                    td.appendChild(img);
                    tr.appendChild(td);
                    
                    tabla.appendChild(tr);

                }

            }
            function listCiudades() {
                var select = document.getElementById("ciudad_origen");
                var select2 = document.getElementById("ciudad_destino");
                for (var index in model.ciudades) {
                    select.options[select.options.length] = new Option(model.ciudades[index].nombre);
                    select2.options[select2.options.length] = new Option(model.ciudades[index].nombre);
                }
            }
            function estado(estado) {
                switch (estado) {
                    case"Disponible":
                        return true;
                        break;
                    case"Inhabilitado":
                        return false;
                        break;
                }
            }
            function oferta(oferta) {
                switch (estado) {
                    case"Aplicar Oferta":
                        return true;
                        break;
                    case"No Aplicar":
                        return false;
                        break;
                }
            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
