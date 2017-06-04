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

        <div>
            <button id="btnReserva" onclick="reservarAsientos()" type="button" class="btn btn-success">Reservar</button>
            <%--<p id="verasientos"></p>--%>
        </div>

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
                    //this.asientos = [];
                    //this.viajes = [];
                    //this.aviones = [];
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
                }
                /*Proxy.getAsientos(function (result) {
                 model.asientos = result;
                 });
                 Proxy.getViajes(function (result) {
                 model.viajes = result;
                 });
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
                 initViaje: function () {
                 var model = this.model;
                 model.viaje = new Viaje();
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
                 }*/
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
                var li, ol, li2, tmp, lbl;

                for (var i = 1; i <= 22; i++) { //cant filas
                    li = document.createElement("li");
                    li.className = "row row--" + i;
                    ol = document.createElement("ol");
                    ol.className = "seats";
                    ol.type = "A";

                    for (var j = 1; j <= 9; j++) { //cant asientos por fila
                        typeAvion(9);
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

            function reservarAsientos() {
                var x = document.getElementById("tablaAsientos").querySelectorAll("input");
                for (var i = 0; i < x.length; i++) {
                    if (x[i].checked && !x[i].disabled) {
                        x[i].disabled = true;
                    }
                }
            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>

    </body>
</html>