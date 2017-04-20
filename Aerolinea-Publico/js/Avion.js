function Avion(codigo,annio,modelo,marca,cant_pasajeros,cant_filas,cant_asientos){
	this.Avion(codigo,annio,modelo,marca,cant_pasajeros,cant_filas,cant_asientos);
}
Avion.prototype={
	Avion:function(codigo,annio,modelo,marca,cant_pasajeros,cant_filas,cant_asientos){
		this.codigo=codigo;
		this.annio=annio;
		this.modelo=modelo;
		this.marca=marca;
		this.cant_pasajeros=cant_pasajeros;
		this.cant_filas=cant_filas;
		this.cant_asientos=cant_asientos;
	}
}
