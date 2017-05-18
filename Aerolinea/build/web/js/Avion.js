function Avion(placa,modelo,marca,annio,cant_pasajeros,cant_filas,cant_asientos){
	this.Avion(placa,modelo,marca,annio,cant_pasajeros,cant_filas,cant_asientos);
}
Avion.prototype={
        placa:"",
        modelo:"",
        marca:"",
        annio:0,
        cant_pasajeros:0,
        cant_filas:0,
        cant_asientos:0,
	Avion:function(placa,modelo,marca,annio,cant_pasajeros,cant_filas,cant_asientos){
		this.placa=placa;
		this.modelo=modelo;
		this.marca=marca;
                this.annio=annio;
		this.cant_pasajeros=cant_pasajeros;
		this.cant_filas=cant_filas;
		this.cant_asientos=cant_asientos;
	},
        toString:function(){
	  return this.placa;
	}
}

Avion.from= function(plain){
    avion = new Avion(plain.placa,plain.modelo,plain.marca,plain.annio,plain.cant_pasajeros,
            plain.cant_filas,plain.cant_asientos);
    return avion;
};

Avion.to= function(avion){
    return {
        _class : 'Avion',
        placa: avion.placa,
        modelo: avion.modelo,
        marca: avion.marca,
        annio: avion.annio,
        cant_pasajeros: avion.cant_pasajeros,
        cant_filas: avion.cant_filas,
        cant_asientos: avion.cant_asientos
    };
};
