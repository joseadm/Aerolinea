var Proxy = Proxy || {};

Proxy.getCiudades = function(callBack) {
  var AJAX_req = new XMLHttpRequest();
  url="/Airline/AirlineService?action=ciudadListAll";
  AJAX_req.open("GET",url,true);
  AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
    if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
        callBack(object);
    }  
  };
  AJAX_req.send();
};

Proxy.getPromo = function(callBack) {
  var AJAX_req = new XMLHttpReques();
  url="/Airline/AirlineService?action=vueloListPromo";
  AJAX_req.open("GET",url, true);
  AJAX_req.setRequestHeader("Contenct-type", "application/x-www-form-urlencoded");
  AJAX_req.onreadystatechange = function() {
      if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
        callBack(object);
    }
  };
  AJAX_req.send();
};

Proxy.vuelosSearch = function(origen, destino, callBack) {
    var AJAX_req = new XMLHttpRequest();
    url="/Airline/AirlineService?action=vueloListSearch";
    AJAX_req.open("POST",url, true);
    AJAX_req.setRequestHeader("Contenct-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function() {
      if(AJAX_req.readyState === 4 && AJAX_req.status === 200 ) {
        var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
        callBack(object);
    }
    };
    AJAX_req.send("origen="+origen+"&destino="+destino);
};

