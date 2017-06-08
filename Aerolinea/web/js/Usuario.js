
function Usuario(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telefono,celular,tipo){ 
  this.Usuario(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telefono,celular,tipo);
}

Usuario.prototype={ 
        usuario:"",
        contrasena:"",
        nombre:"",
	apellidos:"",
	correo:"",
	fecha_nac:"",
	direccion:"",
	telefono:0,
	celular:0,
        tipo:0,
  Usuario: function(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telefono,celular,tipo){
        this.usuario=usuario;
	this.contrasena=contrasena;
        this.nombre=nombre;
	this.apellidos=apellidos;
	this.correo=correo;
	this.fecha_nac=fecha_nac;
	this.direccion=direccion;
	this.telefono=telefono;
	this.celular=celular;
        this.tipo=tipo;
  },
        toString:function(){
	  return this.usuario;
	}
}
Usuario.from = function(plain){
    user = new Usuario(plain.usuario,plain.contrasena,plain.nombre,plain.apellidos,plain.correo,
                          plain.fecha_nac,plain.direccion,plain.telefono,plain.celular,plain.tipo);
    return user;
};

Usuario.to=function(user){
    return{
        _class : 'Usuario',
        usuario: user.usuario,
        contrasena: user.contrasena,
        nombre: user.nombre,
	apellidos: user.apellidos,
	correo: user.correo,
	fecha_nac: user.fecha_nac,
	direccion: user.direccion,
	telefono: user.telefono,
	celular: user.celular,
        tipo: user.tipo
    };
};