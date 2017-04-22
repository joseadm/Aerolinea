// ---------------------MODEL--------------------
function AirlineModel() {
  this.AirlineModel();
}

AirlineModel.prototype={
  AirlineModel: function() {
    this.promo=this.initPromo();
    this.ciudades=this.initCiudades();
    this.vuelos=this.initVuelos();
    this.buscados=[];
  },
  initCiudades: function() {
    var ciudades=[
      new Ciudad("SJO","San Jose","Costa Rica"),
      new Ciudad("CAN","Cancun","Mexico"),
      new Ciudad("MIA","Miami","USA"),
      new Ciudad("MAD","Madrid","Espana"),
      new Ciudad("ROM","Roma","Italia"),
      new Ciudad("VIE","Viena","Austria")
    ];
  },
  initPromo: function() {
    var promo=[
      new Vuelo("SJO-MIA","San Jose","Miami","A320","05/08/17","Disponible"),
      new Vuelo("MIA-CAN","Miami","Cancun","A330","24/08/17","Disponible"),
      new Vuelo("MAD-ROM","Madrid","Roma","A340","12/06/17","Disponible"),
      new Vuelo("VIE-MAD","Viena","Madrid","A320","04/07/17","Disponible"),
      new Vuelo("CAN-MAD","Cancun","Madrid","A330","27/10/17","Disponible"),
      new Vuelo("MIA-SJO","Miami","San Jose","A340","12/08/17","Disponible")
    ];
  },
  initVuelos: function() {
    var vuelos=[
      new Vuelo("SJO-MIA","San Jose","Miami","A320","05/08/17","Disponible"),
      new Vuelo("MIA-CAN","Miami","Cancun","A330","24/08/17","Disponible"),
      new Vuelo("MAD-ROM","Madrid","Roma","A340","12/06/17","Disponible"),
      new Vuelo("VIE-MAD","Viena","Madrid","A320","04/07/17","Disponible"),
      new Vuelo("CAN-MAD","Cancun","Madrid","A330","27/10/17","Disponible"),
      new Vuelo("MIA-SJO","Miami","San Jose","A340","12/08/17","Disponible")
    ];
  }
}
// ---------------------CONTROLLER--------------------
function AirlineController(model, view) {
  this.AirlineController(model, view);
}

AirlineController.prototype={
  AirlineController: function(model, view) {
    this.model=model;
    this.view=view;
  },
  buscar: function() {
    var origenVuelo = document.getElementById("aero_origen");
    var destinoVuelo = document.getElementById("aero_destino");
    console.log(origenVuelo.value);
    console.log(destinoVuelo.value);
    model.buscados=model.vuelos.filter(
      function(v) {
        console.log(v.origen);
        console.log(v.destino);
        return (v.origen==origenVuelo.value && v.destino==destinoVuelo.value);}
    );
    this.view.showBuscados();
  },
  showPromos: function() {
  //  window.alert(model.promo[0].codigo);
    //this.view.showPromo(model.promo[1]);
  },
  listaCiudades: function() {

  }
}

// ---------------------VIEW--------------------
var model;
var controller;

  function pageLoad(event){
    model = new AirlineModel();
    controller = new AirlineController(model, window);
  //  controller.listaCiudades();
    //controller.showPromos(); // Crea promociones en la pagina
    showBuscados();
    var buscar = document.getElementById("btn-search");
    buscar.addEventListener("click",controller.buscar);
  }
  // Dibuja todos los vuelos buscados
  function showBuscados() {
    for(i=0; i<2; i++)
      console.log(model.promo[i]);
  }
  // Dibuja un vuelo buscado
  function showBuscado(vuelo) {
  }

  // Dibuja una promocion
  function showPromo(vuelo) {
    var circulos = document.getElementById("circulos");
    var li_final = circulos.lastChild;
    var li =document.createElement("li");
    li.setAttribute("data-target","#carousel-generic");
    li.setAttribute("data-slide-to",li_final.getAttribute("data-slide-to")+1);

  }
  function listaCiudad(ciudad){
      console.log(ciudad.info());
      var select  = document.getElementById("aero_origen");
      var select2 = document.getElementById("aero_destino");
       select.options[select.options.length] = new Option(ciudad.info());
       select2.options[select2.options.length] = new Option(ciudad.info());
  }

  document.addEventListener("DOMContentLoaded",pageLoad)
