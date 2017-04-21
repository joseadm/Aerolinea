var arrayUsuarios;
var user;
function pageLoad(event) {
    document.getElementById("formularioSesion").reset();
    addEventListeners();
    loadList();
}
function addEventListeners() {
    let correo= document.getElementById("correo");
    let password = document.getElementById("password");
   
	password.addEventListener("focus",doFocus);
	password.addEventListener("blur",doBlur); 
	correo.addEventListener("focus",doFocus);
	correo.addEventListener("blur",doBlur); 
    
    let formularioSesion = document.getElementById("formularioSesion");
    formularioSesion.addEventListener("submit", iniciarSesion);
}
function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}
/*-----------------------PARTE DE INICIO DE SESION----------------------------------- */
function loadList() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
function iniciarSesion(){
    let correo= document.getElementById("correo");
    let password = document.getElementById("password");
    if(usuarioCorrecto(correo,password)){
        window.alert("Bienvenido");
        document.getElementById("correo").style.display = 'none';
        document.getElementById("password").style.display = 'none';
        document.getElementById("crearCuenta").style.display = 'none';
        document.getElementById("inicioSesion").style.display = 'none';
    }else{
        window.alert("error inicio de sesion");
    }
    
}

function usuarioCorrecto(correo, password) {
    let index = arrayUsuarios.findIndex( ((est) => est.correo === correo.value) && ((est) => est.contrasena === password.value) );
    return (index != -1)? true : false;
}
/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)