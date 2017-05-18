function Vuelo(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado, precio,duracion){
	this.Vuelo(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado, precio,duracion);
}
Vuelo.prototype={
        codigo:"",
        ciudad_origen:"",
        ciudad_destino:"",
        avion:"",
        fecha:"",
        estado:"",
        precio:"",
        duracion:"",
	Vuelo:function(codigo,ciudad_origen,ciudad_destino,avion,fecha,estado,precio,duracion){
		this.codigo=codigo;
		this.ciudad_origen=ciudad_origen;
		this.ciudad_destino=ciudad_destino;
		this.avion=avion;
		this.fecha=fecha;
		this.estado=estado;
		this.precio=precio;
                this.duracion = duracion;
	},
        toString:function(){
	  return this.codigo;
	}
}
Vuelo.from= function(plain){
    vuelo = new Vuelo(plain.codigo,plain.ciudad_origen,plain.ciudad_destino,plain.avion,
                      plain.fecha, plain.estado,plain.precio,plain.duracion);
    return vuelo;
};

Vuelo.to = function(vuelo){
    return{
        _class : 'Vuelo',
        codigo: vuelo.codigo,
        ciudad_origen: vuelo.ciudad_origen,
        ciudad_destino: vuelo.ciudad_destino,
        avion: vuelo.avion,
        fecha: vuelo.fecha,
        estado: vuelo.estado,
        precio: vuelo.precio,
        duracion: vuelo.duracion
    };
};
