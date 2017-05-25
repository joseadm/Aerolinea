<%-- 
    Document   : contacto
    Created on : May 18, 2017, 12:26:01 AM
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
        <!-- Formulario Contacto -->
        <div class="container">
            <form class="well form-horizontal" action=" " method="post"  id="contact_form">
                <fieldset>

                    <!-- Nombre Formulario -->
                    <legend align="center">Contactenos</legend>

                    <!-- Nombre -->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Nombre</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  name="nombre" placeholder="Nombre" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Apellido-->

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Apellidos</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="apellidos" placeholder="Apellidos" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Correo Electrónico</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input name="correo" placeholder="Correo Electronico" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Telefono-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Teléfono</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                <input name="telefono" placeholder="(562)8990-3452" class="form-control" type="text">
                            </div>
                        </div>
                    </div>

                    <!-- Direccion -->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Dirección</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input name="address" placeholder="Address" class="form-control" type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Provincia -->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Provincia</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select name="provincia" class="form-control selectpicker" >
                                    <option value=" " >Selecciona la provincia</option>
                                    <option>San Jose</option>
                                    <option>Heredia</option>
                                    <option>Alajuela</option>
                                    <option>Cartago</option>
                                    <option>Limon</option>
                                    <option>Puntarenas</option>
                                    <option>Guanacaste</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!--Canton-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Canton</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input name="canton" placeholder="Canton" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>


                    <!-- Mensaje -->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Mensaje</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <textarea class="form-control" name="comment" placeholder="Escriba el mensaje"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Success message -->
                    <div class="alert alert-success" role="alert" id="exito">Exito al enviar 
                        <i class="glyphicon glyphicon-thumbs-up"></i> Gracias por contactarnos, nos comunicaremos pronto</div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4" align="center">
                            <button type="submit" class="btn btn-warning" >Enviar <span class="glyphicon glyphicon-send"></span></button>
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </div><!-- /.container -->
    <br>
    <!-- Footer -->
    <div class="container">
        <footer class="footer">
            <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
    </div>
</body>
</html>
