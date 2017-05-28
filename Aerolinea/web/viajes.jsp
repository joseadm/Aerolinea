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
                                        <label class="control-label">Vuelo</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="vuelo" placeholder="Ingrese el numero de vuelo " onKeyPress="return controller.justNumbers(event)">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Avion</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                                            <input type="text" class ="form-control" id="avion" placeholder="Ingrese la placa del avion " >
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Fecha</label>
                                        <div class='input-group date' id='fechaVuelo' name="fechaVuelo">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control"/>
                                        </div>
                                    </div>
                                </div><br>
                                <button onclick="controller.ViajeAdd();" class="btn btn-success" id="agregarRuta">Agregar</button>
                                <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Numero Viaje</th>
                                            <th>Numero Vuelo</th>
                                            <th>Ciudad Origen</th> <!--OPCIONAL -->
                                            <th>Ciudad Destino</th> 
                                            <th>Avion</th>
                                            <th>Fecha</th>
                                            <th>Hora de llegada</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaViajes">
                                        <!-- Contenido de la tabla -->
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
                    this.initViaje();
                },
                initViaje: function () {
                    var model = this.model;
                    model.viaje = new Viaje();
                },

                ViajeAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.viaje.fecha = $("#fechaVuelo").find("input").val();
                    this.model.viaje.avion = this.view.document.getElementById("avion").value;
                    this.model.viaje.vuelo = this.view.document.getElementById("vuelo").value;
                    Proxy.ViajeAdd(this.model.viaje, function (result) {
                        document.location = "/Aerolinea/viajes.jsp";
                        view.showMessage();
                    });

                },
                LimpiaPantalla: function () {
                    view.clean();
                },
                justNumbers: function (e) {
                    var key = window.Event ? e.which : e.keyCode
                    return (key >= 48 && key <= 57)
                },
                sumaTiempos: function(val1,tiempo){
 
                    t1=val1;
                    t2=tiempo;
 
                    var dot1 = t1.indexOf(":");
                    var dot2 = t2.indexOf(":");
                    var m1 = t1.substr(0, dot1);
                    var m2 = t2.substr(0, dot2);
                    var s1 = t1.substr(dot1 + 1);
                    var s2 = t2.substr(dot2 + 1);
                    var sRes = (Number(s1) + Number(s2));
                    var mRes;
                    var addMinute = false;
                    var horaFinal;
                    if (sRes >= 60){
                        addMinute = true;
                        sRes -= 60;
                    }
                    mRes = (Number(m1) + Number(m2) + (addMinute? 1: 0));
                    return horaFinal = this.formatString2(String(mRes),2) + ":" + this.formatString(String(sRes),2);
                },
 
                formatString2: function(string, len){           
 
                    if (string.length < len){
                        addchar=(len - string.length) ;
                        for (i = 0; i < addchar; i++){
                            string="0"+string ;
                        }
                    }
 
                    if (string.length > len){
                        string=substr(string,0,len);
                    }
 
                    return string;
                },
 
                formatString: function(string, len){
 
                    if (string.length < len){
                        addchar=(len - string.length) ;
                        for (i = 0; i < addchar; i++){
                            string=string +"0";
                        }
                    }
 
                    if (string.length > len) {
                        string=substr(string,0,len);
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

                var tr;
                var tabla;
                var td;

                for (var index in model.viajes) {
                    // ----------Agregar nueva fila----------------
                    tabla = document.getElementById("tablaViajes");
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].numero_viaje));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.numero_vuelo));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.ciudad_origen.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].vuelo.ciudad_destino.nombre));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].avion.placa));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.viajes[index].fecha));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(controller.sumaTiempos(model.viajes[index].vuelo.hora,model.viajes[index].vuelo.duracion)));
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
            function showMessage() {
                window.alert("Registro exitoso");
            }


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script> 
        <script type="text/javascript">
            $('#fechaVuelo').datetimepicker({
                minDate: moment(),
                format: 'DD/MM/YYYY',
                useCurrent: false
            });
        </script> 
    </body>
</html>
