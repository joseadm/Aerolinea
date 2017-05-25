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
    jsonAvion = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=avionAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonAvion=AJAX_req.responseText;
            var object = JSON.parse( jsonAvion,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("avion="+jsonAvion);   
};

Proxy.CiudadAdd = function(ciudad, callBack){
    jsonCiudad = JSON.stringify(ciudad,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=ciudadAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonCiudad=AJAX_req.responseText;
            var object = JSON.parse( jsonCiudad,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("ciudad="+jsonCiudad);   
};

Proxy.ViajeAdd = function(viaje, callBack){
    jsonViaje = JSON.stringify(viaje,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=viajeAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonViaje=AJAX_req.responseText;
            var object = JSON.parse( jsonViaje,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("viaje="+jsonViaje);   
};

Proxy.VueloAdd = function(vuelo, callBack){
    jsonVuelo = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=vueloAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonVuelo=AJAX_req.responseText;
            var object = JSON.parse( jsonVuelo,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("viaje="+jsonViaje);   
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


Proxy.getViajes = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=viajesListAll";
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

Proxy.viajesSearch = function(origen, destino,diaIda,fechaIda,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=viajeListSearch',
      data: {
         format: 'json',
         origen: origen,
         destino: destino,
         diaIda: diaIda,
         fechaIda : fechaIda
      },
      dataType: 'text',
      type: 'POST',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};

Proxy.viajesSearchByDestiny = function(origen, destino, callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=viajeListSearchByDestiny',
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

Proxy.UsuarioAdd = function(usuario, callBack){
    jsonUsuario = JSON.stringify(usuario,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=usuarioAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonUsuario=AJAX_req.responseText;
            var object = JSON.parse( jsonUsuario,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("usuario="+jsonUsuario);   
};
Proxy.getUsuarios = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=usuariosListAll";
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

Proxy.userLogin = function(user,callBack){
    jsonText = JSON.stringify(user,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=userLogin";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,JsonUtils.revive );
            callBack(object);
        }
    };
    AJAX_req.send("usuario="+jsonText);   
};

