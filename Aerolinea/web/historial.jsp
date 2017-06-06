<%-- 
    Document   : historial
    Created on : 02/06/2017, 01:15:01 PM
    Author     : JoseManuel
--%>

<%@page import="com.google.gson.Gson"%>
<%@ page import="airline.model.Usuario" %>
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
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <% Usuario user1 = (Usuario) request.getSession().getAttribute("usuario");%>
        <!-- <%=user1.getUsuario()%> -->
         <!-- Tabla de reservaciones............................................................... -->
         <div class="col-sm-8 col-md-12 main">         
         <div class="container">
            <div class="table-responsive">
                <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr><th>Codigo</th><th>Nombre</th><th>viaje 1</th><th>viaje 2</th><th>Fecha de Reserva</th><th>Precio Total</th></tr>
                    </thead>
                    <tbody id="listaReservaciones">
                    </tbody>
                </table>
            </div>
        </div>
        </div>
         <!--....................................................................................-->
        
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
                    this.reservaciones = [];
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
                    var usuario = <%=new Gson().toJson(user1.getUsuario())%>;
                    Proxy.reservacionesSearchByUser(usuario ,function (result) {
                        console.log(result);
                        model.reservaciones = result;
                        view.showReservaciones();
                    });
                    this.initReservaciones();
                },
                initReservaciones: function () {
                    var model = this.model;
                    model.reservacion = new Reservacion();
                }

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showReservaciones();
            }

            function showReservaciones() {
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in model.reservaciones) {
                    t.row.add([
                        model.reservaciones[index].codigo,
                        model.reservaciones[index].nombreUsuario.usuario,
                        model.reservaciones[index].viaje1.numero_viaje,
                        model.reservaciones[index].viaje2.numero_viaje,
                        model.reservaciones[index].fecha_reserva,
                        model.reservaciones[index].precioTotal
                    ]).draw(false);
                }
            }



            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
