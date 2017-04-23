var year = document.getElementById("ventaAnual");
var month = document.getElementById("ventaMensual");
Highcharts.chart(year, {

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

Highcharts.chart(month, {

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

});}
