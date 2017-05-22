/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Viaje(numero,fecha,avion,vuelo){
	this.Viaje(numero,fecha,avion,vuelo);
}
Viaje.prototype={
        numero: 0,
        fecha:"",
        avion:"",
        vuelo: 0,
	Viaje:function(numero,fecha,avion,vuelo){
		this.numero=numero;
                this.fecha=fecha;
		this.avion=avion;
		this.vuelo=vuelo;
	},
        toString:function(){
	  return this.numero;
	}
}
Viaje.from=function(plain){
    viaje = new Viaje(plain.numero,plain.fecha,plain.avion,plain.vuelo);
    return viaje;
};

Viaje.to= function(viaje){
    return{
         _class : 'Viaje',
         numero: viaje.numero,
         fecha: viaje.fecha,
         avion: viaje.avion,
         vuelo: viaje.vuelo
    };
};



