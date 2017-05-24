<%-- 
    Document   : reserva
    Created on : May 20, 2017, 1:49:10 PM
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
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/Bootstrap-datepicker.js"></script>



    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container"> 
            <fieldset>
                <!-- Nombre Formulario -->
                <legend align="center">Itenerario</legend>
                <!-- Itenerario.................. -->
                <div class="container">
                    <table id="itenarario" class="display-table" cellspacing="0" width="100%">
                        <thead class="display-head">
                            <tr><th>Número de Vuelo</th><th>Avion</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Hora Salida</th><th>Hora Llegada</th><th>Duración</th></tr>
                        </thead>
                        <!-- Datos Quemados de prueba-->
                        <tbody id="vuelosReserva">
                            <tr>
                                <th>1</th>
                                <th>Boeing-737</th>
                                <th>San Jose</th>
                                <th>Miami</th>
                                <th>20/05/2017</th>
                                <th>2:00 PM</th>
                                <th>5:00 PM</th>
                                <th>3 horas</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <br><br><br><br>
            <div class="container"> 
                <fieldset>
                    <!-- Nombre Formulario -->
                    <legend align="center">Pasajeros</legend>
                    <div class="row">
                        <label class="col-xs-6 col-md-4 control-label">Nombre</label>
                        <label class="col-xs-6 col-md-4 control-label">Apellidos</label>
                        <label class="col-xs-6 col-md-4 control-label">Numero Pasaporte</label>
                    </div> 
                    <div class="row">
                        <!-- Nombre -->
                        <div class="form-group">
                            <div class="col-xs-6 col-md-4  inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input  name="nombre" placeholder="Nombre" class="form-control"  type="text">
                                </div>
                            </div>
                        </div>

                        <!-- Apellido-->

                        <div class="form-group">
                            <div class="col-xs-6 col-md-4  inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="apellidos" placeholder="Apellidos" class="form-control"  type="text">
                                </div>
                            </div>
                        </div>

                        <!-- Pasaporte-->
                        <div class="form-group">
                            <div class="col-xs-6 col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="pasaporte" placeholder="Pasaporte" class="form-control"  type="text">
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </body>
</html>
