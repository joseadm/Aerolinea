

﻿Storage = {
store : function (id, object){
			return localStorage.setItem(id, JSON.stringify(object,this.replacer));
		},

retrieve: function (id){
			  var jsonObject = localStorage.getItem(id);
			  if(jsonObject === null){
				return null;
			  }
			  else{
				 return JSON.parse(jsonObject,this.revive);
			  }
		},

revive: function (k,v) {
		if(v instanceof Object && v._class == 'Ciudad') {
			return new Ciudad(v.codigo,v.nombre,v.pais);
		}
		if (v instanceof Object && v._class == 'Aeropuerto') {
			return new Aeropuerto(v.codigo,v.nombre,v.ciudad);
		}
		if(v instanceof Object && v._class == 'Avion') {
			return new Avion(v.codigo,v.annio,v.modelo,v.marca,v.cant_pasajeros,v.cant_filas,v.cant_asientos);
		}
		if(v instanceof Object && v._class == 'Direccion') {
			return new Direccion(v.latitud,v.longitud);
		}
		if(v instanceof Object && v._class == 'Tiquete') {
			return new Tiquete(v.numero,v.usuario,v.vuelo,v.asiento,v.fecha,v.precio);
		}
		if(v instanceof Object && v._class == 'Usuario') {
			return new Usuario(v.usuario,v.contrasena,v.nombre,v.apellidos,v.correo,v.fecha_nac,v.direccion,v.telf_trabajo,v.celular);
		}
		if(v instanceof Object && v._class == 'Vuelo') {
			return new Vuelo(v.codigo,v.aeropuerto_origen,v.aeropuerto_destino,v.avion,v.fecha,v.estado);
		}
		return v;
	},

replacer: function (k,v) {
		if (v instanceof Ciudad) {
			v._class="Ciudad";
		}
		if (v instanceof Aeropuerto) {
			v._class="Aeropuerto";
		}
		if (v instanceof Avion) {
			v._class="Avion";
		}
		if (v instanceof Direccion) {
			v._class="Direccion";
		}
		if (v instanceof Tiquete) {
			v._class="Tiquete";
		}
		if (v instanceof Usuario) {
			v._class="Usuario";
		}
		if (v instanceof Vuelo) {
			v._class="Vuelo";
		}
		return v;
	}
};
