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
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
                        <tbody id="vuelosReserva">
                        </tbody>
                    </table>
                </div>
            </fieldset>
            <br><br><br><br>
            <div class="container"> 
                <fieldset>
                    <legend align="center">Pasajeros</legend>
                    <div class="row">
                        <!-- Nombre -->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Nombre</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  name="nombre" placeholder="Nombre" class="form-control"  type="text" maxlength="45">
                            </div>
                        </div>
                        <!-- Apellido-->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Apellidos</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="apellidos" placeholder="Apellidos" class="form-control" type="text" maxlength="45">
                            </div>
                        </div>
                        <!-- Pasaporte-->
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="control-label">Numero Pasaporte</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="pasaporte" placeholder="Pasaporte" class="form-control"  type="text" maxlength="45">
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </body>
</html>
