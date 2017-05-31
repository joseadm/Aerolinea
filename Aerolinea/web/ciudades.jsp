<%-- 
    Document   : horas
    Created on : May 18, 2017, 12:26:26 AM
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
            <fieldset>
                <legend align="center">Menu Administrativo</legend>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-8 col-md-12 main">
                            <h1 class="page-header">Ciudades</h1>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Codigo</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="codigo" placeholder="Ingrese codigo de la ciudad" maxlength="45">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Pais</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="pais" placeholder="Ingrese pais de la ciudad" maxlength="45">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <label class="control-label">Nombre</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <input type="text" class ="form-control" id="nombre" placeholder="Ingrese nombre de la ciudad" maxlength="45"> <br>
                                        </div>
                                    </div>
                                </div><br>
                                <button onclick='controller.CiudadesAdd();' class="btn btn-success" id="agregarRuta">Agregar</button>
                                <br> 
                                <hr>
                            </div>                     
                            <!-- Tabla de ciudad............................................................... -->
                            <div class="container">
                                <div class="table-responsive">
                                    <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
                                        <thead>
                                            <tr><th>Codigo</th><th>Pais</th><th>Nombre</th><th>Eliminar</th></tr>
                                        </thead>
                                        <tbody id="listaCiudades">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--....................................................................................-->
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
                    this.ciudades = [];
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
                    Proxy.getCiudades(function (result) {
                        model.ciudades = result;
                        view.showCiudades();
                    });
                    this.initCiudades();
                },
                initCiudades: function () {
                    var model = this.model;
                    model.ciudad = new Ciudad();
                },
                CiudadesAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.ciudad.codigo = this.view.document.getElementById("codigo").value;
                    this.model.ciudad.pais = this.view.document.getElementById("pais").value;
                    this.model.ciudad.nombre = this.view.document.getElementById("nombre").value;
                    if (view.validacionForm()) {
                        Proxy.CiudadAdd(this.model.ciudad, function (result) {
                            model.ciudad.codigo = result;
                            document.location = "/Aerolinea/ciudades.jsp"
                            view.showMessage();
                        });
                    }
                },
                doDelete: function (codigo) {
                    Proxy.CiudadDelete(codigo, function (result) {
                        model.ciudad.codigo = result;
                        document.location = "/Aerolinea/ciudades.jsp"
                        view.showMessageDelete();
                    });
                },
                doUpdate: function (codigo) {
                    Proxy.ciudadSearch(codigo, function (result) {
                        model.ciudad = result;
                        view.showCiudad(model.ciudad);
                    });
                }

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showCiudades();
            }

            function showCiudades() {
                var t = $('#paginacion').DataTable();
                $('#paginacion').dataTable().fnClearTable();
                for (var index in model.ciudades) {
                    t.row.add([
                        model.ciudades[index].codigo,
                        model.ciudades[index].pais,
                        model.ciudades[index].nombre
                    ]).draw(false);
                }
            }

            $(document).ready(function () {
                var table = $('#paginacion').DataTable({
                    "columnDefs": [{
                            "targets": -1,
                            "data": null,
                            "defaultContent":
                                    '<img src="images/delete.png">'
                        }]
                });

            });

            function showMessage() {
                window.alert("Registro exitoso");
            }
            function showMessageDelete() {
                window.alert("Eliminacion exitosa");
            }
            function validacionForm() {
                var tam = 0;
                var codigo = document.getElementById("codigo");
                if (!(requiredField(codigo.value))) {
                    tam++;
                    codigo.style.borderColor = "red";
                } else {
                    codigo.style.borderColor = "gray";
                }
                var pais = document.getElementById("pais");
                if (!(requiredField(pais.value))) {
                    tam++;
                    pais.style.borderColor = "red";
                } else {
                    pais.style.borderColor = "gray";
                }
                var nombre = document.getElementById("nombre");
                if (!(requiredField(nombre.value))) {
                    tam++;
                    nombre.style.borderColor = "red";
                } else {
                    nombre.style.borderColor = "gray";
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
    </body>
</html>
