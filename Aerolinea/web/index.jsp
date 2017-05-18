<%-- 
    Document   : index
    Created on : May 18, 2017, 12:12:25 AM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %>    
        <script type="text/javascript" src="js/IndexMVC.js"></script>
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
              <li class="active"><a href="index.jsp">Principal</a></li>
              <li><a href="informacion.jsp">Información</a></li>
              <li><a href="historia.jsp">Historia</a></li>
              <li><a href="contacto.jsp">Contacto</a></li>
            </ul>
            <form id ="formularioSesion"class="navbar-form navbar-right">
                  <input id= "correo" name="correo" placeholder="Correo Electronico" class="form-control" type="text"></input>
                  <input id= "password" name="password" placeholder="Contraseña" class="form-control" type="password"></input>
                  <button id="inicioSesion" type="button"  class="btn btn-success">Iniciar Sesion</button>
                  <a href="registro.jsp" id="crearCuenta" type="button"  class="btn btn-primary">Crear Cuenta</a>
            </form>
             <ul id="ulPrincipal" class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a id="aUsuario" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Usuario <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="usuario.jsp">Perfil</a></li>
                  <li><a href="tablero.jsp">Administracion</a></li>
                  <li><a id="cerrarSesion" href="#">Cerrar Sesion</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- Bar slider -->
      <section class="section-white">
  <div class="container">
    <div id="carousel-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators" id="circulos">
        <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" id="listaCarousel">
         <div class="item active">
          <img src="images/img1.jpg" alt="...">
          <div class="carousel-caption">
            <h2>Madrid Roma</h2>
            <p>Obten tu viaje por tan solo 200$</p>
            <button type="button" class="btn btn-primary">Ordenar</button>
          </div>
        </div>
      </div>
      <!-- Controles -->
      <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
  </div>
</section>
      <hr>
      <!-- Search Option -->
      <div class="container jumbo">
        <h3>Vuelo</h3>
      <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-4">
          <p>Origen</p>
          <div class="input-group">
            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
            <select id="origen" name="origen" class="form-control" ></select>
          </div> <br>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
          <p>Destino</p>
          <div class="input-group">
            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-list"></span></span>
            <select id="destino" name="destino" class="form-control" ></select>
          </div> <br>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
          <p>Tipo</p>
          <h4><input type="radio" id="vuelta" name="tipo" value="vuelta"> Ida y vuelta &nbsp;&nbsp;<input type="radio" id="ida" name="tipo" value="ida"> Ida</h4>
        </div>
      </div>
      <div class="row">     
    <div class='col-xs-12 col-sm-4 col-md-4'>
        <p>Fecha ida</p>
        <div class="form-group">
            <div class='input-group date' id='fecha_ida'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-xs-12 col-sm-4 col-md-4'>
        <p>Fecha regreso</p>
        <div class="form-group">
            <div class='input-group date' id='fecha_regreso'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
          <p>Número de Pasajeros</p>
          <div class="form-group">
            <select class="form-control" id="listPassengers" name="passengers">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
            </select>
          </div>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="col-xs-2"></div>
        <div class="col-xs-8">
          <input type="button" class="btn btn-group-justified btn-default" id="btn_search" value="Buscar Viaje">
        </div>
      </div>
      <br>
    </div>
      <hr>
      <!-- Tabla de vuelos............................................................... -->
        <div class="container">
            <table id="paginacion" class="display nowrap" cellspacing="0" width="100%">
            <thead>
            <tr><th>Codigo</th><th>Salida</th><th>Destino</th><th>Fecha</th><th>Precio</th></tr>
            </thead>
            <tbody id="listaBuscados">
            </tbody>
           </table>
        </div>
      <!--....................................................................................-->
      <br><br><br>
      <!-- Footer -->
      <div class="container">
        <footer class="footer">
          <p>&copy; 2017 Baratísimo, Inc.</p>
        </footer>
      </div>
      <script type="text/javascript">
        // For demo to fit into DataTables site builder...
        $('#paginacion')
          .removeClass( 'display' )
          .addClass('table table-striped table-bordered');
      </script>
    <script type="text/javascript">
        $(function () {
        var start = new Date();
        var end = new Date(new Date().setYear(start.getFullYear()+1));
        $('#fecha_ida').datepicker({
            startDate: start,
            endDate: end,
            format: 'dd/MM/yyyy'
        });
    
        $('#fecha_regreso').datepicker({
            startDate: start,
            endDate: end,
            format: 'dd/MM/yyyy',
            useCurrent: false
        });
        });
    </script> 
    </body>
</html>
