/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Asiento(numero,estado,viaje){
	this.Asiento(numero,estado,viaje);
}
Asiento.prototype={
	Asiento:function(numero,estado,viaje){
		this.numero=numero;
		this.estado=estado;
		this.viaje=viaje;
	}
}

