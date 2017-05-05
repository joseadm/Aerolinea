

// ---------------------MODEL--------------------
var promo;
var buscados;
var vuelos;
var ciudades;
var arrayUsuarios;
var user;



function AirlineModel() {
  this.AirlineModel();
}

AirlineModel.prototype={
  AirlineModel: function() {
      this.buscados=[];
      this.promo=[];
      this.ciudades=[];
      this.vuelos=[];
  }
};

// ---------------------CONTROLLER--------------------
var model;
var view;
function AirlineController(model, view) {
  this.AirlineController(model, view);  
}

AirlineController.prototype={
  AirlineController: function(model, view) {
    this.model=model;
    this.view=view;
    
    Proxy.getCiudades(function (result) {
       model.ciudades = result;
       view.listCiudades();
 
    });
    Proxy.getPromo(function (result) {
       model.promo = result;
       view.showPromos();
    });   
  },
    search: function() {
        var origenVuelo = document.getElementById("origen");
        var destinoVuelo = document.getElementById("destino");
        var radio1 = document.getElementById("ida");
        var radio2 = document.getElementById("vuelta");
        var ida = document.getElementById("fecha_ida");
        var regreso = document.getElementById("fecha_regreso");
        console.log(origenVuelo.value);
        console.log(destinoVuelo.value);
        Proxy.vuelosSearch(origenVuelo.value, destinoVuelo.value, function(result) {
            console.log(origenVuelo.value);
        console.log(destinoVuelo.value);
           model.buscados = result; 
           showBuscado();
        });
//        if(radio2.checked){
//            this.model.buscados = this.model.vuelos.filter(
//            function(v) { return (v.ciudad_origen==destinoVuelo.value && v.ciudad_destino==origenVuelo.value && v.fecha==fecha_regreso.value);});
//
//            var aux = this.model.vuelos.filter(
//            function(v) { return (v.ciudad_origen==origenVuelo.value && v.ciudad_destino==destinoVuelo.value && v.fecha==fecha_ida.value);});
//            for(i=0; i<aux.length; i++) {
//                this.model.buscados.push(aux[i]);
//            }
//        }
//
//        if(radio1.checked){
//            this.model.buscados = this.model.vuelos.filter(
//            function(v) { return (v.ciudad_origen==origenVuelo.value && v.ciudad_destino==destinoVuelo.value && v.fecha==fecha_ida.value);});
//        }
},
    showBuscado: function() {
        var t = $('#paginacion').DataTable();
        $('#paginacion').dataTable().fnClearTable();
        for(var index in model.buscados) {
            t.row.add( [
            model.buscados[index].codigo,
            model.buscados[index].ciudad_origen,
            model.buscados[index].ciudad_destino,
            model.buscados[index].fecha,
            "$ "+model.buscados[index].precio
            ] ).draw( false );
        }
  }
}

// ---------------------VIEW--------------------
var modelView;
var controllerView;

  function pageLoad(event){
    modelView = new AirlineModel();
    controllerView = new AirlineController(modelView, window);
    showPromos(); // Crea promociones en la pagina
    addEventListeners();
    loadButtons();
    listCiudades();
    oneWay();
  }

  function showPromos() {

    var circulos; var titulo;
    var li; var lista;
    var div1; var div2;
    var img1; var precio;
    var boton;

    for(var index in modelView.promo) {
    // -----------Agregar nuevo circulo---------------
    circulos = document.getElementById("circulos");
    li =document.createElement("li");
    li.setAttribute("data-target","#carousel-generic");
    li.setAttribute("data-slide-to",index+1);
    circulos.appendChild(li);
    // ----------Agregar nuevo item----------------
    lista = document.getElementById("listaCarousel");
    div1 = document.createElement("div");
    div1.setAttribute("class", "item");
    img1 = document.createElement("img");
    img1.setAttribute("src","images/"+modelView.promo[index].ciudad_destino.info()+".jpg");
    div1.appendChild(img1);
    div2 = document.createElement("div");
    div2.setAttribute("class","carousel-caption"); 
    titulo = document.createElement("h2");
    titulo.appendChild(document.createTextNode(modelView.promo[index].ciudad_origen.info()+" "+modelView.promo[index].ciudad_destino.info()));
    precio = document.createElement("h5");
    precio.appendChild(document.createTextNode("Obten tu viaje por tan solo "+modelView.promo[index].precio+"$"));
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
function addEventListeners() {
    var correo= document.getElementById("correo");
    var password = document.getElementById("password");
    var origen = document.getElementById("origen");
    var destino = document.getElementById("destino");
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
    incioSesionBoton.addEventListener("click",login);
    var cerrarSesion= document.getElementById("cerrarSesion");
    cerrarSesion.addEventListener("click",logout);
    var buscar = document.getElementById("btn-search");
    $('#btn_search').click( function(){
        controllerView.search();
    });

}
function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}
function loadButtons(){
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
function login(){
    var correo= document.getElementById("correo");
    var password = document.getElementById("password");
    //if(validateUser(correo,password)){
        window.alert("Bienvenido");
        user=1;
        loadButtons();
    //}else{
    //    window.alert("error inicio de sesion");
    //}

}
function logout(){
        document.getElementById("ulPrincipal").style.display = 'none';
        document.getElementById("correo").style.display = 'initial';
        document.getElementById("password").style.display = 'initial';
        document.getElementById("crearCuenta").style.display = 'initial';
        document.getElementById("inicioSesion").style.display = 'initial';

        document.getElementById("password").value ="";
        user=0;
}
/*function validateUser(correo, password) {
    var index = arrayUsuarios.findIndex( ((est) => est.correo === correo.value) && ((est) => est.contrasena === password.value) );
        if(index != -1){
            return true;
        }
        return false;
}*/
function listCiudades(){
        var select  = document.getElementById("origen");
        var select2 = document.getElementById("destino");

        for(var index in modelView.ciudades) {
            select.options[select.options.length] = new Option(modelView.ciudades[index].info());
            select2.options[select2.options.length] = new Option(modelView.ciudades[index].info());

        }
}

//Si la opcion de ida es seleccionada solo la fecha ida es habilitada
 function oneWay(){
   var ida = document.getElementById("ida");
   var vuelta = document.getElementById("vuelta");
   var fecha = document.getElementById("fecha_regreso");
   ida.onclick = function(){
     fecha.value = '';
     fecha.disabled = true;
   }
   vuelta.onclick = function(){
     fecha.disabled = false;
    }
  }

  document.addEventListener("DOMContentLoaded",pageLoad)
