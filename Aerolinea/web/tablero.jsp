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
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="js/Graficas.js" charset="utf-8"></script>

    </head>
    <body>
        <%@ include file="HeaderAdmi.jspf" %>
        <!--Side Bar and content -->
        <div class="container">
            <fieldset>
                <legend align="center">Menu Administrativo</legend>
                <div class="col-sm-8 col-md-10 main">
            <h1 class="page-header">Tablero</h1>
            <div class="panel-heading">Cinco rutas mas vendidas o reservadas</div>

            <div class="row">
              <div class="col-lg-12">
                <div class="panel panel-default">
                  <div class="panel-heading">Cantidad facturado por mes</div>
                  <div class="panel-body">
                    <div id="ventaMensual" class="canvas-wrapper">
                      <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-12">
                <div class="panel panel-default">
                  <div class="panel-heading">Cantidad ingresos por año</div>
                  <div class="panel-body">
                    <div id="ventaAnual" class="canvas-wrapper">
                      <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="panel-heading">Listado de clientes</div>

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
        <!--....................................................-->
        <script type="text/javascript">
      Highcharts.chart('ventaAnual', {
          
    title: {
        text: 'Ventas Anuales'
    },

    subtitle: {
        text: 'Baratico.inc'
    },

    xAxis: {
        categories: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
        'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],

        title: {
          text: 'Meses'
        }
      },
      yAxis: {

        title: {
          text: 'Dolares'
        }
      },

      tooltip: {
        enabled: true,
        formatter: function() {
          return '<b>'+ this.series.name +'</b><br/>'+
            this.x +': '+ this.y +' '+this.series.name;
        }
      },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        line: {
          dataLabels: {
            enabled: true
          },
          enableMouseTracking: true
        }
    },

    series: [{
        name: 'Ganancias',
        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175, 97031, 119931, 137133, 154175]
    }]

});

Highcharts.chart('ventaMensual', {

title: {
  text: 'Ventas Mensuales'
},

subtitle: {
  text: 'Baratico.inc'
},

xAxis: {
  categories: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],

  title: {
    text: 'Meses'
  }
},
yAxis: {

  title: {
    text: 'Dolares'
  }
},

tooltip: {
  enabled: true,
  formatter: function() {
    return '<b>'+ this.series.name +'</b><br/>'+
      this.x +': '+ this.y +' '+this.series.name;
  }
},
legend: {
  layout: 'vertical',
  align: 'right',
  verticalAlign: 'middle'
},

plotOptions: {
  line: {
    dataLabels: {
      enabled: true
    },
    enableMouseTracking: true
  }
},

series: [{
  name: 'Ganancias',
  data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175, 97031, 119931, 137133, 154175]
}]

});
      </script>
    </body>
</html>
