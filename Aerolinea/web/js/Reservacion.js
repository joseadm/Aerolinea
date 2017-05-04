/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Reservacion(codigo,viaje,tiquete){
	this.Reservacion(codigo,viaje,tiquete);
}
Reservacion.prototype={
	Reservacion:function(codigo,viaje,tiquete){
		this.codigo=codigo;
		this.viaje=viaje;
		this.tiquete=tiquete;
	}
}

