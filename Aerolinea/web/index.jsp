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
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
 
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/IndexMVC.js"></script>
        <script type="text/javascript" src="js/Bootstrap-datepicker.js"></script>
           
    </head>
    <body>
      <%@ include file="Header.jspf" %>
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
