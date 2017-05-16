var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k,v) {
  if(v instanceof Object && v._class == 'Ciudad') {
      return new Ciudad(v.codigo,v.nombre,v.pais);
  }
  if(v instanceof Object && v._class == 'Avion') {
      return new Avion(v.codigo,v.annio,v.modelo,v.marca,v.cant_pasajeros,v.cant_filas,v.cant_asientos);
  }
  if(v instanceof Object && v._class == 'Vuelo') {
      return new Vuelo(v.codigo,v.ciudad_origen,v.ciudad_destino,v.avion,v.fecha,v.estado,v.precio);
  }
  if(v instanceof Object && v._class == 'Direccion') {
      return new Direccion(v.latitud,v.longitud);
  }
  if(v instanceof Object && v._class == 'Tiquete') {
      return new Tiquete(v.codigo,v.usuario,v.nombre_pasajero,v.apellidos_pasajero,v.pasaporte_pasajero);
  }
  if(v instanceof Object && v._class == 'Asiento') {
      return new Asiento(v.numero,v.estado,v.viaje);
  }
  if(v instanceof Object && v._class == 'Usuario') {
      return new Usuario(v.usuario,v.contrasena,v.nombre,v.apellidos,v.correo,v.fecha_nac,v.direccion,v.telf_trabajo,v.celular,v.tipo);
  }
  if(v instanceof Object && v._class == 'Viaje') {
      return new Viaje(v.numero,v.avion,v.vuelo);
  }
  if(v instanceof Object && v._class == 'Reservacion') {
      return new Reservacion(v.codigo,v.viaje,v.tiquete);
  }
  return v;
};

JsonUtils.replacer = function (k,v) {
  if(v instanceof Ciudad) {
      v._class="Ciudad";
    }  
  if (v instanceof Avion) {
       v._class="Avion";
    }
  if(v instanceof Vuelo) {
      v._class="Vuelo";
    }  
  if (v instanceof Direccion) {
       v._class="Direccion";
    }
  if (v instanceof Tiquete) {
       v._class="Tiquete";
    }
  if (v instanceof Asiento) {
       v._class="Asiento";
    }
  if (v instanceof Usuario) {
       v._class="Usuario";
   }
  if (v instanceof Viaje) {
       v._class="Viaje";
   }
  if (v instanceof Reservacion) {
       v._class="Reservacion";
   }
  return v;
};