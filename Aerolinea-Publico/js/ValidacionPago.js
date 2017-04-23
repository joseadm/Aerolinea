function pageLoad(event) {
  var btnAceptar = document.getElementById("aceptar");
  var btnCancelar = document.getElementById("cancelar");
  var numTarjeta = document.getElementById("numTarjeta");
  btnAceptar.addEventListener("click",pagar);
  btnCancelar.addEventListener("click",cancelar);
  numTarjeta.addEventListener("focus",doFocus);
	numTarjeta.addEventListener("blur",doBlur);
}

function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}

function validar(){
  var x = document.forms["formPago"]["numTarjeta"].value;
  if (x == "") {
      alert("Por favor ingrese el numero de tarjeta");
      return false;
  }
  return true;
}

function pagar(){
  var card = document.getElementById("numTarjeta");
  var formPago = document.getElementById("formPago");
  var month = document.getElementById("expirationMonth");
  var year = document.getElementById("expirationYear");
  if(validar(card)){
    alert("Pago realizado.");
    formPago.reset();
  }
}

function cancelar(){
  var numTarjeta = document.getElementById("numTarjeta").value='';
  if (!confirm("Esta Seguro?")) {
    return;
  } else {
    formPago.reset();
    alert("Cancelado.");
  }
}


/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)
