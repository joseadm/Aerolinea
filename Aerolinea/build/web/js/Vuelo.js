function Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,fecha,estado, precio,duracion){
	this.Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,avion,fecha,estado, precio,duracion);
}
Vuelo.prototype={
        numero_vuelo:0,
        ciudad_origen:"",
        ciudad_destino:"",
        estado:"",
        precio:"",
        duracion:"",
        hora:"",
        oferta:"",
        imagen:"",
	Vuelo:function(numero_vuelo,ciudad_origen,ciudad_destino,avion,fecha,estado,precio,duracion){
		this.numero_vuelo=numero_vuelo;
		this.ciudad_origen=ciudad_origen;
		this.ciudad_destino=ciudad_destino;
		this.avion=avion;
		this.fecha=fecha;
		this.estado=estado;
		this.precio=precio;
                this.duracion = duracion;
	},
        toString:function(){
	  return this.numero_vuelo;
	}
}
Vuelo.from= function(plain){
    vuelo = new Vuelo(plain.numero_vuelo,plain.ciudad_origen,plain.ciudad_destino,plain.avion,
                      plain.fecha, plain.estado,plain.precio,plain.duracion);
    return vuelo;
};

Vuelo.to = function(vuelo){
    return{
        _class : 'Vuelo',
        codigo: vuelo.numero_vuelo,
        ciudad_origen: vuelo.ciudad_origen,
        ciudad_destino: vuelo.ciudad_destino,
        avion: vuelo.avion,
        fecha: vuelo.fecha,
        estado: vuelo.estado,
        precio: vuelo.precio,
        duracion: vuelo.duracion
    };
};
