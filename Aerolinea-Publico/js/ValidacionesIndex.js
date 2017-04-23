var promo; // Arreglo de vuelos en promocion
var buscados;
var arrayUsuarios;
var ciudad;
var aeropuerto;
var arrayCiudades;
var arrayAeropuertos;
var arrayVuelos;
let user;
function pageLoad(event) {
    cargarBotones();
    addEventListeners();
    loadListUsuarios();
    loadListCiudades();
    loadListAeropuertos();
    //--------
    initCiudades();
    opciones();
    initVuelos();
    initPromo();
    showPromos();
}

function addEventListeners() {
    var correo= document.getElementById("correo");
    var password = document.getElementById("password");
    var aero_origen = document.getElementById("aero_origen");
    var aero_destino = document.getElementById("aero_destino");
    var fecha_ida = document.getElementById("fecha_ida");
    var fecha_regreso = document.getElementById("fecha_regreso");
    var ida = document.getElementById("ida");
    var vuelta = document.getElementById("vuelta");
    var pasajeros = document.getElementById("listPassengers");


	password.addEventListener("focus",doFocus);
	password.addEventListener("blur",doBlur);
	correo.addEventListener("focus",doFocus);
	correo.addEventListener("blur",doBlur);

    /*let formularioSesion = document.getElementById("formularioSesion");
    formularioSesion.addEventListener("submit", iniciarSesion);*/
    var incioSesionBoton= document.getElementById("inicioSesion");
    incioSesionBoton.addEventListener("click",iniciarSesion);
    var cerrarSesion= document.getElementById("cerrarSesion");
    cerrarSesion.addEventListener("click",cierraSesion);
    var botonBuscar = document.getElementById("btn_search");
    botonBuscar.addEventListener("click",buscar);
}
function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}
/*-----------------------   PARTE DE BUSQUEDA DE VUELOS-------------------------------*/
function initCiudades(){

        arrayCiudades=[
          new Ciudad("SJO","San Jose","Costa Rica"),
          new Ciudad("CAN","Cancun","Mexico"),
          new Ciudad("MIA","Miami","Estados Unidos"),
          new Ciudad("MAD","Madrid","Espana"),
          new Ciudad("ROM","Roma","Italia"),
          new Ciudad("VIE","Viena","Austria")
      ];

}
function opciones(){
    var select  = document.getElementById("aero_origen");
    var select2 = document.getElementById("aero_destino");
    for(i=0; i<arrayCiudades.length; i++) {
     select.options[select.options.length] = new Option(arrayCiudades[i].info());
     select2.options[select2.options.length] = new Option(arrayCiudades[i].info());
}
}

function aeropuertos(){
        var aeropuerto1 = new Aeropuerto("SJO","Aeropuerto Internacional Juan Santamar�a",arrayCiudades[0]);
        var aeropuerto2 = new Aeropuerto("MEX","Aeropuerto Internacional Benito Ju�rez",arrayCiudades[1]);
        var aeropuerto3 = new Aeropuerto("MIA","Aeropuerto Internacional de Miami",arrayCiudades[2]);
        var aeropuerto4 = new Aeropuerto("MAD","Aeropuerto Adolfo Su�rez Madrid-Barajas",arrayCiudades[3]);
        var aeropuerto5 = new Aeropuerto("ROM","Aeropuerto Internacional Leonardo da Vinci",arrayCiudades[4]);
        var aeropuerto6 = new Aeropuerto("VIE","Aeropuerto Internacional de Viena",arrayCiudades[5]);

        arrayAeropuertos.push(aeropuerto1);
        arrayAeropuertos.push(aeropuerto2);
        arrayAeropuertos.push(aeropuerto3);
        arrayAeropuertos.push(aeropuerto4);
        arrayAeropuertos.push(aeropuerto5);
        arrayAeropuertos.push(aeropuerto6);

}
/*-----------------------PARTE DE INICIO DE SESION----------------------------------- */

function cargarBotones(){
    if(user!=1){ /*Nadie a iniciado sesion */
        document.getElementById("ulPrincipal").style.display = 'none';
    }else{
        document.getElementById("correo").style.display = 'none';
        document.getElementById("password").style.display = 'none';
        document.getElementById("crearCuenta").style.display = 'none';
        document.getElementById("inicioSesion").style.display = 'none';
        document.getElementById("ulPrincipal").style.display = 'initial';
    }
}
function loadListUsuarios() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
function loadListCiudades() {
    arrayCiudades = Storage.retrieve("Ciudades");
    if (arrayCiudades == null) {
        arrayCiudades = [];
        Storage.store("Ciudades", arrayCiudades);
    }
}
function loadListAeropuertos() {
    arrayAeropuertos = Storage.retrieve("Aeropuertos");
    if (arrayAeropuertos == null) {
        arrayAeropuertos = [];
        Storage.store("Aeropuertos", arrayAeropuertos);
    }
}
function buscar(){

}
function iniciarSesion(){
    let correo= document.getElementById("correo");
    let password = document.getElementById("password");
    if(usuarioCorrecto(correo,password)){
        window.alert("Bienvenido");
        user=1;
        cargarBotones();
    }else{
        window.alert("error inicio de sesion");
    }

}
function cierraSesion(){
        document.getElementById("ulPrincipal").style.display = 'none';
        document.getElementById("correo").style.display = 'initial';
        document.getElementById("password").style.display = 'initial';
        document.getElementById("crearCuenta").style.display = 'initial';
        document.getElementById("inicioSesion").style.display = 'initial';

        document.getElementById("password").value ="";
        user=0;
}
function usuarioCorrecto(correo, password) {
    let index = arrayUsuarios.findIndex( ((est) => est.correo === correo.value) && ((est) => est.contrasena === password.value) );
        if(index != -1){
            return true;
        }
        return false;
}
function initPromo() {
    promo=[
    new Vuelo("SJO-MIA","San Jose","Miami","A320","05/08/17","Disponible","100"),
    new Vuelo("MIA-CAN","Miami","Cancun","A330","24/08/17","Disponible","200"),
    new Vuelo("MAD-ROM","Madrid","Roma","A340","12/06/17","Disponible","80"),
    new Vuelo("VIE-MAD","Viena","Madrid","A320","04/07/17","Disponible","60"),
    new Vuelo("CAN-MAD","Cancun","Madrid","A330","27/10/17","Disponible","200"),
    new Vuelo("MIA-SJO","Miami","San Jose","A340","12/08/17","Disponible","40")
  ];
}
function initVuelos() {
    arrayVuelos=[
    new Vuelo("SJO-MIA","San Jose","Miami","A320","05/08/17","Disponible","100"),
    new Vuelo("MIA-CAN","Miami","Cancun","A330","24/08/17","Disponible","70"),
    new Vuelo("MAD-ROM","Madrid","Roma","A340","12/06/17","Disponible","90"),
    new Vuelo("VIE-MAD","Viena","Madrid","A320","04/07/17","Disponible","200"),
    new Vuelo("CAN-MAD","Cancun","Madrid","A330","27/10/17","Disponible","100"),
    new Vuelo("MIA-SJO","Miami","San Jose","A340","12/08/17","Disponible","50"),

    new Vuelo("SJO-ROM","San Jose","Roma","A320","05/08/17","Disponible","100"),
    new Vuelo("MIA-VIE","Miami","Viena","A330","24/08/17","Disponible","70"),
    new Vuelo("MAD-SJO","Madrid","San Jose","A340","12/06/17","Disponible","90"),
    new Vuelo("MAD-CAN","Madrid","Cancun","A320","04/07/17","Disponible","200"),
    new Vuelo("VIE-SJO","Viena","San Jose","A330","27/10/17","Disponible","100"),
    new Vuelo("CAN-VIE","Cancun","Viena","A340","12/08/17","Disponible","50")
  ];
}
function showPromos() {
  var circulos; var titulo;
  var li; var lista;
  var div1; var div2;
  var img1; var precio;
  var boton;
  for(i=0; i<promo.length; i++) {
  // -----------Agregar nuevo circulo---------------
  circulos = document.getElementById("circulos");
  li =document.createElement("li");
  li.setAttribute("data-target","#carousel-generic");
  li.setAttribute("data-slide-to",i+1);
  circulos.appendChild(li);
  // ----------Agregar nuevo item----------------
  lista = document.getElementById("listaCarousel");
  div1 = document.createElement("div");
  div1.setAttribute("class", "item");
  img1 = document.createElement("img");
  img1.setAttribute("src","../images/"+promo[i].aeropuerto_destino+".jpg");
  div1.appendChild(img1);
  div2 = document.createElement("div");
  div2.setAttribute("class","carousel-caption");
  titulo = document.createElement("h2");
  titulo.appendChild(document.createTextNode(promo[i].aeropuerto_origen+" "+promo[i].aeropuerto_destino));
  precio = document.createElement("h5");
  precio.appendChild(document.createTextNode("Obten tu viaje por tan solo "+promo[i].precio+"$"));
  boton = document.createElement("button");
  boton.setAttribute("class","btn btn-primary");
  boton.appendChild(document.createTextNode("Ordenar"));
  div2.appendChild(titulo);
  div2.appendChild(precio);
  div2.appendChild(boton);
  div1.appendChild(div2);
  lista.appendChild(div1);
 }
}
function showBuscado() {
  var listaBuscados = document.getElementById("listaBuscados");
  listaBuscados.innerHTML="";
  var li; var li_image; var j=buscados.length;
  for(i=0; i<buscados.length; i++) {
    li_image = document.createElement("img");
    li_image.setAttribute("src","../images/"+buscados[i].aeropuerto_destino+".jpg");
    li_image.height = "80"; li_image.width = "100";
    li = document.createElement("li");
    li.appendChild(li_image);
    li.appendChild(document.createTextNode(" "+buscados[i].aeropuerto_origen+" - "+buscados[i].aeropuerto_destino+" "+buscados[i].precio+"$"));
    listaBuscados.appendChild(li);
    listaBuscados.appendChild(document.createElement("hr"));
    paginacion();
  }
}
function buscar() {
  var origenVuelo = document.getElementById("aero_origen");
  var destinoVuelo = document.getElementById("aero_destino");
  buscados = arrayVuelos.filter(
    function(v) { return true; }//return (v.aeropuerto_origen==origenVuelo.value && v.aeropuerto_destino==destinoVuelo.value);}
  );
  //showBuscado();
  paginacion();
}

function paginacion() {
  for(i=0; i<buscados.length; i++) {
  // Si es la primera
  if(i==10) {
    var j = i;
    var lista = document.getElementById("paginas");
    var li = document.createElement("li");
    li.setAttribute("class","active");
    var a = document.createElement("a");
    a.appendChild(document.createTextNode("1"));
    li.appendChild(a);
    li.addEventListener("click",function(e){showBuscados2(j);}); // Muestra primeros 10
    lista.appendChild(li);
    showBuscados2(j);
  }
}
}

function showBuscados2(j) {
  var listaBuscados = document.getElementById("listaBuscados");
  listaBuscados.innerHTML="";
  var li; var li_image;
  for(i=0; i<j; i++) {
    li_image = document.createElement("img");
    li_image.setAttribute("src","../images/"+buscados[i].aeropuerto_destino+".jpg");
    li_image.height = "80"; li_image.width = "100";
    li = document.createElement("li");
    li.appendChild(li_image);
    li.appendChild(document.createTextNode(" "+buscados[i].aeropuerto_origen+" - "+buscados[i].aeropuerto_destino+" "+buscados[i].precio+"$"));
    listaBuscados.appendChild(li);
    listaBuscados.appendChild(document.createElement("hr"));
  }
}

/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)
