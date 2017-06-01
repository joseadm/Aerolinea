<%-- 
    Document   : check
    Created on : May 18, 2017, 12:25:49 AM
    Author     : AndreyCh
--%>

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
    </head>
    <body>
        <%@ include file="Header.jspf" %>

        <%--<div id="seatmap">
            <div id="plane">
                <table id="cabecera" class="rows">

                </table>

                <div id="cabin">        
                    <table id="tablaAsientos">
        <%--<tr id="top" class="wingRowTop">

                        </tr>
                        <tr>
                            <td title="1J" class="seatAvailable"></td>
                            <td title="2J" class="seatUnavailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4J" class="ExtraPay"></td>
                            <td title="5J" class="seatAvailable"></td>
                            <td title="6J" class="seatUnavailable"></td>
                            <td title="7J" class="seatAvailable"></td>
                            <td title="8J" class="noSeatStorage"></td>
                            <td title="9J" class="seatAvailable"></td>
                            <td title="10J" class="seatAvailable"></td>
                            <td title="11J" class="seatAvailable LargeSeat"></td>
                        </tr>
                        <tr>
                            <td title="1G" class="seatAvailable"></td>
                            <td title="2G" class="seatUnavailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4G" class="ExtraPay"></td>
                            <td title="5G" class="seatAvailable"></td>
                            <td title="6G" class="seatUnavailable"></td>
                            <td title="7G" class="seatAvailable"></td>
                            <td title="8G" class="noSeatStorage"></td>
                            <td title="9G" class="seatAvailable"></td>
                            <td title="10G" class="seatAvailable"></td>
                            <td title="11G" class="seatAvailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr>
                            <td class="noSeatGalley">1</td>
                            <td class="noSeatGalley">2</td>
                            <td class="noSeatGalley"></td>
                            <td class="noSeatGalley">4</td>
                            <td class="noSeatGalley">5</td>
                            <td class="noSeatGalley">6</td>
                            <td class="noSeatGalley">7</td>
                            <td class="noSeatGalley">8</td>
                            <td class="noSeatGalley">9</td>
                            <td class="noSeatGalley">10</td>
                            <td class="noSeatGalley">11</td>
                        </tr>
                        <tr>
                            <td title="1F" class="seatAvailable"></td>
                            <td title="2F" class="seatAvailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4F" class="ExtraPay"></td>
                            <td title="5F" class="seatUnavailable"></td>
                            <td title="6F" class="seatAvailable"></td>
                            <td title="7F" class="seatAvailable"></td>
                            <td title="8F" class="noSeatLavatory"></td>
                            <td title="9F" class="seatAvailable"></td>
                            <td title="10F" class="seatAvailable"></td>
                            <td title="11F" class="seatAvailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr>
                            <td title="1E" class="seatAvailable"></td>
                            <td title="2E" class="seatAvailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4E" class="ExtraPay"></td>
                            <td title="5E" class="seatUnavailable"></td>
                            <td title="6E" class="seatAvailable"></td>
                            <td title="7E" class="seatAvailable"></td>
                            <td title="8E" class="noSeatLavatory"></td>
                            <td title="9E" class="seatAvailable"></td>
                            <td title="10E" class="seatAvailable"></td>
                            <td title="11E" class="seatUnavailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr>
                            <td title="1D" class="seatAvailable"></td>
                            <td title="2D" class="seatAvailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4D" class="ExtraPay"></td>
                            <td title="5D" class="seatUnavailable"></td>
                            <td title="6D" class="seatAvailable"></td>
                            <td title="7D" class="seatAvailable"></td>
                            <td title="8D" class="noSeatLavatory"></td>
                            <td title="9D" class="seatAvailable"></td>
                            <td title="10D" class="seatAvailable"></td>
                            <td title="11D" class="seatAvailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr>
                            <td class="noSeatGalley">1</td>
                            <td class="noSeatGalley">2</td>
                            <td class="noSeatGalley"></td>
                            <td class="noSeatGalley">4</td>
                            <td class="noSeatGalley">5</td>
                            <td class="noSeatGalley">6</td>
                            <td class="noSeatGalley">7</td>
                            <td class="noSeatGalley">8</td>
                            <td class="noSeatGalley">9</td>
                            <td class="noSeatGalley">10</td>
                            <td class="noSeatGalley">11</td>
                        </tr>
                        <tr>
                            <td title="1C" class="seatAvailable"></td>
                            <td title="2C" class="seatAvailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4C" class="ExtraPay"></td>
                            <td title="5C" class="seatUnavailable"></td>
                            <td title="6C" class="seatAvailable"></td>
                            <td title="7C" class="seatAvailable"></td>
                            <td title="8C" class="noSeatLavatory"></td>
                            <td title="9C" class="seatAvailable"></td>
                            <td title="10C" class="seatAvailable"></td>
                            <td title="11C" class="seatAvailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr>
                            <td title="1A" class="seatAvailable"></td>
                            <td title="2A" class="seatAvailable"></td>
                            <td title="" class="noSeatGalley"></td>
                            <td title="4A" class="ExtraPay"></td>
                            <td title="5A" class="seatUnavailable"></td>
                            <td title="6A" class="seatAvailable"></td>
                            <td title="7A" class="seatAvailable"></td>
                            <td title="8A" class="noSeatLavatory"></td>
                            <td title="9A" class="seatAvailable"></td>
                            <td title="10A" class="seatAvailable"></td>
                            <td title="11A" class="seatUnavailable ExtraPay LargeSeat"></td>
                        </tr>
                        <tr id="bot" class="wingRowBottom">

                        </tr>
                    </table>            
                </div>

            </div>--%>

        <div class="plane">
            <div class="cockpit">
                <h1>Please select a seat</h1>
            </div>
            <div class="exit exit--front fuselage">

            </div>
            <ol id="tablaAsientos" class="cabin fuselage">

            </ol>
            <div class="exit exit--back fuselage">

            </div>
        </div>

        <%--<div class="container">
            <h1>Reservar asientos</h1>
            <hr>

            <table id="check" class="table">
                <thead id="listaAsientosCabecera" class="thead-default">
                     
                </thead>
                <tbody id="listaAsientos">
                    
                </tbody>
            </table>
        <div id="listaAsientos" class="btn-group" data-toggle="buttons">
            
        </div>

        </div>--%>

        <%--<br>
        <button class="btn btn-sucess"><a href="pago.jsp">Continuar</a></button>--%>

        <hr>
        <br><br><br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratísimo, Inc.</p>
            </footer>
        </div>


        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                    this.asientos = [];
                    this.viajes = [];
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
                    Proxy.getAsientos(function (result) {
                        model.asientos = result;
                    });
                    /*Proxy.getViajes(function (result) {
                     model.viajes = result;
                     });*/
                    Proxy.getAviones(function (result) {
                        model.aviones = result;
                    });
                    this.initAsiento();
                    //this.initViajes();
                },
                initAsiento: function () {
                    var model = this.model;
                    model.asiento = new Asiento();
                },
                /*initViaje: function () {
                 var model = this.model;
                 model.viaje = new Viaje();
                 },*/
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
                crearAsientos();
            }

            function crearAsientos() {
                var tabla = document.getElementById("tablaAsientos");
                var etiquetas = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I",
                                 "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S"];
                var li, ol, li2, tmp, lbl, cont=1;
                
                for (var i = 1; i <= 12; i++) {//cant filasfor (var j = 0; j < 6; i++) {
                li = document.createElement("li");
                li.className = "row row--" + cont;
                ol = document.createElement("ol");
                ol.className = "seats";
                ol.type = "A";
                
                for (var j = 0; j < 6; i++) {
                li2 = document.createElement("li");
                li2.className = "seat";
                tmp = document.createElement("input");
                tmp.type = "checkbox";
                tmp.id = cont + etiquetas[cont];
                tmp.disabled = false;
                lbl = document.createElement("label");
                lbl.htmlFor = cont + etiquetas[cont];
                lbl.appendChild(document.createTextNode(cont + etiquetas[cont]));

                li2.appendChild(tmp);
                li2.appendChild(lbl);
                ol.appendChild(li2);
                //li.appendChild(ol);
                //tabla.appendChild(li);
                //cont++;
                }
                //ol.appendChild(li2);
                li.appendChild(ol);
                tabla.appendChild(li);
                cont++;
                }
            }
/*
            function showAsientos() {
                showCabecera();
                var tabla = document.getElementById("tablaAsientos");
                //var etiquetas = ["", "", "A", "B", "C", "", "D", "E", "F", "G", "", "H", "I"];
                //var ala1 = document.getElementById("top");
                //var ala2 = document.getElementById("bot");
                //var cantFilas = model.avion.cant_filas;
                var tr, td;
                //tr = document.createElement("tr");
                //td = document.createElement("td");
                for (var i = 1; i <= 9 + 4; i++) {//6 o 9
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    if (i === 1) {
                        tr = document.createElement("tr");
                        tr.setAttribute("class", "wingRowTop");
                        tabla.appendChild(tr);
                        showAlas(tr);
                    } else
                    if (i === 9 + 4) {
                        tr = document.createElement("tr");
                        tr.setAttribute("class", "wingRowBottom");
                        tabla.appendChild(tr);
                        showAlas(tr);
                    } else
                    if (i === 5 || i === 10) {
                        var cont = parseInt(1);
                        for (var i = 0; i < 12; i++) {//cant asientos por filas
                            td = document.createElement("td");
                            td.setAttribute("class", "noSeatGalley");
                            td.appendChild(document.createTextNode(cont++));
                            tr.appendChild(td);
                            //tabla.appendChild(tr);
                        }
                        tabla.appendChild(tr);
                    } else {
                                var etiquetas = ["", "", "A", "B", "C", "", "D", "E", "F", "G", "", "H", "I"];
                                //var tmp;
                                for (var j = 1; j <= 12; j++) {//cant asientos por filas
                                    td = document.createElement("td");
                                    td.setAttribute("title", String.valueOf(j) + etiquetas[i]);
                                    td.setAttribute("class", "seatAvailable");
                                    tr.appendChild(td);
                                    //tabla.appendChild(tr);

                                }
                                tabla.appendChild(tr);
                            }
                }
            }

            function showAlas(ala) {
                var tr, td;
                tr = document.createElement("tr");
                for (var i = 0; i < 11; i++) {

                    td = document.createElement("td");
                    if (i > 3 && i < 10) {
                        td.setAttribute("class", "wingSeat");
                        td.appendChild(document.createTextNode(""));
                        tr.appendChild(td);
                        ala.appendChild(tr);
                    } else {
                        td.appendChild(document.createTextNode(""));
                        tr.appendChild(td);
                        ala.appendChild(tr);
                    }
                }
            }

            function showCabecera() {
                var tablaCabecera = document.getElementById("cabecera");
                //var cantFilas = model.avion.cant_filas;
                var etiquetas = ["", "A", "B", "C", "", "D", "E", "F", "", "G", "H", "I"];
                var tr, td;
                for (var i = 1; i <= 9 + 2; i++) {//6 o 9
                    tr = document.createElement("tr");
                    if (i % 4 === 0) {
                        td = document.createElement("td");
                        td.appendChild(document.createTextNode(""));
                        tr.appendChild(td);
                        tablaCabecera.appendChild(tr);
                    } else {
                        td = document.createElement("td");
                        td.appendChild(document.createTextNode(etiquetas[i]));
                        tr.appendChild(td);
                        tablaCabecera.appendChild(tr);
                    }
                }
            }

            function showMessage() {
                window.alert("Registro exitoso");
            }
            function clean() {
                document.getElementById("codigoAsiento").textContent = "";
                document.getElementById("numeroAsiento").textContent = "";
            }
            */
            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>

    </body>
</html>