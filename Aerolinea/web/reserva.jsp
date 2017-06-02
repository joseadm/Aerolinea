<%-- 
    Document   : reserva
    Created on : May 20, 2017, 1:49:10 PM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="airline.model.TipoCambio"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %>    
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container"> 
            <fieldset>
                <!-- Nombre Formulario -->
                <legend align="center">Itenerario</legend>
                <!-- Itenerario.................. -->
                <div class="container">
                    <div class="table-responsive">
                        <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr><th>Número de Vuelo</th><th>Avion</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Hora Salida</th><th>Duración</th><th>Hora Llegada</th></tr>
                            </thead>
                            <tbody id="vuelosReserva">
                            </tbody>
                        </table>
                    </div> </div>
            </fieldset>
            <br>
            <div class="container"> 
                <fieldset>
                    <legend align="center">Informacion de los Pasajeros</legend>
                    <div class="row">
                        <!-- Nombre -->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Nombre</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  id="nombre" name="nombre" placeholder="Nombre" class="form-control"  type="text" maxlength="45" required>
                            </div>
                        </div>
                        <!-- Apellido-->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Apellidos</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id = "apellidos" name="apellidos" placeholder="Apellidos" class="form-control" type="text" maxlength="45" required>
                            </div>
                        </div>
                        <!-- Pasaporte-->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Numero Pasaporte</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="numero_pasaporte" name="pasaporte" placeholder="Pasaporte" class="form-control"  type="text" maxlength="45" required onKeyPress="return controller.justNumbers(event)">
                            </div>
                        </div>
                    </div>
                    <br>
                    <button onclick='controller.PasajerosAdd();' class="btn btn-success" id="agregarPasajero">Agregar</button><br><br><br>
                    <legend align="center">Pasajeros</legend>
                    <div class="container">
                        <div class="table-responsive">
                            <table id="paginacion2" class="display nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr><th>Nombre</th><th>Apellidos</th><th>Numero Pasaporte</th></tr>
                                </thead>
                                <tbody id="vuelosReserva">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br>
                </fieldset>
            </div><br><br><br>
            <fieldset>
                <legend align="center">Asientos de IDA</legend>
                <div class="plane">
                    <div class="cockpit">
                        <h1>Selecciona un asiento</h1>
                    </div>
                    <div class="exit exit--front fuselage">

                    </div>
                    <ol id="tablaAsientos" class="cabin fuselage">

                    </ol>
                    <div class="exit exit--back fuselage">

                    </div>
                </div>
            </fieldset>
            <br><br><br>
            <center><div class="container">
                    <fieldset>
                        <legend align="center">Desglose de la Reservación</legend>
                        <div class="container">
                        <div class="table-responsive">
                            <table id="paginacion3" class="display nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr><th>Cantidad de Tiquetes</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Total</th></tr>
                                </thead>
                                <tbody id="desgloseReservacion">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </fieldset>
                </div></center><br><br>
            <center><div class="container">
                    <legend align="center">Pago</legend>
                    <div id="pago" class="jumbotron">
                        <div class="row">
                            <div id="imagenTarjeta" class="container">
                                <img src="images/tarjetas.png" class="img-responsive img-center" alt="forma de pago">
                            </div>
                            <div>
                                <label class="control-label">Tipo de Cambio Actual: ‎₡ </label> <%= new TipoCambio().getVenta()%>
                            </div>
                        </div> 
                        <hr>

                        <form id="formPago" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputType" class="col-md-5 control-label">Numero de Tarjeta: </label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="numTarjeta" placeholder="1234567890">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputType" class="col-md-5 control-label">Fecha de vencimiento: </label>
                                <div class="col-md-3">
                                    <select class="form-control" id="expirationMonth" name="expirationMonth" placeholder="Mes">
                                        <option selected="selected">Enero</option><option>Febrero</option><option>Marzo</option>
                                        <option>Abril</option><option>Mayo</option><option>Junio</option>
                                        <option>Julio</option><option>Agosto</option><option>Setiembre</option>
                                        <option>Octubre</option><option>Noviembre</option><option>Diciembre</option>
                                    </select>
                                </div>
                                <div class="col-md-1">
                                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control" id="expirationYear" name="expirationYear" placeholder="Anio">
                                        <option selected="selected">2017</option><option>2018</option><option>2019</option>
                                        <option>2020</option><option>2021</option><option>2022</option>
                                        <option>2023</option><option>2024</option><option>2025</option>
                                        <option>2026</option><option>2027</option><option>2028</option>
                                    </select>
                                </div>
                            </div>
                            <hr class="my-4">
                            <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-8 text-center">
                                    <input type="submit" class="btn btn-default btn-lg" value="Aceptar" id="aceptar">
                                    <input type="button" class="btn btn-default btn-lg" value="Cancelar" id="cancelar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div></center>


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
                    .addClass('table table-striped table-bordered');

            $('#paginacion2')
                    .removeClass('display')
                    .addClass('table table-striped table-bordered');
            $('#paginacion3')
                    .removeClass('display')
                    .addClass('table table-striped table-bordered');
        </script>

        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                    this.pasajeros = [];
                    this.viajes = [];
                }
            };
        </script>
        <script> // Controller
            function Controller(model, view) {
                this.Controller(model, view);
            }
            var tipoC;
            Controller.prototype = {
                Controller: function (model, view) {
                    this.model = model;
                    this.view = view;
                    this.initTravels();
                    view.showPasajeros();
                    Proxy.getAsientos(function (result) {
                        model.asientos = result;
                    });
                    Proxy.getAviones(function (result) {
                        model.aviones = result;
                    });
                    this.initAsiento();
                },
                initTravels: function () {
                    model.viajes = JSON.parse(sessionStorage.getItem("viajes") !== null ? sessionStorage.getItem("viajes") : "[]", Storage.retrieve("viajes"));
                },
                sumaTiempos: function (val1, tiempo) {

                    t1 = val1;
                    t2 = tiempo;

                    var dot1 = t1.indexOf(":");
                    var dot2 = t2.indexOf(":");
                    var m1 = t1.substr(0, dot1);
                    var m2 = t2.substr(0, dot2);
                    var s1 = t1.substr(dot1 + 1);
                    var s2 = t2.substr(dot2 + 1);
                    var sRes = (Number(s1) + Number(s2));
                    var sRes1 = (Number(m1) + Number(m2));
                    var mRes;
                    var addMinute = false;
                    var horaFinal;
                    if (sRes >= 59) {
                        addMinute = true;
                        sRes -= 60;
                    }
                    if (sRes1 >= 23) {
                        sRes1 -= 24;
                    }
                    mRes = (sRes1 + (addMinute ? 1 : 0));
                    return horaFinal = this.formatString2(String(mRes), 2) + ":" + this.formatString(String(sRes), 2);
                },
                formatString2: function (string, len) {

                    if (string.length < len) {
                        addchar = (len - string.length);
                        for (i = 0; i < addchar; i++) {
                            string = "0" + string;
                        }
                    }

                    if (string.length > len) {
                        string = substr(string, 0, len);
                    }

                    return string;
                },

                formatString: function (string, len) {

                    if (string.length < len) {
                        addchar = (len - string.length);
                        for (i = 0; i < addchar; i++) {
                            string = string + "0";
                        }
                    }

                    if (string.length > len) {
                        string = substr(string, 0, len);
                    }

                    return string;

                },
                PasajerosAdd: function () {
                    var nombre = this.view.document.getElementById("nombre").value;
                    var apellidos = this.view.document.getElementById("apellidos").value;
                    var numero_pasajero = parseInt(this.view.document.getElementById("numero_pasaporte").value);
                    var table = $('#paginacion2').DataTable();
                    table.row.add([
                        nombre,
                        apellidos,
                        numero_pasajero
                    ]).draw(false);
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode;
                    return (key >= 48 && key <= 57);
                },
                initAsiento: function () {
                    var model = this.model;
                    model.asiento = new Asiento();
                },
                initAvion: function () {
                    var model = this.model;
                    model.avion = new Asiento();
                },
                asientoAdd: function (numero) {
                    var view = this.view;
                    var codigo = 0;
                    var numero = numero;
                    this.model.asiento.codigo = parseInt(codigo++);
                    this.model.asiento.numero = parseInt(codigo++);
                    this.model.asiento.estado = false;
                    this.model.asiento.numero_viaje = 0;
                    Proxy.AvionAdd(this.model.asiento, function (result) {
                        document.location = "/Aerolinea/asiento.jsp";
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
                showPasajeros();
                createSeat();
                showTiquet();
            }

            function showViajes() {
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                console.log(model.viajes.length);
                for (var index = 0; index < model.viajes.length; index++) {
                    t.row.add([
                        model.viajes[index].vuelo.numero_vuelo,
                        model.viajes[index].avion.marca + " " + model.viajes[index].avion.modelo,
                        model.viajes[index].vuelo.ciudad_origen.nombre,
                        model.viajes[index].vuelo.ciudad_destino.nombre,
                        model.viajes[index].fecha,
                        model.viajes[index].vuelo.hora,
                        model.viajes[index].vuelo.duracion,
                        controller.sumaTiempos(model.viajes[index].vuelo.hora, model.viajes[index].vuelo.duracion),
                    ]).draw(false);
                }
            }
            function showPasajeros() {
                var t = $('#paginacion2').DataTable();
                $('#paginacion2').dataTable().fnClearTable();
            }
            function showTiquet(){
                var t = $('#paginacion3').DataTable();
                $('#paginacion3').dataTable().fnClearTable();
            }


            $(document).ready(function () {
                var table = $('#paginacion').DataTable({
                    "paging": false,
                    "ordering": false,
                    "info": false,
                    "searching": false
                });

                var table2 = $('#paginacion2').DataTable({
                    "paging": false,
                    "ordering": false,
                    "info": false,
                    "searching": false
                });
                var table3 = $('#paginacion3').DataTable({
                    "paging": false,
                    "ordering": false,
                    "info": false,
                    "searching": false
                });
            });
            function createSeat() {
                var tabla = document.getElementById("tablaAsientos");
                var etiquetas = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I",
                    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S"];
                var li, ol, li2, tmp, lbl;
                var filas =  model.viajes[0].avion.cant_filas;
                var cant_asientos_por_fila = model.viajes[0].avion.cant_asientos_por_fila;

                for (var i = 1; i <= filas; i++) { //cant filas
                    li = document.createElement("li");
                    li.className = "row row--" + i;
                    ol = document.createElement("ol");
                    ol.className = "seats";
                    ol.type = "A";

                    for (var j = 1; j <= cant_asientos_por_fila; j++) { //cant asientos por fila
                        typeAvion(cant_asientos_por_fila);
                        li2 = document.createElement("li");
                        li2.className = "seat";
                        tmp = document.createElement("input");
                        tmp.type = "checkbox";
                        tmp.id = i + etiquetas[j];
                        tmp.disabled = false;
                        lbl = document.createElement("label");
                        lbl.htmlFor = i + etiquetas[j];
                        lbl.appendChild(document.createTextNode(i + etiquetas[j]));

                        li2.appendChild(tmp);
                        li2.appendChild(lbl);
                        ol.appendChild(li2);
                    }
                    li.appendChild(ol);
                    tabla.appendChild(li);
                }
            }

            function typeAvion(asientos) {
                if (asientos === 9)
                    document.querySelector(".cabin").style.padding = "0px 200px 0px 15px";
            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
