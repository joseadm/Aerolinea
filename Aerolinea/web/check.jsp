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
      <!-- Form -->
        <div class="container">
          <h1>Reservar asientos</h1>
          <hr>
          <form method="post">
          <table id="check" class="table">
              <thead class="thead-default">
                <tr>
                  <th>#</th>
                  <th>A</th>
                  <th>B</th>
                  <th>C</th>
                  <th> </th>
                  <th>E</th>
                  <th>F</th>
                  <th>G</th>
                </tr>
              </thead>
            <tbody>
              <tr>
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
              </tr>
            </tbody>
          </table>
          <input type="button" class="btn btn-sucess" value="Continuar>>">
        </form>
        </div>
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
