var arrayUsuarios;
function pageLoad(event) {
    addEventListeners();
    loadSpaces();
    loadList();
}
function initMap() {
        var uluru = {lat: 10.0000000, lng: -84.0000000};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
}
function loadSpaces() {
    let  usuario= document.getElementById("usuario");
    let password = document.getElementById("password");
    let apellidos = document.getElementById("apellidos");
    let nombre = document.getElementById("nombre");
    let correo = document.getElementById("correo");
    /*let fechaNacimiento = document.getElementById("fechaNacimiento");*/
    let telefono = document.getElementById("telefono");
    let celular = document.getElementById("celular");

   usuario.value= "jose manuel";
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
   /* let fechaNacimiento = document.getElementById("fechaNacimiento");*/
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
	/*fechaNacimiento.addEventListener("focus",doFocus);
	fechaNacimiento.addEventListener("blur",doBlur); */
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

function doValidate(event) {
    let formulario = event.target;
    let elements = formulario.elements;

    let usuario = elements.namedItem("usuario");
    let password = elements.namedItem("password");
    let apellidos = elements.namedItem("apellidos");
    let nombre = elements.namedItem("nombre");
    let correo = elements.namedItem("correo");
   /* let fechaNacimiento = elements.namedItem("fechaNacimiento");*/
    let telefono = elements.namedItem("telefono");
    let celular = elements.namedItem("celular");

    let error = false;

    error = isBlank(usuario);
    error = isBlank(password);
    error = isBlank(nombre);
    error = isBlank(apellidos);
    error = isBlank(correo);
   /* error = isBlank(fechaNacimiento);*/
    error = isBlank(telefono);
    error = isBlank(celular);

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
    let user= document.getElementById("usuario");
    let password = document.getElementById("password");
    let apellidos = document.getElementById("apellidos");
    let nombre = document.getElementById("nombre");
    let correo = document.getElementById("correo");
   /* let fechaNacimiento = document.getElementById("fechaNacimiento");*/
    let telefono = document.getElementById("telefono");
    let celular = document.getElementById("celular");

    let usuario = new Usuario(user,password,nombre,apellidos,correo,0,0,telefono,celular);
    arrayUsuarios.push(usuario);

    Storage.store("Usuarios", arrayUsuarios);
    

    document.getElementById("formulario").reset();
}

document.addEventListener("DOMContentLoaded", pageLoad)