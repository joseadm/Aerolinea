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
              <li class="active"><a href="contacto.jsp">Contacto</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- Formulario Contacto -->
      <div class="container">

    <form class="well form-horizontal" action=" " method="post"  id="contact_form">
      <fieldset>

        <!-- Nombre Formulario -->
        <legend>Contactenos</legend>

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
  <div class="col-md-4">
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
