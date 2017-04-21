var arrayUsuarios;
var user;
function pageLoad(event) {
    document.getElementById("formulario").reset();
    addEventListeners();
    loadList();
}
/*-----------------------PARTE DE INICIO DE SESION----------------------------------- */
function loadList() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)