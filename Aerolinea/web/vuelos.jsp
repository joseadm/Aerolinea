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
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <!--<input type="text" class ="form-control" id="ciudad_origen" placeholder="Ingrese codigo de la ciudad" maxlength="45">-->
                                            <select id="ciudad_origen" name="ciudad_origen" class="form-control" ></select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Ciudad Destino</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <!--<input type="text" class ="form-control" id="ciudad_destino" placeholder="Ingrese codigo de la ciudad" maxlength="45">-->
                                            <select id="ciudad_destino" name="ciudad_destino" class="form-control" ></select>
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
                                <button class="btn btn-success" id="agregarRuta" onclick="controller.VueloAdd();" >Agregar</button>
                                <hr> 
                            </div>
                            <!-- Tabla de vuelos............................................................... 
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
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaVuelos">
                                    </tbody>
                                </table>
                            </div>-->
                            <!-- Tabla de viajes............................................................... -->
                            <div class="container">
                                <div class="table-responsive">
                                    <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
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
                                                <th>Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listaViajes">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--............................................................... -->

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
        <script type="text/javascript">
            $('#dia').datetimepicker({
                minDate: moment(),
                format: 'dddd',
                useCurrent: false
            });
            $('#hora').datetimepicker({
                format: 'hh:ss'
            });
            $('#duracion').datetimepicker({
                format: 'hh:ss'
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
                    this.initVuelo();
                },
                initVuelo: function () {
                    var model = this.model;
                    model.vuelo = new Vuelo();
                },
                VueloAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    var ciudad1 = new Ciudad(this.view.document.getElementById("ciudad_origen").value,"","");
                    var ciudad2 = new Ciudad(this.view.document.getElementById("ciudad_destino").value,"","");
                    //Proxy.getCiudad(this.view.document.getElementById("ciudad_origen").value, function (result) {
                        //ciudad1 = result;
                    //});
                    //Proxy.getCiudad(this.view.document.getElementById("ciudad_destino").value, function (result) {
                        //ciudad2 = result;
                    //});
                    
                    this.model.vuelo.numero_vuelo = 0;
                    this.model.vuelo.ciudad_origen = ciudad1;
                    this.model.vuelo.ciudad_destino = ciudad2;
                    this.model.vuelo.estado = this.view.estado(this.view.document.getElementById("estado").value);
                    this.model.vuelo.precio = parseInt(this.view.document.getElementById("precio").value);
                    this.model.vuelo.duracion = $("#duracion").find("input").val();
                    this.model.vuelo.hora = $("#hora").find("input").val();
                    this.model.vuelo.oferta = this.view.oferta(this.view.document.getElementById("oferta").value);
                    this.model.vuelo.imagen = "NOT YET";
                    this.model.vuelo.dia = $("#dia").find("input").val();
                    this.model.vuelo.descuento = parseInt(this.view.document.getElementById("descuento").value);
                    Proxy.VueloAdd(this.model.vuelo, function (result) {
                        this.model.vuelo.numero_vuelo = result;
                        document.location = "/Aerolinea/vuelos.jsp";
                        view.showMessage();
                    });

                },
                doDelete: function (numero_vuelo) {
                    Proxy.VueloDelete(numero_vuelo, function (result) {
                        model.viaje.numero_viaje = result;
                        document.location = "/Aerolinea/vuelos.jsp"
                        view.showMessageDelete();
                    });
                },
                doUpdate: function (numero_vuelo) {
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode;
                    return (key >= 48 && key <= 57);
                },
                estado: function (estado) {
                    switch (estado) {
                        case"Disponible":
                            return "true";
                            break;
                        case"Inhabilitado":
                            return "false";
                            break;
                    }
                },
                oferta: function (oferta) {
                    switch (estado) {
                        case"Aplicar Oferta":
                            return "true";
                            break;
                        case"No Aplicar":
                            return "false";
                            break;
                    }
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
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in model.vuelos) {
                    t.row.add([
                        model.vuelos[index].numero_vuelo,
                        model.vuelos[index].ciudad_origen.nombre,
                        model.vuelos[index].ciudad_destino.nombre,
                        model.vuelos[index].estado,
                        model.vuelos[index].precio,
                        model.vuelos[index].duracion,
                        model.vuelos[index].hora,
                        model.vuelos[index].dia,
                        model.vuelos[index].oferta,
                        model.vuelos[index].descuento
                    ]).draw(false);
                }
            }

            $(document).ready(function () {
                var table = $('#paginacion').DataTable({
                    "columnDefs": [{
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                    '<img src="images/delete.png">'
                        }]
                });

            });
            /*
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
             
             
             td = document.createElement("td");
             img = document.createElement("img");
             img.src = "images/delete.png";
             img.title = "Eliminar"
             img.addEventListener("click", function(e){
             doDelete(model.vuelos[index].numero_vuelo);});
             td.appendChild(img);
             tr.appendChild(td);
             
             tabla.appendChild(tr);
             
             }
             
             }*/
            function estado(estado) {
                switch (estado) {
                    case"Disponible":
                        return 1;
                        break;
                    case"Inhabilitado":
                        return 0;
                        break;
                }
            }
            function oferta(oferta) {
                switch (estado) {
                    case"Aplicar Oferta":
                        return 1;
                        break;
                    case"No Aplicar":
                        return 0;
                        break;
                }
            }
             function listCiudades() {
                var select = document.getElementById("ciudad_origen");
                var select2 = document.getElementById("ciudad_destino");
                for (var index in model.ciudades) {
                    select.options[select.options.length] = new Option(model.ciudades[index].codigo);
                    select2.options[select2.options.length] = new Option(model.ciudades[index].codigo);
                }
            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
