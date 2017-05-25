<%-- 
    Document   : pago
    Created on : May 18, 2017, 12:26:56 AM
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
        <script type="text/javascript" src="js/ValidacionPago.js"></script>
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <!-- Table -->
        <div class="container">
            <table class="table">
                <thead class="thead-default">
                    <tr>
                        <th>Informacion del vuelo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <!-- Cargar la info del vuelo -->
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="container">
            <div id="pago" class="jumbotron">
                <div class="row">
                    <div id="imagenTarjeta" class="container">
                        <img src="images/tarjetas.png" class="img-responsive img-center" alt="forma de pago">
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
        </div>

        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
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

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
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
