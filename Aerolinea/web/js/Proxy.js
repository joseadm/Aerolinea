/* global JsonUtils */

var Proxy = Proxy || {};

Proxy.getCiudades = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=ciudadListAll";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send();
};

Proxy.AvionAdd = function(avion, callBack){
    console.log("Insert into wey");
    jsonAvion = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=avionAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
           // var object = JSON.parse( jsonText,JsonUtils.revive );
            //callBack(object);
            
        }
    };
    AJAX_req.send("avion="+avion);   
};

Proxy.getPromo = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=vueloListPromo";
  AJAX_req.open("GET",url, true);
  AJAX_req.setRequestHeader("Contenct-type", "application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
      if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
    }
  };
  AJAX_req.send();
};

Proxy.getAviones = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=avionesListAll";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send();
};

Proxy.getVuelos = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=vuelosListAll";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send();
};

//Proxy.vuelosSearch = function(origen, destino, callBack) {
//    var AJAX_req = new XMLHttpRequest();
//    url="/Aerolinea/AirlineService?action=vueloListSearch";
//    AJAX_req.open("POST",url,true);
//    AJAX_req.setRequestHeader("Contenct-type", "application/x-www-form-urlencoded");
//    AJAX_req.send("origen="+origen+"&destino="+destino);
//    AJAX_req.onreadystatechange = function() {
//      if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
//        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
//        callBack(object);
//    }
//  };
//};

Proxy.vuelosSearch = function(origen, destino, callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=vueloListSearch',
      data: {
         format: 'json',
         origen: origen,
         destino: destino
      },
      dataType: 'text',
      type: 'POST',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};