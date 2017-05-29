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
            <ol class="cabin fuselage">

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
            <br>
            <a href="pago.jsp" class="btn btn-sucess">Continuar</a>
        </div>--%>
        
        <hr>
        <br><br><br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratísimo, Inc.</p>
            </footer>
        </div>
    </body>
</html>

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
             });
             Proxy.getAviones(function (result) {
             model.aviones = result;
             });*/
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
         },
         initAvion: function () {
         var model = this.model;
         model.avion = new Asiento();
         },*/
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
        var lista = document.getElementById("cabin fuselage");
        //for (var i = 0; 6 < max; i++) {
        crearFilas(lista);
        //}
    }

    function crearFilas(lista) {
        var tr, td, li, ol, tmp, tmp2, txt;
        //tr = document.createElement("tr");
        //var filas = parseInt(document.getElementById("cant_asientos_por_fila"));
        //for (var i = 0; i < 12; i++) {
        td = document.createElement("td");
        td.setAttribute("class", "seats");
        li = document.createElement("li");
        li.setAttribute("class", "row");
        ol = document.createElement("ol");
        ol.setAttribute("class", "seats");
        tmp = document.createElement("li");
        tmp.setAttribute("class", "seat");
        tmp2 = document.createElement("input");
        tmp2.setAttribute("type", "checkbox");
        li.appendChild(ol);
        ol.appendChild(tmp);
        tmp.appendChild(tmp2);
        //tr.appendChild(li);
        /*tmp = document.createElement("label");
         tmp.setAttribute("class", "seat");
         tmp2 = document.createElement("input");
         tmp2.setAttribute("type", "checkbox");
         tmp2.setAttribute("id", ""); //ingresar a  la clase asiento y tomar su codigo/numero=id 
         txt = document.createTextNode("asiento"); //ingresar a  la clase asiento y tomar su codigo/numero
         tmp.appendChild(tmp2);
         tmp.appendChild(txt);
         tr.appenChild(tmp);*/
        //controller.asientoAdd();
        //}
        lista.appendChild(li);
    }

//si el numero de viaje del asiento coincide con el numero de viaje de 'viaje' cargar los asientos de ese viaje
    /*function crearAsientos() {
     //obtener las columnas de asientos del viaje
     var filas = parseInt(this.model.document.getElementById("cant_filas"));
     console.log(filas);
     var lista = document.getElementById("listaAsientos");
     for (var i = 1; i <= filas + 2; i++) { //9 o 6
     if (i % 4 === 0)
     crearPasillo(lista);
     else
     crearFilas(lista);
     }
     }
     
     function crearFilas(lista) {
     var tmp, tmp2, txt;
     //obtener las filas de asientos del viaje
     var filas = parseInt(document.getElementById("cant_asientos_por_fila"));
     for (var i = 0; i < 12; i++) {
     tmp = document.createElement("label");
     tmp.setAttribute("class", "btn btn-primary btn-xs");
     tmp2 = document.createElement("input");
     tmp2.setAttribute("type", "checkbox");
     tmp2.setAttribute("id", ""); //ingresar a  la clase asiento y tomar su codigo/numero=id 
     txt = document.createTextNode("asiento"); //ingresar a  la clase asiento y tomar su codigo/numero
     tmp.appendChild(tmp2);
     tmp.appendChild(txt);
     lista.appendChild(tmp);
     }
     lista.appendChild(document.createElement("br"));
     }
     
     function crearPasillo(lista) {
     lista.appendChild(document.createElement("hr"));
     lista.appendChild(document.createElement("hr"));
     }
     
     */

    function showMessage() {
        window.alert("Registro exitoso");
    }
    function clean() {
        document.getElementById("codigoAsiento").textContent = "";
        document.getElementById("numeroAsiento").textContent = "";
    }
    document.addEventListener("DOMContentLoaded", pageLoad);
</script>