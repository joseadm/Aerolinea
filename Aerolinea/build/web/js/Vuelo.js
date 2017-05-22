function Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen){
	this.Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen);
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
	Vuelo:function(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen){
		this.numero_vuelo=numero_vuelo;
		this.ciudad_origen=ciudad_origen;
		this.ciudad_destino=ciudad_destino;
		this.estado=estado;
		this.precio=precio;
                this.duracion = duracion;
                this.hora =  hora;
                this.oferta = oferta;
                this.imagen = imagen;
	},
        toString:function(){
	  return this.numero_vuelo;
	}
}
Vuelo.from= function(plain){
    vuelo = new Vuelo(plain.numero_vuelo,plain.ciudad_origen,plain.ciudad_destino,plain.estado,
    plain.precio,plain.duracion,plain.hora,plain.oferta,plain.imagen);
    return vuelo;
};

Vuelo.to = function(vuelo){
    return{
        _class : 'Vuelo',
        codigo: vuelo.numero_vuelo,
        ciudad_origen: vuelo.ciudad_origen,
        ciudad_destino: vuelo.ciudad_destino,
        estado: vuelo.estado,
        precio: vuelo.precio,
        duracion: vuelo.duracion,
        hora: vuelo.hora,
        oferta: vuelo.oferta,
        imagen: vuelo.imagen
    };
};
