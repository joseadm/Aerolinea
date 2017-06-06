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

Proxy.getPDF = function(callBack) {
   alert("Inside create PDF ajax");
    $.ajax({
        url : '/Aerolinea/GeneratePDF',
        type : 'get',
        dataType : 'json',
        contentType : 'application/json',

        success : function(map) {
            console.log(map);
        },

        error : function(map) {
            alert(map);
            alert("error occured!!!");
        },

    });
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

Proxy.AvionUpdate = function(avion, callBack){
    jsonAvion = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=avionUpdate";
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

Proxy.CiudadUpdate = function(ciudad, callBack){
    jsonCiudad = JSON.stringify(ciudad,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=ciudadUpdate";
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

Proxy.VueloAdd = function(vuelo,callBack){
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
    AJAX_req.send("vuelo="+jsonVuelo);   
};

Proxy.ReservacionAdd = function(reservacion,callBack){
    jsonReservacion = JSON.stringify(reservacion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=reservacionAdd1";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonReservacion=AJAX_req.responseText;
            var object = JSON.parse( jsonReservacion,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("reservacion="+jsonReservacion);   
};
Proxy.ReservacionAdd2 = function(reservacion,callBack){
    jsonReservacion = JSON.stringify(reservacion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=reservacionAdd2";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonReservacion=AJAX_req.responseText;
            var object = JSON.parse( jsonReservacion,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("reservacion2="+jsonReservacion);   
};

Proxy.VueloUpdate = function(vuelo,callBack){
    jsonVuelo = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=vueloUpdate";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonVuelo=AJAX_req.responseText;
            var object = JSON.parse( jsonVuelo,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("vuelo="+jsonVuelo);   
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
Proxy.getViaje = function(numero,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=getViaje',
      data: {
         format: 'json',
         numeroV: numero
      },
      dataType: 'text',
      type: 'GET',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};
Proxy.getCiudad = function(codigo,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=getCiudad',
      data: {
         format: 'json',
         codigoC: codigo
      },
      dataType: 'text',
      type: 'GET',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};
Proxy.getAvion = function(placa,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=getAvion',
      data: {
         format: 'json',
         placaA: placa
      },
      dataType: 'text',
      type: 'GET',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};
Proxy.getVuelo = function(numero,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=getVuelo',
      data: {
         format: 'json',
         numeroVu: numero
      },
      dataType: 'text',
      type: 'GET',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
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

Proxy.viajesSearchByDestiny = function(origen, destino,diaVuelta,fechaVuelta, callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=viajeListSearchByDestiny',
      data: {
         format: 'json',
         origen: origen,
         destino: destino,
         diaVuelta : diaVuelta,
         fechaVuelta : fechaVuelta
      },
      dataType: 'text',
      type: 'POST',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};
Proxy.reservacionesSearchByUser = function(usuario,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=selectReservacionByUser',
      data: {
         format: 'json',
         usuario: usuario
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
Proxy.getAsientos = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=asientosListAll";
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
Proxy.AsientoUpdate = function(asiento, callBack){
    jsonAsiento = JSON.stringify(asiento,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AirlineService?action=asientoUpdate";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonAsiento=AJAX_req.responseText;
            var object = JSON.parse( jsonAsiento,JsonUtils.revive );
            callBack(object);
            
        }
    };
    AJAX_req.send("asiento="+jsonAsiento);  
};


Proxy.CiudadDelete = function(codigo, callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=ciudadDelete";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send("codigo="+codigo);
};

Proxy.AvionDelete = function(placa, callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=avionDelete";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send("placa="+placa);
};

Proxy.ViajeDelete = function(numero_viaje,callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=viajeDelete";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send("numero_viaje="+numero_viaje);
};

Proxy.VueloDelete = function(numero_vuelo,callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/AirlineService?action=vueloDelete";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
        callBack(object);
        }  
    };
  AJAX_req.send("numero_vuelo="+numero_vuelo);
};


Proxy.usuarioExiste = function(nombreUsuario ,callBack) {
   $.ajax({
      url: '/Aerolinea/AirlineService?action=usuarioExiste',
      data: {
         format: 'json',
         nombreUsuario: nombreUsuario
      },
      dataType: 'text',
      type: 'POST',
      success: function(data) {
         var object = $.parseJSON(data,JsonUtils.revive);
         callBack(object);
      }
   });
};

Proxy.callPDF = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Aerolinea/GeneratePDF?action=generatePDF";
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





