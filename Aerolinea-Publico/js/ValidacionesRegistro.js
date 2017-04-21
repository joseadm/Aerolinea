var arrayUsuarios;
function pageLoad(event) {
    document.getElementById("formulario").reset();
    addEventListeners();
    loadSpaces();
    loadList();
}
function loadSpaces() {
    var  usuario= document.getElementById("usuario");
    var password = document.getElementById("password");
    var apellidos = document.getElementById("apellidos");
    var nombre = document.getElementById("nombre");
    var correo = document.getElementById("correo");
    var fechaNacimiento = document.getElementById("fechaNacimiento");
    var telefono = document.getElementById("telefono");
    var celular = document.getElementById("celular");
	var direccion = document.getElementById("direccion");

   
}
function loadList() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
function addEventListeners() {
    var usuario= document.getElementById("usuario");
    var password = document.getElementById("password");
    var apellidos = document.getElementById("apellidos");
    var nombre = document.getElementById("nombre");
    var correo = document.getElementById("correo");
   var fechaNacimiento = document.getElementById("fechaNacimiento");
    var telefono = document.getElementById("telefono");
    var celular = document.getElementById("celular");

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

    var formulario = document.getElementById("formulario");
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
    var formulario = event.target;
    var elements = formulario.elements;

    var usuario = elements.namedItem("usuario");
    var password = elements.namedItem("password");
    var apellidos = elements.namedItem("apellidos");
    var nombre = elements.namedItem("nombre");
    var correo = elements.namedItem("correo");
    var fechaNacimiento = elements.namedItem("fechaNacimiento");
    var telefono = elements.namedItem("telefono");
    var celular = elements.namedItem("celular");
	var direccion = document.getElementById("direccion");

    var error = false;
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
    var index = arrayUsuarios.findIndex( (est) => est.usuario === usuario.value );
    return (index != -1)? true : false;
}
function isRepeatedC(correo) {
    var index = arrayUsuarios.findIndex( (est) => est.correo === correo.value );
    return (index != -1)? true : false;
}

function doSubmit() {
    var user= document.getElementById("usuario").value;
    var password = document.getElementById("password").value;
    var apellidos = document.getElementById("apellidos").value;
    var nombre = document.getElementById("nombre").value;
    var correo = document.getElementById("correo").value;
    var fechaNacimiento = document.getElementById("fechaNacimiento").value;
    var telefono = document.getElementById("telefono").value;
    var celular = document.getElementById("celular").value;

    var usuario = new Usuario(user,password,nombre,apellidos,correo,fechaNacimiento,0,telefono,celular);
    arrayUsuarios.push(usuario);

    Storage.store("Usuarios", arrayUsuarios);
    
    window.alert("Usuario agregado"+ correo.value + nombre.value);
    document.getElementById("formulario").reset();
    window.location="../html/index.html";
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