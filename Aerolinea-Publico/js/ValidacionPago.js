function pageLoad(event) {

}

function validar(campo){
  if ((document.forms[0][campo].value.length==0) ||
  (document.forms[0][campo].value==null)) {
  return true;
}
else { return false; }
}

function 

/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)
