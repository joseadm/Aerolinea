function Tiquete(numero,usuario,vuelo,asiento,fecha,precio){
	this.Tiquete(numero,usuario,vuelo,asiento,fecha,precio);
}
Tiquete.prototype={
	Tiquete:function(numero,usuario,vuelo,asiento,fecha,precio){
		this.numero=numero;
		this.usuario=usuario;
		this.vuelo=vuelo;
		this.asiento=asiento;
		this.fecha=fecha;
		this.precio=precio;
	}
}
