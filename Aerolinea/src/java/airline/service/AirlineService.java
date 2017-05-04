/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;

import airline.model.AirlineModel;
import airline.model.Asiento;
import airline.model.Avion;
import airline.model.Ciudad;
import airline.model.Direccion;
import airline.model.Jsonable;
import airline.model.Reservacion;
import airline.model.Rol;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

@WebServlet(name = "AirlineService", urlPatterns = {"/AirlineService"})

public class AirlineService extends HttpServlet {
    AirlineModel model;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset-UTF-8");
            try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class,"_class")
            .registerSubtype(Ciudad.class,"Ciudad")
            .registerSubtype(Vuelo.class,"Vuelo")
            .registerSubtype(Avion.class,"Avion")
            .registerSubtype(Direccion.class,"Direccion")
            .registerSubtype(Reservacion.class,"Reservacion")
            .registerSubtype(Rol.class,"Rol")
            .registerSubtype(Tiquete.class,"Tiquete")
            .registerSubtype(Usuario.class,"Usuario")
            .registerSubtype(Viaje.class,"Viaje");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/mm/yyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            switch(accion) {
                case "ciudadListAll":
                    ciudades = model.getCiudades();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                case "vueloListPromo":
                    vuelos = model.getPromo();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "vueloListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    vuelos = model.getVuelos(origen,destino);
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
            }
        }
        catch(Exception e){System.out.println(e);}
    }
    @Override
    public void init() throws ServletException {
            super.init();
            model = new AirlineModel();
    }
}
