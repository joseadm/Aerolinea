 // funcion Persona
function Direccion (latitud, longitud){ 
  this.Direccion(latitud, longitud);
}

// prototype asociado a la funcion Persona
// solo metodos
Direccion.prototype={ 
  Direccion: function(latitud, longitud){
    this.latitud=latitud;
    this.longitud=longitud;
    
    
  }
}