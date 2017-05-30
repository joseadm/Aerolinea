/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;

import airline.model.Asiento;
import airline.model.Avion;
import airline.model.Ciudad;
import airline.model.Jsonable;
import airline.model.Reservacion;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import airline.model.model;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

@WebServlet(name = "AirlineService", urlPatterns = {"/AirlineService"})

public class AirlineService extends HttpServlet {

    model model;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class, "_class")
                    .registerSubtype(Ciudad.class, "Ciudad")
                    .registerSubtype(Vuelo.class, "Vuelo")
                    .registerSubtype(Avion.class, "Avion")
                    .registerSubtype(Reservacion.class, "Reservacion")
                    .registerSubtype(Tiquete.class, "Tiquete")
                    .registerSubtype(Asiento.class, "Asiento")
                    .registerSubtype(Usuario.class, "Usuario")
                    .registerSubtype(Viaje.class, "Viaje");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            List<Avion> aviones;
            List<Viaje> viajes;
            List<Viaje> viajes2;
            List<Usuario> usuarios;
            Usuario usuario;
            Viaje v;
            Ciudad c1;
            switch (accion) {
                case "ciudadListAll":
                    ciudades = model.selectAllCities();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                case "vueloListPromo":
                    vuelos = model.selectAllFlightsPromo();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "viajeListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    String diaIda = request.getParameter("diaIda");
                    String fechaIda = request.getParameter("fechaIda");
                    viajes = model.searchTravels(origen, destino,diaIda,fechaIda);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                case "viajeListSearchByDestiny":
                    String origen_vuelo = request.getParameter("origen");
                    String destino_vuelo = request.getParameter("destino");
                    String diaVuelta = request.getParameter("diaVuelta");
                    String fechaVuelta = request.getParameter("fechaVuelta");
                    viajes = model.searchTravels(destino_vuelo, origen_vuelo,diaVuelta,fechaVuelta);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                case "viajesListAll":
                    viajes = model.selectAllTravels();
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                case "avionesListAll":
                    aviones = model.selectAllPlanes();
                    json = gson.toJson(aviones);
                    out.write(json);
                    break;
                case "vuelosListAll":
                    vuelos = model.selectAllFlights();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "usuariosListAll":
                    usuarios = model.selectAllUsers();
                    json = gson.toJson(usuarios);
                    out.write(json);
                    break;
                case "avionAdd":
                    String jsonAvion = request.getParameter("avion");
                    Avion avion = gson.fromJson(jsonAvion, Avion.class);
                    int avionNumber = model.insertAvion(avion);
                    json = gson.toJson(avionNumber);
                    out.write(json);
                    break;
                case "ciudadAdd":
                    String jsonCiudad = request.getParameter("ciudad");
                    Ciudad ciudad = gson.fromJson(jsonCiudad, Ciudad.class);
                    int ciudadNumber = model.insertCiudad(ciudad);
                    json = gson.toJson(ciudadNumber);
                    out.write(json);
                    break;
                case "viajeAdd":
                    String jsonViaje = request.getParameter("viaje");
                    Viaje viaje = gson.fromJson(jsonViaje, Viaje.class);
                    int viajeNumber = model.ViajeAdd(viaje);
                    json = gson.toJson(viajeNumber);
                    out.write(json);
                    break;
                case "vueloAdd":
                    String jsonVuelo = request.getParameter("vuelo");
                    Vuelo vuelo = gson.fromJson(jsonVuelo, Vuelo.class);
                    int vueloNumber = model.VueloAdd(vuelo);
                    json = gson.toJson(vueloNumber);
                    out.write(json);
                    break;
                case "usuarioAdd":
                    String jsonUsuario = request.getParameter("usuario");
                    Usuario user = gson.fromJson(jsonUsuario, Usuario.class);
                    model.insertUsuario(user);
                    int UsuarioNumber = 1;
                    json = gson.toJson(UsuarioNumber);
                    out.write(json);
                    break;
                case "usuarioExiste":
                    String nombreUsuario = request.getParameter("nombreUsuario");
                    boolean exist = model.usuarioExiste(nombreUsuario);
                    json = gson.toJson(exist);
                    out.write(json);
                break;
                case "userLogin":
                    Usuario user1;
                    user1 = new Usuario(request.getParameter("usuario"), request.getParameter("contrasena"), "", "", "", new Date(), "", 0, 0, 0);
                    user1 = model.userLogin(user1);
                    if (user1.getTipo() != 0) {
                        request.getSession().setAttribute("usuario", user1);
                        switch (user1.getTipo()) {
                            case 1: // user
                                usuario = model.userLogin(user1);
                                request.getSession().setAttribute("usuario", usuario);
                                request.getRequestDispatcher("/index.jsp").forward(request, response);
                                break;
                            case 2: // manager
                                request.getRequestDispatcher("/viajes.jsp").forward(request, response);
                                break;
                        }
                    } else {
                        request.setAttribute("error", "Usuario/Clave incorrecto");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                    break;
                case "userLogout":
                        request.getSession().removeAttribute("usuario");
                        request.getSession().invalidate();
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    break;
                case "getViaje":
                    int numero = Integer.parseInt(request.getParameter("numeroV"));
                    v = model.selectTravel(numero);
                    json = gson.toJson(v);
                    out.write(json);
                    break;
                case "ciudadDelete":
                    String codigo = request.getParameter("codigo");
                    int n1 = model.deleteCiudad(codigo);
                    json = gson.toJson(n1);
                    out.write(json);
                    break;
                case "viajeDelete":
                    String numero_viaje = request.getParameter("numero_viaje");
                    int n2 = model.deleteViaje(numero_viaje);
                    json = gson.toJson(n2);
                    out.write(json);
                    break;
                case "vueloDelete":
                    String numero_vuelo = request.getParameter("numero_vuelo");
                    int n3 = model.deleteVuelo(numero_vuelo);
                    json = gson.toJson(n3);
                    out.write(json);
                    break;
                case "avionDelete":
                    String placa = request.getParameter("placa");
                    int n4 = model.deleteAvion(placa);
                    json = gson.toJson(n4);
                    out.write(json);
                    break;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        this.model = new model();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
