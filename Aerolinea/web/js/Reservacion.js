/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Reservacion(codigo,viaje,tiquete,asiento){
	this.Reservacion(codigo,viaje,tiquete,asiento);
}
Reservacion.prototype={
        codigo:0,
        viaje: 0,
        tiquete: 0,
        asiento:0,
	Reservacion:function(codigo,viaje,tiquete,asiento){
		this.codigo=codigo;
		this.viaje=viaje;
		this.tiquete=tiquete;
                this.asiento = asiento;
	},
        toString:function(){
	  return this.codigo;
	}
}
Reservacion.from = function(plain){
    reservacion = new Reservacion(plain.codigo,plain.viaje,plain.tiquete,plain.asiento);
    return reservacion;
};
Reservacion.to = function(reserva){
    return{
        _class : 'Reservacion',
        codigo: reserva.codigo,
        viaje: reserva.viaje,
        tiquete: reserva.tiquete,
        asiento: reserva.asiento
    };
};
