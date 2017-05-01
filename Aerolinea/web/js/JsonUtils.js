var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k,v) {
  if(v instanceof Object && v._class == 'Ciudad') {
      return new Ciudad(v.codigo,v.nombre,v.pais);
  }  
  if(v instanceof Object && v._class == 'Vuelo') {
      return new Ciudad(v.numero,v.origen,v.destino,v.precio);
  }  
  return v;
};

JsonUtils.replacer = function (k,v) {
  if(v instanceof Ciudad) {
      v._class="Ciudad";
    }  
  if(v instanceof Vuelo) {
      v._class="Vuelo";
    }  
  return v;
};