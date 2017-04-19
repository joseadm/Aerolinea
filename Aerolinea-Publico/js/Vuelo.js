function Vuelo(codigo,aeropuerto_origen,aeropuerto_destino,avion,fecha,estado){
	this.Vuelo(codigo,aeropuerto_origen,aeropuerto_destino,avion,fecha,estado);
}
Vuelo.prototype={
	Vuelo:function(codigo,aeropuerto_origen,aeropuerto_destino,avion,fecha,estado){
		this.codigo=codigo;
		this.aeropuerto_origen=aeropuerto_origen;
		this.aeropuerto_destino=aeropuerto_destino;
		this.avion=avion;
		this.fecha=fecha;
		this.estado=estado;
	}
}
