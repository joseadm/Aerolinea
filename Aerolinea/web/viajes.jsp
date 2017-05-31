<%-- 
    Document   : rutas
    Created on : May 18, 2017, 12:27:17 AM
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
                            <h1 class="page-header">Viajes</h1>
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
                                        <div class="form-group required"><label class="control-label">Fecha</label></div>
                                        <div class='input-group date' id='fechaViaje' name="fechaViaje">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" required/>
                                        </div>
                                    </div>
                                </div><br>
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
                    this.viajes = [];
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
                    var placaA = this.view.document.getElementById("avion").value;
                    var avion = this.model.aviones.find(function (a) {
                        return a.placa === placaA;
                    });
                    var numeroVuelo = (parseInt(this.view.document.getElementById("vuelo").value));
                    var vuelo = this.model.vuelos.find(function (v1) {
                        return v1.numero_vuelo === numeroVuelo;
                    });
                    this.model.viaje.fecha = fechaViaje = $("#fechaViaje").find("input").val();
                    this.model.viaje.avion = avion;
                    this.model.viaje.vuelo = vuelo;
                    this.model.viaje.numero_viaje = 0;
                    if (view.validacionForm()) {
                        Proxy.ViajeAdd(this.model.viaje, function (result) {
                            this.model.viaje.numero_viaje = result;
                            document.location = "/Aerolinea/viajes.jsp";
                            view.showMessage();
                        });
                    }
                },
                doDelete: function (numero_viaje) {
                    Proxy.ViajeDelete(numero_viaje, function (result) {
                        model.viaje.numero_viaje = result;
                        document.location = "/Aerolinea/viajes.jsp"
                        view.showMessageDelete();
                    });
                },
                doUpdate: function (numero_viaje) {
                },
                LimpiaPantalla: function () {
                    view.clean();
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode
                    return (key >= 48 && key <= 57)
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
                     alert( data[2] +" tiene codigo: "+ data[ 0 ] );
                 } );
                 
                 $('#paginacion tbody').on( 'click', '.btn-delete', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                     alert( data[2] +" tiene codigo: "+ data[ 0 ] );
                 } );

            });

            function showMessage() {
                window.alert("Registro exitoso");
            }
            function showMessageDelete() {
                window.alert("Eliminacion exitosa");
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
                var fecha = $("#fechaViaje").find("input");
                if (fecha.val() === "") {
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
            $('#fechaViaje').datetimepicker({
                minDate: moment(),
                format: 'YYYY-MM-DD',
                useCurrent: false
            });
        </script> 
    </body>
</html>
