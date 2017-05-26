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

        <div class="container"> <%--<div class="jumbotron">--%>
            <h1>Reservar asientos</h1>
            <hr>

            <%--<table id="check" class="table">
                <thead id="listaAsientosCabecera" class="thead-default">
                     
                </thead>
                <tbody id="listaAsientos">
                    
                </tbody>
            </table> --%>
            <div id="listaAsientos" class="btn-group" data-toggle="buttons">

            </div>
            <br>
            <a href="pago.jsp" class="btn btn-sucess">Continuar</a>
        </div>

        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                    this.asientos = [];
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
                    this.initAsiento();
                },
                initAsiento: function () {
                    var model = this.model;
                    model.asiento = new Asiento();
                },
    //}
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
//si el numero de viaje del asiento coincide con el numero de viaje de 'viaje' cargar los asientos de ese viaje
            function crearAsientos() {
                //obtener las columnas de asientos del viaje
                var filas = parseInt(document.getElementById("cant_filas"));
                //console.log(filas);
                var lista = document.getElementById("listaAsientos");
                for (var i = 1; i <= 6 + 2; i++) { //9 o 6
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

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>

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