/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

Storage = {
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
		if(v instanceof Object && v._class == 'Avion') {
			return new Avion(v.placa,v.modelo,v.marca,v.annio,v.cant_pasajeros,v.cant_filas,v.cant_asientos_por_fila);
		}
		if(v instanceof Object && v._class == 'Asiento') {
			return new Asiento(v.codigo,v.numero,v.estado,v.numero_viaje);
		}
		if(v instanceof Object && v._class == 'Tiquete') {
			return new Tiquete(v.codigo,v.usuario,v.nombre_pasajero,v.apellidos_pasajero,v.pasaporte_pasajero);
		}
		if(v instanceof Object && v._class == 'Usuario') {
			return new Usuario(v.usuario,v.contrasena,v.nombre,v.apellidos,v.correo,v.fecha_nac,v.direccion,v.telefono,v.celular,v.tipo);
		}
		if(v instanceof Object && v._class == 'Vuelo') {
			return new Vuelo(v.numero_vuelo,v.ciudad_origen,v.ciudad_destino,v.estado,v.precio,v.duracion,v.hora,v.oferta,v.imagen,v.dia);
		}
                if(v instanceof Object && v._class == 'Viaje') {
			return new Viaje(v.numero_viaje,v.fecha,v.avion,v.vuelo);
		}
                if(v instanceof Object && v._class == 'Reservacion') {
			return new Reservacion(v.codigo,v.viaje1,v.viaje2,v.tiquete,v.asiento,v.fecha_reserva);
		}
		return v;
	},

replacer: function (k,v) {
		if (v instanceof Ciudad) {
			v._class="Ciudad";
		}
		if (v instanceof Avion) {
			v._class="Avion";
		}
		if (v instanceof Viaje) {
			v._class="Viaje";
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
                if (v instanceof Reservacion) {
			v._class="Reservacion";
		}
                if (v instanceof Asiento) {
			v._class="Asiento";
		}
		return v;
	}
};
