var arrayUsuarios;
function pageLoad(event) {
    addEventListeners();
    loadSpaces();
    loadList();
}
function loadSpaces() {
    let  usuario= document.getElementById("usuario");
    let password = document.getElementById("password");
    let apellidos = document.getElementById("apellidos");
    let nombre = document.getElementById("nombre");
    let correo = document.getElementById("correo");
    let fechaNacimiento = document.getElementById("fechaNacimiento");
    let telefono = document.getElementById("telefono");
    let celular = document.getElementById("celular");
	let direccion = document.getElementById("direccion");

   
}

function loadList() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
function addEventListeners() {
    let usuario= document.getElementById("usuario");
    let password = document.getElementById("password");
    let apellidos = document.getElementById("apellidos");
    let nombre = document.getElementById("nombre");
    let correo = document.getElementById("correo");
   let fechaNacimiento = document.getElementById("fechaNacimiento");
    let telefono = document.getElementById("telefono");
    let celular = document.getElementById("celular");

    usuario.addEventListener("focus",doFocus);
	usuario.addEventListener("blur",doBlur); 
	nombre.addEventListener("focus",doFocus);
	nombre.addEventListener("blur",doBlur); 
	apellidos.addEventListener("focus",doFocus);
	apellidos.addEventListener("blur",doBlur); 
	password.addEventListener("focus",doFocus);
	password.addEventListener("blur",doBlur); 
	correo.addEventListener("focus",doFocus);
	correo.addEventListener("blur",doBlur); 
	fechaNacimiento.addEventListener("focus",doFocus);
	fechaNacimiento.addEventListener("blur",doBlur);
    telefono.addEventListener("focus",doFocus);
	telefono.addEventListener("blur",doBlur); 
    celular.addEventListener("focus",doFocus);
	celular.addEventListener("blur",doBlur); 

    let formulario = document.getElementById("formulario");
    formulario.addEventListener("submit", doValidate);
}
function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}
/* validar espacios del form----------------------------------------------------------*/
function doValidate(event) {
    let formulario = event.target;
    let elements = formulario.elements;

    let usuario = elements.namedItem("usuario");
    let password = elements.namedItem("password");
    let apellidos = elements.namedItem("apellidos");
    let nombre = elements.namedItem("nombre");
    let correo = elements.namedItem("correo");
    let fechaNacimiento = elements.namedItem("fechaNacimiento");
    let telefono = elements.namedItem("telefono");
    let celular = elements.namedItem("celular");
	let direccion = document.getElementById("direccion");

    let error = false;
    error = isBlank(usuario);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(password);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(nombre);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(apellidos);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(correo);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(fechaNacimiento);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(telefono);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    error = isBlank(celular);
     if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
	/*error = isBlank(direccion);*/
    if (error) {
        event.preventDefault();
         window.alert("Llene todos los campos");
        return;
    }
    
    if(isRepeated(usuario)) {
        window.alert("USUARIO YA EXISTE!");
        event.preventDefault();
    }
    if(isRepeatedC(correo)) {
        window.alert("Este correo ya tiene cuenta");
        event.preventDefault();
    }
}
/* ----------------------------------------------------------------------------------------*/
function isBlank(element) {
    element.classList.remove("invalid");
    if (element.value.length == 0) {
        element.classList.add("invalid");
        return true;
    }
}

function isRepeated(usuario) {
    let index = arrayUsuarios.findIndex( (est) => est.usuario === usuario.value );
    return (index != -1)? true : false;
}
function isRepeatedC(correo) {
    let index = arrayUsuarios.findIndex( (est) => est.correo === correo.value );
    return (index != -1)? true : false;
}

function doSubmit() {
    let user= document.getElementById("usuario").value;
    let password = document.getElementById("password").value;
    let apellidos = document.getElementById("apellidos").value;
    let nombre = document.getElementById("nombre").value;
    let correo = document.getElementById("correo").value;
    let fechaNacimiento = document.getElementById("fechaNacimiento").value;
    let telefono = document.getElementById("telefono").value;
    let celular = document.getElementById("celular").value;

    let usuario = new Usuario(user,password,nombre,apellidos,correo,fechaNacimiento,0,telefono,celular);
    arrayUsuarios.push(usuario);

    Storage.store("Usuarios", arrayUsuarios);
    
    window.alert("Usuario agregado"+ correo.value + nombre.value);
    document.getElementById("formulario").reset();
}
function initMap() {
    var uluru = {lat: 10.0000000, lng: -84.0000000};

    var map = new google.maps.Map(document.getElementById("map"), {
        zoom: 4,
        center: uluru
    });

    var marker = new google.maps.Marker({position: uluru, map: map, title: 'Click to zoom'});
    marker.addListener('click', function () {
        map.setZoom(8);
        marker.setPosition(uluru);
        map.setCenter(marker.getPosition());
    });

    google.maps.event.addListener(map, 'click', function (e) {
        placeMarker(e.latLng, map,marker);
    });

}



function placeMarker(position, map,marker) {
       var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow;
        
        marker.setPosition(position);
        geocodeLatLng(geocoder,map,infowindow,position,marker);
        map.panTo(position);
}
   
function geocodeLatLng(geocoder, map, infowindow,position,marker) {

        geocoder.geocode({'location': position}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              infowindow.setContent(results[0].formatted_address);
              infowindow.open(map, marker);
              document.getElementById("direccion").value = results[0].formatted_address;
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
}
document.addEventListener("DOMContentLoaded", pageLoad)