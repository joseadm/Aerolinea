/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import airline.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JoseManuel
 */
public class model {
    static Database ciudades;
    static Database vuelos;
    static Database viajes;
    static Database aviones;
    
    static {
        initCiudades();
        initVuelos();
        initViajes();
        initAviones();
    }
    
    private static void initCiudades(){
       ciudades= new Database(null, null, "root");        
    }
    private static void initVuelos(){
       vuelos= new Database(null, null, "root");        
    }
    private static void initViajes(){
       viajes= new Database(null, null, "root");        
    }
    private static void initAviones(){
       aviones= new Database(null, null, "root");        
    }
    /*--------------------------------Ciudades-----------------------------------------*/
     public static List<Ciudad> selectAllCities() throws Exception{
       List<Ciudad> cities;
       cities= new ArrayList();
        try {
            String sql="select * "+
                    "from Ciudad p  ";
            ResultSet rs =  ciudades.executeQuery(sql);
            while (rs.next()) {
                cities.add(toCiudad(rs));
            }
        } catch (SQLException ex) {
        }
       return cities;
   }
    private static Ciudad toCiudad(ResultSet rs) throws Exception{
       Ciudad obj= new Ciudad();
       obj.setCodigo(rs.getString("codigo"));
       obj.setNombre(rs.getString("nombre"));
       obj.setPais(rs.getString("pais"));
       return obj;
    }
    /*-----------------------------------------------------------------------------*/
    /*-------------------------------------------Vuelos-----------------------*/
      public static List<Vuelo> selectAllFlights() throws Exception{
       List<Vuelo> flights;
       flights= new ArrayList();
        try {
            String sql="select * "+
                    "from Vuelo p ";
            ResultSet rs =  vuelos.executeQuery(sql);
            while (rs.next()) {
                flights.add(toFlights(rs));
            }
        } catch (SQLException ex) {
        }
       return flights;
   }
    private static Vuelo toFlights(ResultSet rs) throws Exception{
       Vuelo obj= new Vuelo();
       obj.setCodigo(rs.getInt("numeroVuelo"));
       obj.setCiudad_origen(toCiudad(rs));
       obj.setCiudad_destino(toCiudad(rs)); //REVISAR SI ES ASI
       obj.setEstado(rs.getBoolean("estado"));
       obj.setPrecio(rs.getInt("precio"));
       obj.setDuracion(rs.getString("numeroVuelo"));
       return obj;
    }
    /*-----------------------------------------------------------------------------*/
    /*----------------------------------------Viaje---------------------------------*/
   public static List<Viaje> selectAllTravels() throws Exception{
       List<Viaje> travels;
       travels = new ArrayList();
        try {
            String sql="select * "+
                    "from Viaje p ";
            ResultSet rs =  viajes.executeQuery(sql);
            while (rs.next()) {
                travels.add(toTravels(rs));
            }
        } catch (SQLException ex) {
        }
       return travels;
   }
    private static Viaje toTravels(ResultSet rs) throws Exception{
       Viaje obj= new Viaje();
       obj.setNumero_viaje(rs.getInt("numeroViaje"));
       obj.setFecha(rs.getDate("fecha"));
       obj.setAvion(toPlanes(rs));
       obj.setVuelo(toFlights(rs));
       return obj;
    }
    /*-------------------------------------------------------------------------*/
    /*------------------------------Avion-----------------------------------------*/
    public static List<Avion> selectAllPlanes() throws Exception{
       List<Avion> planes;
       planes = new ArrayList();
        try {
            String sql="select * "+
                    "from Avion p ";
            ResultSet rs =  aviones.executeQuery(sql);
            while (rs.next()) {
                planes.add(toPlanes(rs));
            }
        } catch (SQLException ex) {
        }
       return planes;
   }
    private static Avion toPlanes(ResultSet rs) throws Exception{
       Avion obj= new Avion();
       obj.setPlaca(rs.getString("placa"));
       obj.setModelo(rs.getString("modelo"));
       obj.setMarca(rs.getString("marca"));
       obj.setAnnio(rs.getString("placa"));
       obj.setCant_pasajeros(rs.getInt("cant_pasajeros"));
       obj.setCant_filas(rs.getInt("cant_filas"));
       obj.setcant_asientos_por_fila(rs.getInt("cant_asientos_por_fila"));
       return obj;
    }
    
}
