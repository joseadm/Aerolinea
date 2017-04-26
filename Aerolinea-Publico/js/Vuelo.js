function Vuelo(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado, precio){
	this.Vuelo(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado, precio);
}
Vuelo.prototype={
	Vuelo:function(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado,precio){
		this.codigo=codigo;
		this.ciudad_origen=ciudad_origen;
		this.ciudad_destino=ciudad_destino;
		this.avion=avion;
		this.fecha=fecha;
		this.estado=estado;
		this.precio=precio;
	}
}
