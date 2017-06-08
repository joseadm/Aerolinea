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
                                        <tr><th>Cantidad de Vuelos</th><th>Cantidad de Tiquetes</th><th>Fecha</th><th>Total</th></tr>
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
                        </form>
                    </div>
                </div></center>
                            <div class="row" align="center">
                                    <button onclick='controller.ReservaAdd();' class="btn btn-success btn-lg" id="aceptar">Aceptar</button>
                                    <button onclick="window.location.href='/Aerolinea/index.jsp'" class="btn btn-danger btn-lg" id="cancelar">Cancelar</button>
                            </div>
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
                    this.asientosIda = [];
                    this.asientosVuelta = [];
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
                    Proxy.getAviones(function (result) {
                        model.aviones = result;
                    });
                    this.initAsiento();
                    this.initReservaciones();
                    this.initTiquete();
                    Proxy.getAsientosIda(model.viajes[0], function (result) {
                        this.model.asientosIda = result;
                        view.showOcupado2();
                    });
                    if (this.model.viajes[1] != null) {
                        Proxy.getAsientosVuelta(model.viajes[1], function (result) {
                         this.model.asientosVuelta = result;
                         view.showOcupado();
                        });
                    }
                },
                initReservaciones: function () {
                    var model = this.model;
                    model.reservacion = new Reservacion();
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
                initAsiento: function () {
                    var model = this.model;
                    model.asiento = new Asiento();
                },
                initAvion: function () {
                    var model = this.model;
                    model.avion = new Avion();
                },
                initTiquete: function () {
                    var model = this.model;
                    model.tiquete = new Tiquete();
                },
                guid: function(){
                    function s4() {
                        return Math.floor((1 + Math.random()) * 0x10000)
                            .toString(16)
                            .substring(1);
                    }
                    return s4() + '-' + s4() + '-' +
                    s4();
                },
                ReservaAdd: function () {
                    var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                    var number = 0;
                        if(this.view.validacionForm()){
                        var loginUsuario = new Usuario("<%=user1.getUsuario()%>", "<%=user1.getContrasena()%>", "<%=user1.getNombre()%>",
                                "<%=user1.getApellidos()%>", "<%=user1.getCorreo()%>", new Date('<%=user1.getFecha_nac()%>'),
                                "<%=user1.getDireccion()%>",<%=user1.getTelefono()%>,<%=user1.getCelular()%>,<%=user1.getTipo()%>);
                        var codigoReserva = this.guid()+"-<%=user1.getUsuario()%>";
                        model.reservacion.codigo = codigoReserva;
                        model.reservacion.nombreUsuario = loginUsuario;
                        model.reservacion.viaje1 = model.viajes[0];
                        model.reservacion.precioTotal = cant_pasajeros * model.viajes[0].vuelo.precio;
                        model.reservacion.fecha_reserva = new Date();
                        if (this.model.viajes[1] == null) {
                            if(this.validateEmptySeats()){
                            this.AsientoUpdate1();
                            this.ReservacionIda(this.model.reservacion);
                            this.TiqueteAddIda(this.model.reservacion);
                            number++;
                        }else{
                            this.view.showMessageError();
                        }
                        }
                        if (this.model.viajes[1] != null) {
                            if(this.validateEmptySeats2()){
                            this.model.reservacion.viaje2 = model.viajes[1];
                            var subtotal1 = model.reservacion.precioTotal;
                            var subtotal2 = cant_pasajeros * model.viajes[1].vuelo.precio;
                            this.model.reservacion.precioTotal = subtotal1 + subtotal2;
                            this.AsientoUpdate2();
                            this.ReservacionVuelta(this.model.reservacion);
                            this.TiqueteAddIda(this.model.reservacion);
                            this.TiqueteAddVuelta(this.model.reservacion);
                            number++;
                        }else{
                            this.view.showMessageError();
                        }
                        }
                    }
                    if (number ==1 || number ==2) {
                        this.view.showMessage();
                        document.location = "/Aerolinea/index.jsp";
                    }
                },
                ReservacionIda: function(reserva){
                    Proxy.ReservacionAdd(reserva, function (result) {
                                model.reservacion = result;
                            });
                },
                ReservacionVuelta: function(reserva){
                    Proxy.ReservacionAdd2(reserva, function (result) {
                                model.reservacion = result;
                            });
                },
                TiqueteAddIda: function (reserva) {
                    var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                    var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                    var j = 0;
                     for (var i = 0; j < cant_pasajeros && i < x.length;i++){
                    if (x[i].checked && !x[i].disabled) {
                        var nombreP = document.getElementById("nombre" + j).value;
                        var apellidosP = document.getElementById("apellidos" + j).value;
                        var pasaporteP = document.getElementById("numero_pasaporte" + j).value;
                        model.tiquete.codigo = 0;
                        model.tiquete.nombre_pasajero = nombreP;
                        model.tiquete.apellidos_pasajero = apellidosP;
                        model.tiquete.pasaporte_pasajero = pasaporteP;
                        model.tiquete.codigo_reservacion = reserva;
                        model.asiento.estado = false;
                        model.asiento.numero = $(x[i]).attr('id');
                        model.asiento.numero_viaje = this.model.viajes[0];
                        model.tiquete.codigo_asiento = model.asiento;
                        j++;
                        Proxy.tiqueteAdd(this.model.tiquete,function (result) {
                                this.model.tiquete.codigo = result;
                        });
                    }
                }
                },
                TiqueteAddVuelta: function (reserva) {
                    var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                    var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                    var j = 0;
                     for (var i = 0; j < cant_pasajeros && i < x.length;i++){
                    if (x[i].checked && !x[i].disabled) {
                        var nombreP = document.getElementById("nombre" + j).value;
                        var apellidosP = document.getElementById("apellidos" + j).value;
                        var pasaporteP = document.getElementById("numero_pasaporte" + j).value;
                        model.tiquete.codigo = 0;
                        model.tiquete.nombre_pasajero = nombreP;
                        model.tiquete.apellidos_pasajero = apellidosP;
                        model.tiquete.pasaporte_pasajero = pasaporteP;
                        model.tiquete.codigo_reservacion = reserva;
                        model.asiento.codigo = 0;
                        model.asiento.estado = false;
                        model.asiento.numero = $(x[i]).attr('id');
                        model.asiento.numero_viaje = this.model.viajes[1];
                        model.tiquete.codigo_asiento = this.model.asiento;
                        j++;
                        Proxy.tiqueteAdd(this.model.tiquete,function (result) {
                                this.model.tiquete = result;
                        });
                    }
                }
                },
                AsientoUpdate1: function () {
                        var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                        for (var i = 0; i < x.length; i++) {
                            if (x[i].checked && !x[i].disabled) {
                                model.asiento.estado = false;
                                model.asiento.numero = $(x[i]).attr('id');
                                model.asiento.numero_viaje = this.model.viajes[0];
                                Proxy.AsientoUpdate(this.model.asiento, function (result) {
                                    model.asiento = result;
                                });
                            }
                            }
                },
                AsientoUpdate2: function () {
                    var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].checked && !x[i].disabled) {
                            model.asiento.codigo = 0;
                            model.asiento.estado = false;
                            model.asiento.numero = $(x[i]).attr('id');
                            model.asiento.numero_viaje = this.model.viajes[1];
                            Proxy.AsientoUpdate(model.asiento, function (result) {
                                model.asiento = result;
                            });
                        }
                    }
                },
                 validateEmptySeats: function(){
                     var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                     var count=0;
                      var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                      for (var i = 0; i < x.length; i++) {
                            if (x[i].checked && !x[i].disabled) {
                                count++;
                            }
                        }
                    if(count == 0 || count<cant_pasajeros){
                        return false;
                    }
                    return true;
                 },
                 validateEmptySeats2: function(){
                     var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                     var count=0;
                      var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                      for (var i = 0; i < x.length; i++) {
                            if (x[i].checked && !x[i].disabled) {
                                count++;
                            }
                        }
                    if(count == 0 || count<cant_pasajeros){
                        return false;
                    }
                    return true;
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
                createSeat();
                createSeat2();
                showTiquet();
                showPasajeros();
                showReserva();
            }
            function showOcupado() {
             var x = document.getElementById("tablaAsientos2").querySelectorAll("input");
                    for (var i = 0; i < x.length; i++) {
                        for (var index = 0; index < model.asientosVuelta.length; index++) {
                        if ($(x[i]).attr('id') == model.asientosVuelta[index].numero &&  model.asientosVuelta[index].estado == 0 ) {
                            x[i].disabled = true;
                            
                        }
                }
            }
            }
            function showOcupado2() {
            var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                    for (var i = 0; i < x.length; i++) {
                        for (var index = 0; index < model.asientosIda.length; index++) {
                        if ($(x[i]).attr('id') == model.asientosIda[index].numero &&  model.asientosIda[index].estado == 0 ) {
                            x[i].disabled = true;
                            
                        }
                }
            }
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
             model.reservacion.precioTotal = cant_pasajeros * model.viajes[0].vuelo.precio;
             model.reservacion.fecha_reserva = new Date();
            var number = 1;
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1;
            var yyyy = today.getFullYear();
            if(dd<10){
                dd='0'+dd;
            } 
            if(mm<10){
                mm='0'+mm;
            } 
            var today = dd+'/'+mm+'/'+yyyy;
            model.reservacion.fecha_reserva = today;
             if (this.model.viajes[1] != null) {
                            var subtotal1 = model.reservacion.precioTotal;
                            var subtotal2 = cant_pasajeros * model.viajes[1].vuelo.precio;
                            this.model.reservacion.precioTotal = subtotal1 + subtotal2;
                            number++;
                            cant_pasajeros = cant_pasajeros*2;
                            
            }
                    var t = $('#paginacion3').DataTable();
                    $('#paginacion3').dataTable().fnClearTable();
                    t.row.add([
                    number,
                    cant_pasajeros,
                    model.reservacion.fecha_reserva,
                    "$ "+model.reservacion.precioTotal
                    ]).draw(false);
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
                    input.onkeypress = justNumbers;
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
                        typeAvion2(cant_asientos_por_fila);
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
                if (asientos >= 9 && this.model.viajes[0] != null) {
                    document.getElementById("tablaAsientos").style.padding = "0px 200px 0px 15px";
                }
            }
            function typeAvion2(asientos) {
                if (this.model.viajes[1] != null && asientos >= 9) {
                    document.getElementById("tablaAsientos2").style.padding = "0px 200px 0px 15px";
                }
            }
            function showMessage() {
                window.alert("Reserva exitosa");
            }
            function showMessageError() {
                window.alert("Seleccione los asientos para continuar con la reserva");
            }
            function validacionForm() {
                var tam = 0;
                 var cant_pasajeros = sessionStorage.getItem("cantidadPasajeros");
                 var numTarjeta = document.getElementById("numTarjeta");
                for (var j = 0; j < cant_pasajeros; j++){
                        var nombreP = document.getElementById("nombre" + j);
                        var apellidosP = document.getElementById("apellidos" + j);
                        var pasaporteP = document.getElementById("numero_pasaporte" + j);
                        if (!(requiredField(nombreP.value))) {
                            tam++;
                            nombreP.style.borderColor = "red";
                        } else {
                            nombreP.style.borderColor = "gray";
                        }
                        if (!(requiredField(apellidosP.value))) {
                            tam++;
                            apellidosP.style.borderColor = "red";
                        } else {
                            apellidosP.style.borderColor = "gray";
                        }
                        if (!(requiredField(pasaporteP.value))) {
                            tam++;
                            pasaporteP.style.borderColor = "red";
                        } else {
                            pasaporteP.style.borderColor = "gray";
                        }
                        
                }                 
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
            function justNumbers (e) {
                    var key = window.Event ? e.which : e.keyCode;
                    if (key == 8 || key == 127 || key == 9)
                        return true;
                    return (key >= 48 && key <= 57);
            }
            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>