<%-- 
    Document   : tablero
    Created on : May 18, 2017, 12:27:26 AM
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
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="Grafica.js" charset="utf-8"></script>

    </head>
    <body>
        <%@ include file="HeaderAdmi.jspf" %>
        <!--Side Bar and content -->
        <div class="container">
            <fieldset>
                <legend align="center">Menu Administrativo</legend>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-8 col-md-10 main">
                            <h1 class="page-header">Tablero</h1>
                            <div class="panel-heading">Cinco rutas mas vendidas o reservadas</div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Cantidad facturado por mes</div>
                                        <div class="panel-body">
                                            <div id="ventaMensual" class="canvas-wrapper">
                                                <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Cantidad ingresos por año</div>
                                        <div class="panel-body">
                                            <div id="ventaAnual" class="canvas-wrapper">
                                                <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-heading">Listado de clientes</div>

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
    </body>
</html>
