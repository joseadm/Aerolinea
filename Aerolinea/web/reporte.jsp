<%-- 
    Document   : reporte
    Created on : Jun 8, 2017, 10:19:31 PM
    Author     : AndreyCh
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
        <legend align="center">Tiquetes Reservados</legend>
         <!-- Tabla de Tiquetes............................................................... -->
         <div class="col-sm-8 col-md-12 main">         
         <div class="container">
            <div class="table-responsive">
                <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr><th>Codigo de Reserva</th><th>Usuario</th><th>Pasaporte Pasajero</th><th>Nombre Pasajero</th><th>Numero Asiento</th><th>Fecha de Reserva</th></tr>
                    </thead>
                    <tbody id="listaTiquetes">
                    </tbody>
                </table>
            </div>
        </div>
        </div>
          <div class="row" align="center">
         <div class="col-xs-12 col-sm-4 col-md-10">
                    <label class="col-md-4  control-label" >PRECIO TOTAL</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                            <input id="precio" name="precio" class="form-control" type="text" disabled>
                        </div>
                    </div>
                    </div>
          </div><br><br>
        <div class="row" align="center">
                <button onclick="window.location.href = '/Aerolinea/index.jsp'" class="btn btn-danger btn-lg" id="cancelar">FINALIZAR</button>
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
                    this.tiquetes = [];
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
                    var codigoReserva = sessionStorage.getItem("codigoReserva");
                    var codigoReserva2 = "f8c7-cdd2-9828-p001";
                    Proxy.selectTiquetes(codigoReserva ,function (result) {
                        console.log(result);
                        model.tiquetes = result;
                        view.showTiquetes();
                    });
                    this.initTiquetes();
                },
                initTiquetes: function () {
                    var model = this.model;
                    model.tiquete = new Tiquete();
                }

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showTiquetes();
            }

            function showTiquetes() {
                var nombreUsuario = <%=new Gson().toJson(user1.getNombre())%>;
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                document.getElementById('precio').value = model.tiquetes[0].codigo_reservacion.precioTotal;
                for (var index in model.tiquetes) {
                    t.row.add([
                        model.tiquetes[index].codigo_reservacion.codigo,
                        nombreUsuario,
                        model.tiquetes[index].pasaporte_pasajero,
                        model.tiquetes[index].nombre_pasajero,
                        model.tiquetes[index].codigo_asiento.numero,
                        model.tiquetes[index].codigo_reservacion.fecha_reserva
                    ]).draw(false);
                }
            }
            $(document).ready(function () {
                var table = $('#paginacion').DataTable({
                    "paging": false,
                    "ordering": false,
                    "info": false,
                    "searching": false
                });
            });


            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
