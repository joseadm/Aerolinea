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
    listUsuarios(arrayUsuarios);
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
    let carnet = document.getElementById("carnet").value;
    let apellidos = document.getElementById("apellidos").value;
    let nombre = document.getElementById("nombre").value;

    let usuario = new Usuario(carnet, apellidos, nombre, examenes);
    arrayUsuarios.push(usuario);

    Storage.store("Usuarios", arrayUsuarios);
    
    let listado = document.getElementById("listado");
    listUsuario(listado, usuario);

    document.getElementById("formulario").reset();
}

function listUsuarios(arrayUsuarios) {
    let listado = document.getElementById("listado");
    listado.innerHTML = "";
    for (let i in arrayUsuarios) {
        listUsuario(listado, arrayUsuarios[i]);
    }
}

function listUsuario(listado, usuario) {
    let tr = document.createElement("tr");
    let td;

    td = document.createElement("td");
    td.appendChild(document.createTextNode(usuario.carnet));
    tr.appendChild(td);

    td = document.createElement("td");
    td.appendChild(document.createTextNode(usuario.apellidos));
    tr.appendChild(td);

    td = document.createElement("td");
    td.appendChild(document.createTextNode(usuario.nombre));
    tr.appendChild(td);

    let input;
    let examenes = usuario.examenes.arrayExamenes;
    let id;

    id = usuario.carnet.concat("Examen1");
    td = document.createElement("td");
    input = "<input type='text' id='" + id +"' value='" + examenes[0] + "'>";
    td.innerHTML = input;
    tr.appendChild(td);

    id = usuario.carnet.concat("Examen2");
    td = document.createElement("td");
    input = "<input type='text' id='" + id +"' value='" + examenes[1] + "'>";
    td.innerHTML = input;
    tr.appendChild(td);

    id = usuario.carnet.concat("Examen3");
    td = document.createElement("td");
    input = "<input type='text' id='" + id +"' value='" + examenes[2] + "'>";
    td.innerHTML = input;
    tr.appendChild(td);

    id = usuario.carnet.concat("Promedio");
    td = document.createElement("td");
    label = "<label class='centerText' id='" + id + "' for='promedio'></label>";
    td.innerHTML = label;
    tr.appendChild(td);

    listado.appendChild(tr);
    inputExamListener(usuario);
    setPromedio(usuario);
}

function inputExamListener(usuario) {
    let element;
    let id;

    id = usuario.carnet.concat("Examen1");
    element = document.getElementById(id);
    addListener(element, usuario, 0);
    id = usuario.carnet.concat("Examen2");
    element = document.getElementById(id);
    addListener(element, usuario, 1);
    id = usuario.carnet.concat("Examen3");
    element = document.getElementById(id);
    addListener(element, usuario, 2);
}

function addListener(element, usuario, i) {
    addFocusBlur(element);
    element.className += " centerText";
    element.addEventListener("blur", (event) => {
         usuario.examenes.arrayExamenes[i] = parseFloat(event.target.value);
         setPromedio(usuario);
    })
}

document.addEventListener("DOMContentLoaded", pageLoad)