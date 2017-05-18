/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Asiento(codigo,numero,estado,numero_viaje){
	this.Asiento(codigo,numero,estado,numero_viaje);
}
Asiento.prototype={
        codigo:0,
        numero:0,
        estado:false,
        numero_viaje:0,
	Asiento:function(codigo,numero,estado,numero_viaje){
		this.codigo= codigo;
                this.numero=numero;
		this.estado=estado;
		this.numero_viaje=numero_viaje;
	},
        toString:function(){
	  return this.numero;
	}
}
Asiento.from= function(plain){
    asiento = new Asiento(plain.codigo,plain.numero,plain.estado,plain.numero_viaje);
    return asiento;
};
Asiento.to= function(asiento){
    return {
        _class : 'Asiento',
        codigo: asiento.codigo,
        numero: asiento.numero,
        estado: asiento.estado,
        numero_viaje : asiento.numero_viaje
    };
};

