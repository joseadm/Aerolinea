<%-- 
    Document   : check
    Created on : May 18, 2017, 12:25:49 AM
    Author     : AndreyCh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@ include file="Header.jspf" %>

        <div class="container"> <%--<div class="jumbotron">--%>
            <h1>Reservar asientos</h1>
            <hr>

            <table id="check" class="table">
                <thead id="listaAsientosCabecera" class="thead-default">
                    <%--<tr>
                      <th>#</th>
                      <th>A</th>
                      <th>B</th>
                      <th>C</th>
                      <th> </th>
                      <th>E</th>
                      <th>F</th>
                      <th>G</th>
                    </tr> --%>
                </thead>
                <tbody id="listaAsientos">
                    <%--<tr>
                      <th scope="row">1</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="seat" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">4</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">5</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">6</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">7</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">8</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">9</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">10</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Libre.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">11</th>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td> </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                      <td>
                          <label class="btn btn-default">
                            <img src="images/Reservado.png" alt="libre" class="img-thumbnail img-check">
                            <input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
                          </label>
                      </td>
                    </tr> --%>
                </tbody>
            </table>
            <a href="pago.jsp" class="btn btn-sucess">Continuar</a>
        </div>

        <script> // Model
            function Model() {
            this.Model();
            }

            Model.prototype = {
            Model: function(){
            }
            };
        </script>
        <script> // Controller
            function Controller(model, view) {
            this.Controller(model, view);
            }

            Controller.prototype = {
            Controller: function(model, view){
            this.model = model;
            this.view = view;
            }

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event){
            model = new Model();
            controller = new Controller(model, window);
            crearAsientos();
            }
            function crearAsientos(){
            var filas = document.getElementById("cant_filas").value;
            var lista = document.getElementById("listaAsientos");
            for (int i = 0; i < filas; i++){
            if (i % 3 == 0)
                    crearPasillo(lista);
            else
                    crearFilas(lista);
            }
            }

            function crearFilas(lista){
            var tr, td, tmp, tmp2, txt;
            var filas = document.getElementById("cant_asientos_por_fila").value;
            for (int i = 0; i < filas; i++){
            tr = document.createElement("tr");
            td = document.createElement("td");
            tmp = document.createElement("label");
            tmp.setAttribute("class", "btn btn-primary btn-xs");
            tmp2 = document.createElement("input");
            tmp2.setAttribute("type", "checkbox");
            tmp2.setAttribute("id", ""); //ingresar a  la clase asiento y tomar su codigo/numero=id 
            txt = document.createTextNode(""); //ingresar a  la clase asiento y tomar su codigo/numero
            tmp.appendChild(tm2);
            td.appendChild(tmp);
            tr.appendChild(td);
            }
            tr.appendChild(document.createElement("br"));
            lista.appendChild(tr);
            }

            function crearPasillo(lista){
            var tr, td, tmp;
            tr = document.createElement("tr");
            td = document.createElement("td");
            tmp = document.createElement("br");
            td.appendChild(tmp);
            tr.appendChild(td);
            lista.appendChild(tr);
            }

            function crearEtiquetas(lista){

            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>

        <hr>
        <br><br><br>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratísimo, Inc.</p>
            </footer>
        </div>
    </body>
</html>