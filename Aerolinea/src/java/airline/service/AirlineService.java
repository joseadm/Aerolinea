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
import airline.model.Jsonable;
import airline.model.Reservacion;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import airline.model.model;
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
    model model;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset-UTF-8");
            try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class,"_class")
            .registerSubtype(Ciudad.class,"Ciudad")
            .registerSubtype(Vuelo.class,"Vuelo")
            .registerSubtype(Avion.class,"Avion")
            .registerSubtype(Reservacion.class,"Reservacion")
            .registerSubtype(Tiquete.class,"Tiquete")
            .registerSubtype(Asiento.class,"Asiento")
            .registerSubtype(Usuario.class,"Usuario")
            .registerSubtype(Viaje.class,"Viaje");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            switch(accion) {
                case "ciudadListAll":
                    ciudades = model.selectAllCities();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                case "vueloListPromo":
                    vuelos = model.selectAllFlights();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "vueloListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    //vuelos = model.getVuelos(origen,destino);
                    //json = gson.toJson(vuelos);
                    //out.write(json);
                    break;
            }
        }
        catch(Exception e){System.out.println(e);}
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
