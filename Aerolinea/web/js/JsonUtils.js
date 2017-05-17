var JsonUtils = JsonUtils || {};

//falta
JsonUtils.store=function (id, vuelos){
	sessionStorage.setItem(id, JSON.stringify(vuelos,replacer));
};

JsonUtils.retrieveVuelosFromUrl= function (url,callBack){
    var AJAX_req = new XMLHttpRequest();
    AJAX_req.open( "GET", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/json");
 
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,revive );
            callBack(object);
        }
    };
    AJAX_req.send();
};

//falta
JsonUtils.retrieve= function (id){
  var jsonVuelos = sessionStorage.getItem(id);
  if(jsonVuelos === null){
	return new Vuelo();
  }
  else{
	return JSON.parse(jsonVuelos,revive);
  }
};

JsonUtils.revive = function (k,v) {
  if(v instanceof Object && v._class == 'Ciudad') {
      return Ciudad.from(v);
  }
  if(v instanceof Object && v._class == 'Avion') {
      return Avion.from(v);
  }
  if(v instanceof Object && v._class == 'Vuelo') {
      return Vuelo.from(v);
  }
  if(v instanceof Object && v._class == 'Tiquete') {
      return Tiquete.from(v);
  }
  if(v instanceof Object && v._class == 'Asiento') {
      return Asiento.from(v);
  }
  if(v instanceof Object && v._class == 'Usuario') {
      return Usuario.from(v);
  }
  if(v instanceof Object && v._class == 'Viaje') {
      return Viaje.from(v);
  }
  if(v instanceof Object && v._class == 'Reservacion') {
      return Reservacion.from(v);
  }
  return v;
};

JsonUtils.replacer = function (k,v) {
  if(v instanceof Ciudad) {
      return Ciudad.to(v);
    }  
  if (v instanceof Avion) {
       return Avion.to(v);
    }
  if(v instanceof Vuelo) {
      return Vuelo.to(v);
    }  
  if (v instanceof Tiquete) {
       return Tiquete.to(v);
    }
  if (v instanceof Asiento) {
       return Asiento.to(v);
    }
  if (v instanceof Usuario) {
       return Usuario.to(v);
   }
  if (v instanceof Viaje) {
       return Viaje.to(v);
   }
  if (v instanceof Reservacion) {
       return Reservacion.to(v);
   }
  return v;
};