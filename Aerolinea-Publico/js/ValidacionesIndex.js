var arrayUsuarios;
let user;
function pageLoad(event) {
    crearBotones();
    addEventListeners();
    loadList();
    cargarBotones();
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
function crearBotones(){
        let form = document.getElementById("formularioSesion");
        
        let input = document.createElement("input");
        input.setAttribute("id","correo");
        input.setAttribute("name","correo");
        input.setAttribute("placeholder","Email");
        input.setAttribute("class","form-control");
        input.setAttribute("type","text");
        form.appendChild(input);

        let input2 = document.createElement("input");
        input2.setAttribute("id","password");
        input2.setAttribute("name","password");
        input2.setAttribute("placeholder","contraseña");
        input2.setAttribute("class","form-control");
        input2.setAttribute("type","password");
        form.appendChild(input2);

        let button = document.createElement("button");
        button.setAttribute("id","inicioSesion");
        button.setAttribute("type","submit");
        button.setAttribute("class","btn btn-success");
        let botonInicio= "Iniciar Sesion";
        button.innerHTML = botonInicio;
        form.appendChild(button);

        let a = document.createElement("a");
        a.setAttribute("href","registro.html");
        a.setAttribute("id","crearCuenta");
        a.setAttribute("type","button");
        a.setAttribute("class","btn btn-primary");
        let botonCrear= "Crear cuenta"
        a.innerHTML = botonCrear;
        form.appendChild(a);

        let button2 = document.createElement("button");
        button2.setAttribute("id","cerrarSesion");
        button2.setAttribute("type","button");
        button2.setAttribute("class","btn btn-danger");
        let botonInicio2= "Cerrar Sesion";
        button2.innerHTML = botonInicio2;
        form.appendChild(button2);

       cargarBotones();

}
function cargarBotones(){
    if(user!=1){ /*Nadie a iniciado sesion */
        document.getElementById("cerrarSesion").style.display = 'none';
    }else{
        document.getElementById("correo").style.display = 'none';
        document.getElementById("password").style.display = 'none';
        document.getElementById("crearCuenta").style.display = 'none';
        document.getElementById("inicioSesion").style.display = 'none';
    }
}
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
        user=1;
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