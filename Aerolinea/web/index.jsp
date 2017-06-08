<%-- 
    Document   : index
    Created on : May 18, 2017, 12:12:25 AM
    Author     : AndreyCh
--%>
<%@ page import="airline.model.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %>    
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <!-- Bar slider -->
        <section class="section-white">
            <div class="container">
                <div id="carousel-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators" id="circulos">
                        <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" id="listaCarousel">
                        <div class="item active">
                            <img src="images/Avion.jpg" alt="...">
                            <div class="carousel-caption">
                                <h1>Vuelos en Promoción</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Controles -->
                    <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </section>
        <hr>
        <!-- Search Option -->
        <div class="container jumbo">
            <h2>Vuelo</h2>
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h4>Origen</h4>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
                        <select id="origen" name="origen" class="form-control" ></select>
                    </div> <br>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h4>Destino</h4>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
                        <select id="destino" name="destino" class="form-control" ></select>
                    </div> <br>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h4>Tipo</h4>
                    <h4><input type="radio" id="vuelta" name="tipo" value="vuelta"> Ida y vuelta &nbsp;&nbsp;<input type="radio" id="ida" name="tipo" value="ida"> Solo Ida</h4>
                </div>
            </div>
            <div class="row">     
                <div class='col-xs-12 col-sm-4 col-md-4'>
                    <h4>Fecha ida</h4>
                    <div class="form-group">
                        <div class='input-group date' id='fecha_ida'>
                            <span class="input-group-addon">
                                <span class="glyphicon-calendar glyphicon"></span>
                            </span>
                            <input type='text' class="form-control" />
                        </div>
                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 col-md-4'>
                    <h4>Fecha regreso</h4>
                    <div class="form-group">
                        <div class='input-group date' id='fecha_regreso'>
                            <span class="input-group-addon">
                                <span class="glyphicon-calendar glyphicon"></span>
                            </span>
                            <input type='text' class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h4>Número de Pasajeros</h4>
                    <div class="form-group">
                        <select class="form-control" id="listPassengers" name="passengers">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-xs-2"></div>
                <div class="col-xs-8">
                    <input type="button" class="btn btn-group-justified btn-default" id="btn_search" value="Buscar Viaje">
                </div>
            </div>
            <br>
        </div>
        <hr>
        <!-- Tabla de vuelos............................................................... -->
        <div class="container">
            <h2>Vuelo de Ida</h2>
            <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                <thead>
                    <tr><th>Numero Viaje</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Duración</th><th>Precio</th><th>Reservar</th></tr>
                </thead>
                <tbody id="listaBuscados">
                </tbody>
            </table>
        </div>
        <!--....................................................................................-->
        <!-- Tabla de vuelos............................................................... -->
        <div class="container" id="tablaVueloVuelta">
            <h2>Vuelo de Vuelta</h2>
            <table id="paginacion2" class="display nowrap" cellspacing="0" width="100%">
                <thead>
                    <tr><th>Numero Viaje</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Duración</th><th>Precio</th><th>Reservar</th></tr>
                </thead>
                <tbody id="listaBuscados2">
                </tbody>
            </table>
        </div>
        <!--....................................................................................-->
        <br><br><br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratísimo, Inc.</p>
            </footer>
        </div>
        <script type="text/javascript">
            // For demo to fit into DataTables site builder...
            $('#paginacion')
                    .removeClass('display')
                    .addClass('table table-striped table-bordered');

            $('#paginacion2')
                    .removeClass('display')
                    .addClass('table table-striped table-bordered');
        </script>
        <script type="text/javascript">
            $(function () {
                $('#fecha_ida').datetimepicker({
                    format: 'YYYY-MM-DD dddd',
                    useCurrent: false
                });
                $('#fecha_regreso').datetimepicker({
                    format: 'YYYY-MM-DD dddd',
                    useCurrent: false
                });
                $("#fecha_ida").on("dp.change", function (e) {
                    $('#fecha_regreso').data("DateTimePicker").minDate(e.date);
                });
                $("#fecha_regreso").on("dp.change", function (e) {
                    $('#fecha_ida').data("DateTimePicker").maxDate(e.date);
                });
                $('#fecha_ida').data("DateTimePicker").minDate(new Date());
            });
        </script> 
        <script> // Model

            function AirlineModel() {
                this.AirlineModel();
            }

            AirlineModel.prototype = {
                AirlineModel: function () {
                    this.buscadosIda = [];
                    this.buscadosVuelta = [];
                    this.promo = [];
                    this.ciudades = [];
                    this.vuelos = [];
                }
            };
        </script>
        <script> // Controller
            function AirlineController(model, view) {
                this.AirlineController(model, view);
            }

            AirlineController.prototype = {
                AirlineController: function (model, view) {
                    this.model = model;
                    this.view = view;
                    Proxy.getCiudades(function (result) {
                        model.ciudades = result;
                        view.listCiudades();
                    });
                    Proxy.getPromo(function (result) {
                        model.promo = result;
                        view.showPromos();
                    });
                },
                search: function () {
                    var origen = this.view.$("#origen").val();
                    var destino = this.view.$("#destino").val();
                    var model = this.model;
                    var view = this.view;
                    var radio1 = document.getElementById("ida");
                    var radio2 = document.getElementById("vuelta");
                    var ida = $("#fecha_ida").find("input").val().split(" ");
                    var regreso = $("#fecha_regreso").find("input").val().split(" ");
                    var diaIda = ida[1];
                    var fechaIDa = ida[0];
                    var diaVuelta = regreso[1];
                    var fechaVuelta = regreso[0];
                    if (radio1.checked) {
                        Proxy.viajesSearch(origen, destino, diaIda, fechaIDa, function (result) {
                            model.buscadosIda = result;
                            view.showBuscado();
                        });
                    }
                    if (radio2.checked && fechaVuelta != "") {
                        Proxy.viajesSearch(origen, destino, diaIda, fechaIDa, function (result) {
                            model.buscadosIda = result;
                        });
                        Proxy.viajesSearchByDestiny(origen, destino, diaVuelta, fechaVuelta, function (result) {
                            model.buscadosVuelta = result;
                            if (model.buscadosIda != null && model.buscadosVuelta != null) {
                                view.showBuscado();
                                view.showBuscadoVuelta();
                            }
                        });
                    }
                }
            };
        </script>
        <script> // View
            var model;
            var controller;
            var viajes = [];
            function pageLoad(event) {
                modelView = new AirlineModel();
                controllerView = new AirlineController(modelView, window);
                showPromos(); // Crea promociones en la pagina
                addEventListeners();
                listCiudades();
                oneWay();
                window.localStorage.clear();
                window.sessionStorage.clear();
            }

            function showPromos() {

                var circulos;
                var titulo;
                var li;
                var lista;
                var div1;
                var div2;
                var img1;
                var precio;
                var boton;
                for (var index in modelView.promo) {
                    // -----------Agregar nuevo circulo---------------
                    circulos = document.getElementById("circulos");
                    li = document.createElement("li");
                    li.setAttribute("data-target", "#carousel-generic");
                    li.setAttribute("data-slide-to", index + 1);
                    circulos.appendChild(li);
                    // ----------Agregar nuevo item----------------
                    lista = document.getElementById("listaCarousel");
                    div1 = document.createElement("div");
                    div1.setAttribute("class", "item");
                    img1 = document.createElement("img");
                    img1.setAttribute("src", "images/" + modelView.promo[index].ciudad_destino.nombre + ".jpg");
                    div1.appendChild(img1);
                    div2 = document.createElement("div");
                    div2.setAttribute("class", "carousel-caption");
                    titulo = document.createElement("h2");
                    titulo.appendChild(document.createTextNode(modelView.promo[index].ciudad_origen.nombre + " " + modelView.promo[index].ciudad_destino.nombre));
                    precio = document.createElement("h5");
                    precio.appendChild(document.createTextNode("Obten tu viaje por tan solo " + modelView.promo[index].precio + "$"));
                    /*boton = document.createElement("button");
                    boton.setAttribute("class", "btn btn-view btn-primary");
                    boton.appendChild(document.createTextNode("Ordenar"));
                    boton.addEventListener('click', function (e) {
                        var v1 = new Viaje(modelView.promo[index].numero_viaje, modelView.promo[index].fecha, modelView.promo[index].avion, modelView.promo[index].vuelo);
                        viajes.push(v1);
                        sessionStorage.setItem("viajes", JSON.stringify(viajes, JsonUtils.replacer));
                        document.location = "reserva.jsp";
                    });*/
                    div2.appendChild(titulo);
                    div2.appendChild(precio);
                    //div2.appendChild(boton);
                    div1.appendChild(div2);
                    lista.appendChild(div1);
                }
            }

            function addEventListeners() {
                var origen = document.getElementById("origen");
                var destino = document.getElementById("destino");
                var fecha_ida = document.getElementById("fecha_ida");
                var fecha_regreso = document.getElementById("fecha_regreso");
                var ida = document.getElementById("ida");
                var vuelta = document.getElementById("vuelta");
                var pasajeros = document.getElementById("listPassengers");
                var buscar = document.getElementById("btn-search");
                $('#btn_search').click(function () {
                    sessionStorage.clear();
                    controllerView.search();
                });
            }
            function doFocus(event) {
                event.target.classList.add("focus");
            }
            function doBlur(event) {
                event.target.classList.remove("focus");
            }
            function listCiudades() {
                var select = document.getElementById("origen");
                var select2 = document.getElementById("destino");
                for (var index in modelView.ciudades) {
                    select.options[select.options.length] = new Option(modelView.ciudades[index].info());
                    select2.options[select2.options.length] = new Option(modelView.ciudades[index].info());
                }
            }

            //Si la opcion de ida es seleccionada solo la fecha ida es habilitada
            function oneWay() {
                var ida = document.getElementById("ida");
                var vuelta = document.getElementById("vuelta");
                ida.onclick = function () {
                    $("#fecha_regreso").hide();
                    $('#tablaVueloVuelta').hide();


                };
                vuelta.onclick = function () {
                    $("#fecha_regreso").show();
                    $('#tablaVueloVuelta').show();
                };
            }
            function showBuscado() {
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in modelView.buscadosIda) {
                    t.row.add([
                        modelView.buscadosIda[index].numero_viaje,
                        modelView.buscadosIda[index].vuelo.ciudad_origen.nombre,
                        modelView.buscadosIda[index].vuelo.ciudad_destino.nombre,
                        modelView.buscadosIda[index].fecha,
                        modelView.buscadosIda[index].vuelo.duracion,
                        "$ " + modelView.buscadosIda[index].vuelo.precio
                    ]).draw(false);
                }
            }

            function showBuscadoVuelta() {
                var t = $('#paginacion2').DataTable();
                $('#paginacion2').dataTable().fnClearTable();
                for (var index in modelView.buscadosVuelta) {
                    t.row.add([
                        modelView.buscadosVuelta[index].numero_viaje,
                        modelView.buscadosVuelta[index].vuelo.ciudad_origen.nombre,
                        modelView.buscadosVuelta[index].vuelo.ciudad_destino.nombre,
                        modelView.buscadosVuelta[index].fecha,
                        modelView.buscadosVuelta[index].vuelo.duracion,
                        "$ " + modelView.buscadosVuelta[index].vuelo.precio
                    ]).draw(false);
                }
            }

            $(document).ready(function () {
                var radio1 = document.getElementById("ida");
                var radio2 = document.getElementById("vuelta");
                var table = $('#paginacion').DataTable({
                    "columnDefs": [{
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                    '<input class="btn-view" name="option" type="radio">'
                        }]
                });

                var table2 = $('#paginacion2').DataTable({
                    "columnDefs": [{
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                    '<input class="btn-view" name="option2" type="radio">'
                        }]
                });

                $('#paginacion tbody').on('click', '.btn-view', function (e) {
                    var tr = $(this).closest('tr');
                    var row = table.row(tr).data();
                    var canPasajeros = document.getElementById("listPassengers").value;
                    for (var index in modelView.buscadosIda) {
                        if (modelView.buscadosIda[index].numero_viaje === row[0]) {
                            var v1 = new Viaje(modelView.buscadosIda[index].numero_viaje, modelView.buscadosIda[index].fecha, modelView.buscadosIda[index].avion, modelView.buscadosIda[index].vuelo);
                            viajes.push(v1);
                            sessionStorage.setItem("viajes", JSON.stringify(viajes, JsonUtils.replacer));
                            if (radio1.checked) {
                                document.location = "reserva.jsp";
                            }
                        }
                    }
                    sessionStorage.setItem("cantidadPasajeros", canPasajeros);
                });
                $('#paginacion2 tbody').on('click', '.btn-view', function (e) {
                    var tr = $(this).closest('tr');
                    var row = table2.row(tr).data();
                    for (var index in modelView.buscadosVuelta) {
                        if (modelView.buscadosVuelta[index].numero_viaje === row[0]) {
                            var v1 = new Viaje(modelView.buscadosVuelta[index].numero_viaje, modelView.buscadosVuelta[index].fecha, modelView.buscadosVuelta[index].avion, modelView.buscadosVuelta[index].vuelo);
                            viajes.push(v1);
                            sessionStorage.setItem("viajes", JSON.stringify(viajes, JsonUtils.replacer));
                        }
                    }
                });
                $('#paginacion tbody').on('click', '.btn-view', function (e) {
                    $('#paginacion2 tbody').on('click', '.btn-view', function (e) {
                        var canPasajeros = document.getElementById("listPassengers").value;
                        if (radio2.checked) {
                            document.location = "reserva.jsp";
                        }
                        sessionStorage.setItem("cantidadPasajeros", canPasajeros);
                    });
                });
                $('#paginacion2 tbody').on('click', '.btn-view', function (e) {
                    $('#paginacion tbody').on('click', '.btn-view', function (e) {
                        var canPasajeros = document.getElementById("listPassengers").value;
                        if (radio2.checked) {
                            document.location = "reserva.jsp";
                        }
                        sessionStorage.setItem("cantidadPasajeros", canPasajeros);
                    });
                });
            });





            document.addEventListener("DOMContentLoaded", pageLoad)
        </script>
    </body>
</html>
