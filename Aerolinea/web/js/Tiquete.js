function Tiquete(codigo,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero,codigo_reservacion,codigo_asiento){
	this.Tiquete(codigo,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero,codigo_reservacion,codigo_asiento);
}
Tiquete.prototype={
        codigo:0,
	nombre_pasajero:"",
	apellidos_pasajero:"",
	pasaporte_pasajero:0,
        codigo_reservacion: "",
        codigo_asiento: "",
	Tiquete:function(codigo,nombre_pasajero,apellidos_pasajero,pasaporte_pasajero,codigo_reservacion,codigo_asiento){
		this.codigo=codigo;
		this.nombre_pasajero=nombre_pasajero;
		this.apellidos_pasajero=apellidos_pasajero;
		this.pasaporte_pasajero=pasaporte_pasajero;
                this.codigo_reservacion = codigo_reservacion;
                this.codigo_asiento = codigo_asiento;
                
	},
        toString:function(){
	  return this.usuario;
	}
}
Tiquete.from = function(plain){
    tiquete = new Tiquete(plain.codigo,plain.nombre_pasajero,plain.apellidos_pasajero,
                          plain.pasaporte_pasajero,plain.codigo_reservacion,plain.codigo_asiento);
    return tiquete;
};

Tiquete.to = function(tiquete){
    return{
        _class : 'Tiquete',
        codigo: tiquete.codigo,
	nombre_pasajero: tiquete.nombre_pasajero,
	apellidos_pasajero: tiquete.apellidos_pasajero,
	pasaporte_pasajero: tiquete.pasaporte_pasajero,
        codigo_reservacion : tiquete.codigo_reservacion,
        codigo_asiento : tiquete.codigo_asiento
    };
};
