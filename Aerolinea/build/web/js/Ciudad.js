function Ciudad(codigo,nombre,pais){
	this.Ciudad(codigo,nombre,pais);
}
Ciudad.prototype={
        codigo:"",
        nombre:"",
        pais:"",
	Ciudad:function(codigo,nombre,pais){
		this.codigo=codigo;
		this.nombre=nombre;
		this.pais=pais;
	},
        info: function () {
		return this.nombre;
	}       
}

Ciudad.from= function(plain){
    ciudad = new Ciudad(plain.codigo,plain.nombre,plain.pais);
    return ciudad;
};

Ciudad.to= function(ciudad){
    return{
        codigo: ciudad.codigo,
        nombre: ciudad.nombre,
        pais: ciudad.pais
    };
};
