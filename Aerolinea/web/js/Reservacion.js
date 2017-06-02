/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Reservacion(codigo,viaje1,viaje2,fecha_reserva){
	this.Reservacion(codigo,viaje1,viaje2,fecha_reserva);
}
Reservacion.prototype={
        codigo: 0,
        nombreUsuario:"",
        viaje1: 0,
        viaje2: 0,
        fecha_reserva:"",
        precioTotal: 0,
	Reservacion:function(codigo,nombreUsuario,viaje1,viaje2,fecha_reserva,precioTotal){
		this.codigo=codigo;
                this.nombreUsuario =nombreUsuario;
		this.viaje1=viaje1;
                this.viaje2=viaje2;
                this.fecha_reserva= fecha_reserva;
                this.precioTotal = precioTotal;
	},
        toString:function(){
	  return this.codigo;
	}
}
Reservacion.from = function(plain){
    reservacion = new Reservacion(plain.codigo,plain.nombreUsuario,plain.viaje1,plain.viaje2,plain.fecha_reserva,precioTotal);
    return reservacion;
};
Reservacion.to = function(reserva){
    return{
        _class : 'Reservacion',
        codigo: reserva.codigo,
        viaje1: reserva.viaje1,
        viaje2: reserva.viaje2,
        fecha_reserva: reserva.fecha_reserva,
        precioTotal: reserva.precioTotal,
        nombreUsuario: reserva.nombreUsuario
    };
};
