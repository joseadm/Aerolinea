/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Asiento(numero,estado,numero_viaje){
	this.Asiento(numero,estado,numero_viaje);
}
Asiento.prototype={
        numero:"",
        estado:false,
        numero_viaje:0,
	Asiento:function(numero,estado,numero_viaje){
                this.numero=numero;
		this.estado=estado;
		this.numero_viaje=numero_viaje;
	},
        toString:function(){
	  return this.numero;
	}
}
Asiento.from= function(plain){
    asiento = new Asiento(plain.numero,plain.estado,plain.numero_viaje);
    return asiento;
};
Asiento.to= function(asiento){
    return {
        _class : 'Asiento',
        numero: asiento.numero,
        estado: asiento.estado,
        numero_viaje : asiento.numero_viaje
    };
};

