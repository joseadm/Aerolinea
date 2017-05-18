<%-- 
    Document   : registro
    Created on : May 18, 2017, 12:27:07 AM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <script type="text/javascript" src="js/ValidacionesRegistro.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key= AIzaSyCJPWUmBSUk3VbURUYaADFq2ois9Zcl--I &callback=initMap"></script>
    </head>
    <body>
      <!-- Titulo de la pagina -->
      <header>
        <div class="container"><h1>&nbsp;&nbsp;Baratísimo <span class="glyphicon glyphicon-plane avion"></span></h1></div>
      </header>
      <!-- Menu de Navegacion -->
      <nav class="navbar navbar-inverse">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
              <li><a href="index.jsp">Principal</a></li>
              <li><a href="informacion.jsp">Información</a></li>
              <li><a href="historia.jsp">Historia</a></li>
              <li ><a href="contacto.jsp">Contacto</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- ....................................Formulario Contacto............................................... -->
      <div class="container">

    <form action="javascript:doSubmit();" class="well form-horizontal"  method="POST"  id="formulario">
      <fieldset>

        <!-- Nombre Formulario -->
        <legend>Registro</legend>

        <!-- Usuario -->

<div class="form-group">
  <label class="col-md-4 control-label">Usuario</label>
  <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="usuario" name="usuario" placeholder="Usuario" class="form-control"  type="text">
    </div>
  </div>
</div>

    <!-- Password-->
<div class="form-group">
  <label class="col-md-4 control-label" >Contraseña</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="password" name="password" placeholder="********" class="form-control" type="password">
    </div>
  </div>
</div>
   <!-- Nombre -->

<div class="form-group">
  <label class="col-md-4 control-label">Nombre</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input id="nombre"  name="nombre" placeholder="Nombre" class="form-control"  type="text">
      </div>
    </div>
</div>

    <!-- Apellido-->

<div class="form-group">
  <label class="col-md-4 control-label" >Apellidos</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input id="apellidos" name="apellidos" placeholder="Apellidos" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Correo-->
  <div class="form-group">
  <label class="col-md-4 control-label">Correo Electrónico</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
        <input id="correo" name="correo" placeholder="Correo Electronico" class="form-control"  type="text">
    </div>
  </div>
</div>
<!-- Fecha de nacimiento-->

<div class="form-group">
  <label class="col-md-4 control-label">Fecha de Nacimeinto</label>
    <div class="col-md-4 inputGroupContainer">
      <div class='input-group date' id='fechaNacimiento' name="fechaNacimiento" placeholder="DD/MM/AAAA">
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
      </div>
  </div>
</div>
  <!-- Telefono-->

<div class="form-group">
  <label class="col-md-4 control-label">Teléfono</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
        <input id="telefono" name="telefono" placeholder="(562)8990-3452" class="form-control" type="text">
    </div>
  </div>
</div>
<!-- Celular-->
<div class="form-group">
  <label class="col-md-4 control-label">Celular</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
        <input id="celular" name="celular" placeholder="(562)8990-3452" class="form-control" type="text">
    </div>
  </div>
</div>

    <!-- Direccion-->

<div class="form-group">
  <label class="col-md-4 control-label" >Direccion</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
        <input id="direccion" name="direccion" placeholder="Direccion" class="form-control"  type="text" disabled>
    </div>
  </div>
</div>

<!--Mapa....................................................................... -->
<center>
<h3>Direccion</h3>
    <div id="map"action="javascript:initMap();"></div>
    </center>
    <br>
<!--............................................. -->
<!-- Success message -->
<div class="alert alert-success" role="alert" id="exito">Exito al enviar <i class="glyphicon glyphicon-thumbs-up"></i> Gracias por contactarnos, nos comunicaremos pronto</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button id="submit" type="submit" class="btn btn-primary" value="Registrar">Registrar<span class="glyphicon glyphicon-save"></span></button>
  </div>
</div>

</fieldset>
</form>
<!-- .......................................................................................................-->
</div>
    </div><!-- /.container -->

      <br>
      <!-- Footer -->
      <div class="container">
        <footer class="footer">
          <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
      </div>
          <script type="text/javascript">
        $(function () {
        $('#fechaNacimiento').datepicker({
            format: 'dd/MM/yyyy'
        });
        });
    </script> 
    </body>
</html>
