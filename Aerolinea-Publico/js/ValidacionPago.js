function pageLoad(event) {
  var btnAceptar = document.getElementById("aceptar");
  var btnCancelar = document.getElementById("cancelar");
  btnAceptar.addEventListener("click",pagar);

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
  if(validar(card))
    alert("Pago realizado.");
}

function cancelar(){

}


/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)
