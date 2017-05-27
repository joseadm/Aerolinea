function Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen,dia,descuento){
	this.Vuelo(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen,dia,descuento);
}
Vuelo.prototype={
        numero_vuelo:0,
        ciudad_origen:"",
        ciudad_destino:"",
        estado:"",
        precio:"",
        duracion:0,
        hora:0,
        oferta:"",
        imagen:"",
        dia:"",
        descuento:0,
	Vuelo:function(numero_vuelo,ciudad_origen,ciudad_destino,estado,precio,duracion,hora,oferta,imagen,dia,descuento){
		this.numero_vuelo=numero_vuelo;
		this.ciudad_origen=ciudad_origen;
		this.ciudad_destino=ciudad_destino;
		this.estado=estado;
		this.precio=precio;
                this.duracion = duracion;
                this.hora =  hora;
                this.oferta = oferta;
                this.imagen = imagen;
                this.dia = dia;
                this.decuento= descuento;
	},
        toString:function(){
	  return this.numero_vuelo;
	}
}
Vuelo.from= function(plain){
    vuelo = new Vuelo(plain.numero_vuelo,plain.ciudad_origen,plain.ciudad_destino,plain.estado,
    plain.precio,plain.duracion,plain.hora,plain.oferta,plain.imagen,plain.dia,plain.descuento);
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
        imagen: vuelo.imagen,
        dia: vuelo.dia,
        descuento: vuelo.descuento
    };
};
