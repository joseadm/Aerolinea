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
       
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
     

    </head>
    <body>
        <%@ include file="HeaderAdmi.jspf" %>
        <!--Side Bar and content -->
        <div class="container">
                <legend align="center">Menu Administrativo</legend>
                <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Reportes</h1>
            
            
           <div class="row">
           <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Buscar pasajero que han viajado en un avion <br>
              <label for="placa">Placa del Avion</label>
              <input type="text" class="form-control" id="placa" placeholder="Digite la placa del avion">
              <button onclick='controller.buscarPasajeros();' type="button" class="btn btn-primary">Buscar</button></div><br>
                <div class="panel-body"><!--Body para tabla -->
                 <div class="col-sm-12 col-md-12 main">         
                    <div class="contasiner">
                       <div class="table-responsive">
                           <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                               <thead>
                                   <tr><th>Nombre Pasajero</th></tr>
                               </thead>
                               <tbody id="listaReservaciones">
                               </tbody>
                           </table>
                       </div>
                   </div>
                </div>
            </div>
            </div>
            </div>
            </div>
              
            <div class="panel-heading">Listado de clientes</div>

          </div>
       
      <hr>
      <br>
           
        
        <!-- Footer 
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratisimo, Inc.</p>
            </footer>
        </div> -->
        <!--....................................................-->
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
                    
                    this.initTiquetes();
                },
                initTiquetes: function () {
                    var model = this.model;
                    model.tiquete = new Tiquete();
                },
                 buscarPasajeros: function () {
                    var model = this.model;
                    var view = this.view;
                    var avion = this.view.document.getElementById("placa").value;
                    if (view.validacionPlaca()){
                    Proxy.selectClientsByPlane(avion ,function (result) {
                        console.log(result);
                        model.tiquetes = result;
                        if(result.length ===0){
                            view.showMessageNoSeEnctraronPasajeros()
                        }else{
                        view.showPasajeros();}
                    });}
                }

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showPasajeros();
            }
            function showMessageNoSeEnctraronPasajeros() {
                window.alert("No se encontraron Pasjaeros");
            }
            function showPasajeros() {
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in model.tiquetes) {
                    t.row.add([
                        model.tiquetes[index].nombre_pasajero
                    ]).draw(false);
                }
            }
            function validacionPlaca() {
                var tam = 0;
                var placa = document.getElementById("placa");
                if (!(requiredField(placa.value))) {
                    tam++;
                    placa.style.borderColor = "red";
                } else {
                    placa.style.borderColor = "gray";
                }
                if (tam > 0) {

                    return false;
                }
                return true;
            }
            function requiredField(valor) {
                if (valor === null || valor.length === 0 || /^\s+$/.test(valor)) {

                    return false;
                }
                return true;
            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
        <script type="text/javascript">
            // For demo to fit into DataTables site builder...
            $('#paginacion')
                    .removeClass('display')
                    .addClass('table table-bordered table-hover');
        </script>
        
    </body>
</html>
