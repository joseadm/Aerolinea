function Tiquete(codigo,usuario,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero){
	this.Tiquete(codigo,usuario,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero);
}
Tiquete.prototype={
	Tiquete:function(codigo,usuario,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero){
		this.codigo=codigo;
		this.usuario=usuario;
		this.nombre_pasajero=nombre_pasajero;
		this.apellidos_pasajero=apellidos_pasajero;
		this.pasaporte_pasajero=pasaporte_pasajero;
	}
}
