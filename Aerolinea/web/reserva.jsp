<%-- 
    Document   : reserva
    Created on : May 20, 2017, 1:49:10 PM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="airline.model.TipoCambio"%>
<%@page import="airline.model.Usuario"%>
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
        <% Usuario user1 = (Usuario) request.getSession().getAttribute("usuario"); %>
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
                    <div class="row" id="table-pasajeros">

                    </div>
                    <br>
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
                <div id="divR" class="container">
                    <button id="btnReserva" onclick="reservarAsientos()" type="button" class="btn btn-success">Reservar</button>
                </div>
            </fieldset>
            <fieldset id="asientosVuelta">
                <legend align="center">Asientos de VUELTA</legend>
                <div class="plane">
                    <div class="cockpit">
                        <h1>Selecciona un asiento</h1>
                    </div>
                    <div class="exit exit--front fuselage">

                    </div>
                    <ol id="tablaAsientos2" class="cabin fuselage">

                    </ol>
                    <div class="exit exit--back fuselage">

                    </div>
                </div>
                <div id="divR" class="container">
                    <button id="btnReserva" onclick="reservarAsientos2()" type="button" class="btn btn-success">Reservar</button>
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
                                <% double tipoCambio = new TipoCambio().getVenta();%>
                                <label class="control-label">Tipo de Cambio Actual: ‎₡ </label> <%=tipoCambio%>
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
                                    <input onclick='controller.ReservaAdd();' type="submit" class="btn btn-default btn-lg" value="Aceptar" id="aceptar">
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
                    this.reservas = [];
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
                    Proxy.getAsientos(function (result) {
                        model.asientos = result;
                    });
                    Proxy.getAviones(function (result) {
                        model.aviones = result;
                    });
                    this.initAsiento();
                    this.initReservaciones();
                },

                initReservaciones: function () {
                    var model = this.model;
                    model.reservacion = new Reservacion();
                },
                ReservaAdd: function () {
                    this.model.reservacion.nombreUsuario.usuario = "p001";
                    this.model.reservacion.viaje1.numero_viaje = this.model.viajes[0].numero_viaje;
                    this.model.reservacion.viaje2.numero_viaje = this.model.viajes[1].numero_viaje;
                    this.model.reservacion.fecha_reserva = this.model.viajes[0].fecha;
                    this.model.reservacion.precioTotal = 300 * 2;
                    Proxy.ReservacionAdd(this.model.reservacion, function (result) {
                        view.showMessage();
                    });
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
                ReservaAdd2: function () {
                    var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                    if (view.validacionForm()) {
                        var loginUsuario = new Usuario("<%=user1.getUsuario()%>","<%=user1.getContrasena()%>","<%=user1.getNombre()%>",
                                        "<%=user1.getApellidos()%>","<%=user1.getCorreo()%>",new Date('<%=user1.getFecha_nac()%>'),
                                        "<%=user1.getDireccion()%>",<%=user1.getTelefono()%>,<%=user1.getCelular()%>,<%=user1.getTipo()%>);
                        this.model.reservacion.codigo = 0;
                        this.model.reservacion.nombreUsuario = loginUsuario;
                        this.model.reservacion.viaje1 = this.model.viajes[0];
                        this.model.reservacion.precioTotal = cant_pasajeros * this.model.viajes[0].vuelo.precio;
                        this.model.reservacion.fecha_reserva = new Date();
                        this.AsientoUpdate1();
                        if (this.model.viajes[1] != null) {
                            this.model.reservacion.viaje2 = this.model.viajes[1];
                            var subtotal1 = this.model.reservacion.precioTotal;
                            var subtotal2 = cant_pasajeros * this.model.viajes[1].vuelo.precio;
                            this.model.reservacion.precioTotal = subtotal1 + subtotal2;
                            this.AsientoUpdate2();
                            Proxy.ReservacionAdd2(this.model.reservacion, function (result) {
                                this.model.reservacion.codigo = result;
                            });
                        }
                        if (this.model.viajes[1] == null) {
                            Proxy.ReservacionAdd(this.model.reservacion, function (result) {
                                this.model.reservacion.codigo = result;
                            });
                        }
                        this.TiqueteAdd(this.model.reservacion);
                    }
                    if (view.validacionForm()) {
                        view.showMessage();
                        document.location = "/Aerolinea/index.jsp";
                    }
                },
                TiqueteAdd: function (reserva) {
                    var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                    var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                    for (var i = 0; i < cant_pasajeros && i < x.length; i++) {
                        var nombreP = document.getElementById("nombre" + i);
                        var apellidosP = document.getElementById("apellidos" + i);
                        var pasaporteP = document.getElementById("numero_pasaporte" + i);
                        this.model.tiquete.codigo = 0;
                        this.model.tiquete.nombre_pasajero = nombreP;
                        this.model.tiquete.apellidos_pasajero = apellidosP;
                        this.model.tiquete.pasaporte_pasajero = pasaporteP;
                        this.model.tiquete.codigo_reservacion = reserva;
                        this.model.asiento.codigo = 0;
                        this.model.asiento.estado = true;
                        this.model.asiento.numero = $(x[i]).attr('id');
                        this.model.asiento.numero_viaje = this.model.viajes[0];
                        this.model.tiquete.codigo_asiento = this.model.asiento;
                    }
                },
                AsientoUpdate1: function () {
                    var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].checked && !x[i].disabled) {
                            this.model.asiento.codigo = 0;
                            this.model.asiento.estado = true;
                            this.model.asiento.numero = $(x[i]).attr('id');
                            this.model.asiento.numero_viaje = this.model.viajes[0];
                            Proxy.AsientoUpdate(this.model.asiento, function (result) {
                                this.model.asiento.codigo = result;
                            });
                        }
                    }
                },
                AsientoUpdate2: function () {
                    var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].checked && !x[i].disabled) {
                            this.model.asiento.codigo = 0;
                            this.model.asiento.estado = true;
                            this.model.asiento.numero = $(x[i]).attr('id');
                            this.model.asiento.numero_viaje = this.model.viajes[1];
                            Proxy.AsientoUpdate(this.model.asiento, function (result) {
                                this.model.asiento.codigo = result;
                            });
                        }
                    }
                }

                /*asientoAdd: function (numero) {
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
                 }*/
            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showViajes();
                createSeat();
                createSeat2();
                showTiquet();
                showPasajeros();
                showReserva();
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
                        controller.sumaTiempos(model.viajes[index].vuelo.hora, model.viajes[index].vuelo.duracion)
                    ]).draw(false);
                }
            }
            function showReserva() {
                var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                var t = $('#paginacion3').DataTable();
                $('#paginacion3').dataTable().fnClearTable();
                for (var index = 0; index < model.reservas.length; index++) {
                    t.row.add([

                        cant_pasajeros,
                        model.reservas.viaje1.vuelo.ciudad_origen,
                        model.reservas.viaje1.vuelo.ciudad_destino,
                        model.reservas.viaje1.fecha,
                        model.reservas.fecha_reserva,
                        model.reservas.precioTotal

                    ]).draw(false);
                }
            }
            function showPasajeros() {

                var tabla = document.getElementById("table-pasajeros");
                var label;
                var div;
                var div2;
                var span;
                var input;
                var i;
                var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");

                for (var j = 0; j < cant_pasajeros; j++) {

                    div = document.createElement("div");
                    div.setAttribute("class", "col-xs-12 col-sm-4 col-md-4");
                    label = document.createElement("label");
                    label.setAttribute("class", "control-label");
                    label.appendChild(document.createTextNode("Nombre"));
                    div.appendChild(label);
                    div2 = document.createElement("div");
                    div2.setAttribute("class", "input-group");
                    span = document.createElement("span");
                    span.setAttribute("class", "input-group-addon");
                    i = document.createElement("i");
                    i.setAttribute("class", "glyphicon glyphicon-user");
                    span.appendChild(i);
                    div2.appendChild(span);
                    input = document.createElement("input");
                    input.setAttribute("id", "nombre" + j);
                    input.setAttribute("placeholder", "Nombre");
                    input.setAttribute("class", "form-control");
                    input.setAttribute("type", "text");
                    div2.appendChild(input);
                    div.appendChild(div2);
                    tabla.appendChild(div);

                    div = document.createElement("div");
                    div.setAttribute("class", "col-xs-12 col-sm-4 col-md-4");
                    label = document.createElement("label");
                    label.setAttribute("class", "control-label");
                    label.appendChild(document.createTextNode("Apellidos"));
                    div.appendChild(label);
                    div2 = document.createElement("div");
                    div2.setAttribute("class", "input-group");
                    span = document.createElement("span");
                    span.setAttribute("class", "input-group-addon");
                    i = document.createElement("i");
                    i.setAttribute("class", "glyphicon glyphicon-user");
                    span.appendChild(i);
                    div2.appendChild(span);
                    input = document.createElement("input");
                    input.setAttribute("id", "apellidos" + j);
                    input.setAttribute("placeholder", "Apellidos");
                    input.setAttribute("class", "form-control");
                    input.setAttribute("type", "text");
                    div2.appendChild(input);
                    div.appendChild(div2);
                    tabla.appendChild(div);

                    div = document.createElement("div");
                    div.setAttribute("class", "col-xs-12 col-sm-4 col-md-4");
                    label = document.createElement("label");
                    label.setAttribute("class", "control-label");
                    label.appendChild(document.createTextNode("Numero Pasaporte"));
                    div.appendChild(label);
                    div2 = document.createElement("div");
                    div2.setAttribute("class", "input-group");
                    span = document.createElement("span");
                    span.setAttribute("class", "input-group-addon");
                    i = document.createElement("i");
                    i.setAttribute("class", "glyphicon glyphicon-user");
                    span.appendChild(i);
                    div2.appendChild(span);
                    input = document.createElement("input");
                    input.setAttribute("id", "numero_pasaporte" + j);
                    input.setAttribute("placeholder", "Numero Pasaporte");
                    input.setAttribute("class", "form-control");
                    input.setAttribute("type", "text");
                    div2.appendChild(input);
                    div.appendChild(div2);
                    tabla.appendChild(div);

                }
                tabla.appendChild(document.createElement("br"));

            }
            function showTiquet() {
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
                var filas = model.viajes[0].avion.cant_filas;
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
                        tmp.id = i + etiquetas[j] + model.viajes[0].numero_viaje;
                        tmp.disabled = false;
                        lbl = document.createElement("label");
                        lbl.htmlFor = i + etiquetas[j] + model.viajes[0].numero_viaje;
                        lbl.appendChild(document.createTextNode(i + etiquetas[j]));

                        li2.appendChild(tmp);
                        li2.appendChild(lbl);
                        ol.appendChild(li2);
                    }
                    li.appendChild(ol);
                    tabla.appendChild(li);
                }
            }

            function createSeat2() {

                if (model.viajes[1] == null) {
                    $("#asientosVuelta").hide();
                } else {
                    var tabla = document.getElementById("tablaAsientos2");
                    var etiquetas = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I",
                        "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S"];
                    var li, ol, li2, tmp, lbl;
                    var filas = model.viajes[1].avion.cant_filas;
                    var cant_asientos_por_fila = model.viajes[1].avion.cant_asientos_por_fila;

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
                            tmp.id = i + etiquetas[j] + model.viajes[1].numero_viaje;
                            tmp.disabled = false;
                            lbl = document.createElement("label");
                            lbl.htmlFor = i + etiquetas[j] + model.viajes[1].numero_viaje;
                            lbl.appendChild(document.createTextNode(i + etiquetas[j]));

                            li2.appendChild(tmp);
                            li2.appendChild(lbl);
                            ol.appendChild(li2);
                        }
                        li.appendChild(ol);
                        tabla.appendChild(li);
                    }
                }
            }

            function typeAvion(asientos) {
                if (asientos === 9)
                    document.querySelector(".cabin").style.padding = "0px 200px 0px 15px";
            }

            function reservarAsientos() {
                var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                var reserva;
                var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                var user = "andrey";
                // var cambio = new TipoCambio().getVenta(); No lo agarra
                for (var i = 0; i < x.length; i++) {
                    if (x[i].checked && !x[i].disabled) {
                        x[i].disabled = true;
                        // Se crea la reserva
                        model.reservacion.nombreUsuario = "p001";
                        model.reservacion.viaje1 = model.viajes[0];
                        model.reservacion.fecha_reserva = model.viajes[0].fecha;
                        model.reservacion.precioTotal = cant_pasajeros * 300;
                        // Aqui se hace add reserva
                        model.reservas.push(model.reservacion);
                    }
                }
            }

            function reservarAsientos2() {
                var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                for (var i = 0; i < x.length; i++) {
                    if (x[i].checked && !x[i].disabled) {
                        x[i].disabled = true;
                    }
                }
            }

            function showMessage() {
                window.alert("Reserva exitosa");
            }
            function validacionForm() {
                var tam = 0;
                var nombre0 = document.getElementById("nombre0");
                if (!(requiredField(nombre0.value))) {
                    tam++;
                    nombre0.style.borderColor = "red";
                } else {
                    nombre0.style.borderColor = "gray";
                }
                var apellidos0 = document.getElementById("apellidos0");
                if (!(requiredField(apellidos0.value))) {
                    tam++;
                    apellidos0.style.borderColor = "red";
                } else {
                    apellidos0.style.borderColor = "gray";
                }
                var numero_pasaporte0 = document.getElementById("numero_pasaporte0");
                if (!(requiredField(numero_pasaporte0.value))) {
                    tam++;
                    numero_pasaporte0.style.borderColor = "red";
                } else {
                    numero_pasaporte0.style.borderColor = "gray";
                }
                var nombre1 = document.getElementById("nombre1");
                if (!(requiredField(nombre1.value))) {
                    tam++;
                    nombre1.style.borderColor = "red";
                } else {
                    nombre1.style.borderColor = "gray";
                }
                var apellidos1 = document.getElementById("apellidos1");
                if (!(requiredField(apellidos1.value))) {
                    tam++;
                    apellidos1.style.borderColor = "red";
                } else {
                    apellidos1.style.borderColor = "gray";
                }
                var numero_pasaporte1 = document.getElementById("numero_pasaporte1");
                if (!(requiredField(numero_pasaporte1.value))) {
                    tam++;
                    numero_pasaporte1.style.borderColor = "red";
                } else {
                    numero_pasaporte1.style.borderColor = "gray";
                }
                var nombre2 = document.getElementById("nombre2");
                if (!(requiredField(nombre2.value))) {
                    tam++;
                    nombre2.style.borderColor = "red";
                } else {
                    nombre2.style.borderColor = "gray";
                }
                var apellidos2 = document.getElementById("apellidos2");
                if (!(requiredField(apellidos2.value))) {
                    tam++;
                    apellidos2.style.borderColor = "red";
                } else {
                    apellidos2.style.borderColor = "gray";
                }
                var numero_pasaporte2 = document.getElementById("numero_pasaporte2");
                if (!(requiredField(numero_pasaporte2.value))) {
                    tam++;
                    numero_pasaporte2.style.borderColor = "red";
                } else {
                    numero_pasaporte2.style.borderColor = "gray";
                }
                var nombre3 = document.getElementById("nombre3");
                if (!(requiredField(nombre3.value))) {
                    tam++;
                    nombre3.style.borderColor = "red";
                } else {
                    nombre3.style.borderColor = "gray";
                }
                var apellidos3 = document.getElementById("apellidos3");
                if (!(requiredField(apellidos3.value))) {
                    tam++;
                    apellidos3.style.borderColor = "red";
                } else {
                    apellidos3.style.borderColor = "gray";
                }
                var numero_pasaporte3 = document.getElementById("numero_pasaporte3");
                if (!(requiredField(numero_pasaporte3.value))) {
                    tam++;
                    numero_pasaporte3.style.borderColor = "red";
                } else {
                    numero_pasaporte3.style.borderColor = "gray";
                }
                var nombre4 = document.getElementById("nombre4");
                if (!(requiredField(nombre4.value))) {
                    tam++;
                    nombre4.style.borderColor = "red";
                } else {
                    nombre4.style.borderColor = "gray";
                }
                var apellidos4 = document.getElementById("apellidos4");
                if (!(requiredField(apellidos4.value))) {
                    tam++;
                    apellidos4.style.borderColor = "red";
                } else {
                    apellidos4.style.borderColor = "gray";
                }
                var numero_pasaporte4 = document.getElementById("numero_pasaporte4");
                if (!(requiredField(numero_pasaporte4.value))) {
                    tam++;
                    numero_pasaporte4.style.borderColor = "red";
                } else {
                    numero_pasaporte4.style.borderColor = "gray";
                }
                var nombre5 = document.getElementById("nombre5");
                if (!(requiredField(nombre5.value))) {
                    tam++;
                    nombre5.style.borderColor = "red";
                } else {
                    nombre5.style.borderColor = "gray";
                }
                var apellidos5 = document.getElementById("apellidos5");
                if (!(requiredField(apellidos5.value))) {
                    tam++;
                    apellidos5.style.borderColor = "red";
                } else {
                    apellidos5.style.borderColor = "gray";
                }
                var numero_pasaporte5 = document.getElementById("numero_pasaporte5");
                if (!(requiredField(numero_pasaporte5.value))) {
                    tam++;
                    numero_pasaporte5.style.borderColor = "red";
                } else {
                    numero_pasaporte5.style.borderColor = "gray";
                }
                var numTarjeta = document.getElementById("numTarjeta");
                if (!(requiredField(numTarjeta.value))) {
                    tam++;
                    numTarjeta.style.borderColor = "red";
                } else {
                    numTarjeta.style.borderColor = "gray";
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
    </body>
</html>
