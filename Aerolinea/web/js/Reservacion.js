/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Reservacion(codigo,viaje1,viaje2,tiquete,asiento,fecha_reserva){
	this.Reservacion(codigo,viaje1,viaje2,tiquete,asiento,fecha_reserva);
}
Reservacion.prototype={
        codigo: 0,
        viaje1: 0,
        viaje2: 0,
        tiquete: 0,
        asiento: 0,
        fecha_reserva:"",
	Reservacion:function(codigo,viaje1,viaje2,tiquete,asiento,fecha_reserva){
		this.codigo=codigo;
		this.viaje1=viaje1;
                this.viaje2=viaje2;
		this.tiquete=tiquete;
                this.asiento = asiento;
                this.fecha_reserva= fecha_reserva;
	},
        toString:function(){
	  return this.codigo;
	}
}
Reservacion.from = function(plain){
    reservacion = new Reservacion(plain.codigo,plain.viaje1,plain.viaje2,plain.tiquete,plain.asiento,
                                  plain.fecha_reserva);
    return reservacion;
};
Reservacion.to = function(reserva){
    return{
        _class : 'Reservacion',
        codigo: reserva.codigo,
        viaje1: reserva.viaje1,
        viaje2: reserva.viaje2,
        tiquete: reserva.tiquete,
        asiento: reserva.asiento,
        fecha_reserva: reserva.fecha_reserva
    };
};
