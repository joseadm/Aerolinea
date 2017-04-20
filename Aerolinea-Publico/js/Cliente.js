 // funcion Persona
function Cliente (usuario,contraseña,nombre, apellidos,correo,fechaNac,telefono,celular){ 
  this.Cliente(usuario,contraseña,nombre, apellidos,correo,fechaNac,telefono,celular);
}

// prototype asociado a la funcion Persona
// solo metodos
Cliente.prototype={ 
  Cliente: function(usuario,contraseña,nombre, apellidos,correo,fechaNac,telefono,celular){
    this.usuario=usuario;
    this.contraseña=contraseña;
    this.nombre=nombre;
    this.apellidos=apellidos;
    this.correo=correo;
    this.fechaNac=fechaNac;
    this.telefono=telefono;
    this.celular=celular;
    
  },
  completo: function (sep) { return this.usuario +  sep + this.nombre; }
}