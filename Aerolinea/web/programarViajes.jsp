<%-- 
    Document   : programarViajes
    Created on : Jun 3, 2017, 12:22:54 AM
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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
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
                            <h1 class="page-header">Viajes</h1>
                            <label class="control-label">Seleccione la fecha inicio y fecha final para calendarizar los viajes</label><br><br>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <div class="form-group required"><label class="control-label">Vuelo</label></div>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="vuelo" placeholder="Ingrese el numero de vuelo " onKeyPress="return controller.justNumbers(event)" required>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <div class="form-group required"><label class="control-label">Avion</label></div>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                                            <input type="text" class ="form-control" id="avion" placeholder="Ingrese la placa del avion " maxlength="45" required>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <div class="form-group required"><label class="control-label">Rango de Fechas</label></div>
                                        <div class='input-group date' id='fechaViaje' name="fechaViaje">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' name="fecha" class="form-control" required/>
                                        </div>
                                    </div>
                                </div><br>
                            </div><br>
                        </div>
                        <button onclick="controller.ViajeAdd();" class="btn btn-success" id="agregarRuta">Agregar</button>
                        <hr> 
                    </div>
                    <!-- Tabla de viajes............................................................... -->
                    <div class="container">
                        <div class="table-responsive">
                            <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Numero Viaje</th>
                                        <th>Numero Vuelo</th>
                                        <th>Ciudad Origen</th>  
                                        <th>Ciudad Destino</th> 
                                        <th>Avion</th>
                                        <th>Fecha</th>
                                        <th>Hora de llegada</th>
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
            .addClass('table table-bordered table-hover');</script>

<script> // Model
    function Model() {
        this.Model();
    }

    Model.prototype = {
        Model: function () {
            this.viajes = [];
        }
    };</script>
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
            Proxy.getVuelos(function (result) {
                model.vuelos = result;
            });
            Proxy.getAviones(function (result) {
                model.aviones = result;
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
            if (model.vuelos !== null && model.aviones !== null) {
                var dateComplet1 = $("#fechaViaje").find("input").val().split("-");
                var daterange1 = dateComplet1[0];
                var daterange2 = dateComplet1[1];
                var date1 = daterange1.split(" ");
                var dateBegin1 = date1[0];
                var dayBegin1 = date1[1];
                var date2 = daterange2.split(" ");
                var dateBegin2 = date2[1];
                var dayBegin2 = date2[2];
                var placaA = this.view.document.getElementById("avion").value;
                var avion = this.model.aviones.find(function (a) {
                    return a.placa === placaA;
                });
                var numeroVuelo = (parseInt(this.view.document.getElementById("vuelo").value));
                var vuelo = this.model.vuelos.find(function (v1) {
                    return v1.numero_vuelo === numeroVuelo;
                });
                var count = 0;
                var FlightDay = vuelo.dia;
                var numberDay = this.numberDays(FlightDay);
                var startDate = new Date(dateBegin1);
                var endDate = new Date(dateBegin2);
                for (startDate; startDate <= endDate; startDate.setDate(startDate.getDate() + 1)) {
                    if (startDate.getDay() === numberDay) {
                        this.model.viaje.fecha = startDate;
                        this.model.viaje.avion = avion;
                        this.model.viaje.vuelo = vuelo;
                        this.model.viaje.numero_viaje = 0;
                        if (view.validacionForm()) {
                            //Proxy.ViajeAdd(this.model.viaje, function (result) {
                            //this.model.viaje.numero_viaje = result;
                            //document.location = "/Aerolinea/viajes.jsp";
                            //});
                        }
                        count++;
                    }
                }
                if (view.validacionForm()) {
                    view.showMessageCount(count);
                }
                console.log(count);
                //view.showMessageCount(count);
            }
        },
        LimpiaPantalla: function () {
            view.clean();
        },
        justNumbers: function (e) {
            var key = window.Event ? e.which : e.keyCode;
            return (key >= 48 && key <= 57);
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
        numberDays: function (day) {
            switch (day) {
                case "Sunday":
                    return 0;
                    break;
                case "Monday":
                    return 1;
                    break;
                case "Tueday":
                    return 2;
                    break;
                case "Wednesday":
                    return 3;
                    break;
                case "Thursday":
                    return 4;
                    break;
                case "Friday":
                    return 5;
                    break;
                case "Saturday":
                    return 6;
                    break;
            }
        }

    };</script>
<script> // View
    var model;
    var controller;
    function pageLoad(event) {
        model = new Model();
        controller = new Controller(model, window);
        showViajes();
    }

    function showViajes() {
        var t = $('#paginacion').DataTable();
        $('#paginacion').dataTable().fnClearTable();
        for (var index in model.viajes) {
            t.row.add([
                model.viajes[index].numero_viaje,
                model.viajes[index].vuelo.numero_vuelo,
                model.viajes[index].vuelo.ciudad_origen.nombre,
                model.viajes[index].vuelo.ciudad_destino.nombre,
                model.viajes[index].avion.placa,
                model.viajes[index].fecha,
                controller.sumaTiempos(model.viajes[index].vuelo.hora, model.viajes[index].vuelo.duracion)
            ]).draw(false);
        }
    }
    function showMessage() {
        window.alert("Registro exitoso");
    }
    function showMessageCount(number) {
        window.alert("Registro exitoso de " + number + " viajes");
    }
    function validacionForm() {
        var tam = 0;
        var vuelo = document.getElementById("vuelo");
        if (!(requiredField(vuelo.value))) {
            tam++;
            vuelo.style.borderColor = "red";
        } else {
            vuelo.style.borderColor = "gray";
        }
        var avion = document.getElementById("avion");
        if (!(requiredField(avion.value))) {
            tam++;
            avion.style.borderColor = "red";
        } else {
            avion.style.borderColor = "gray";
        }
        var fecha1 = $("#fechaViaje").find("input");
        if (fecha1.val() === "") {
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



    document.addEventListener("DOMContentLoaded", pageLoad);</script> 
<script type="text/javascript">
    $(function () {
        $('input[name="fecha"]').daterangepicker({
            locale: {
                format: 'YYYY/MM/DD dddd'
            },
            minDate: new Date()
        });
    });

</script> 
</body>
</html>
