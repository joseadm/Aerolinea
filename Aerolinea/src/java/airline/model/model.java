/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import airline.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
    static Database usuarios;
    
    static {
        initCiudades();
        initVuelos();
        initViajes();
        initAviones();
        initUsuarios();
    }
    
    private static void initCiudades(){
       ciudades= new Database(null, null, null);        
    }
    private static void initVuelos(){
       vuelos= new Database(null, null, null);        
    }
    private static void initViajes(){
       viajes= new Database(null, null, null);        
    }
    private static void initAviones(){
       aviones= new Database(null, null, null);        
    }
    private static void initUsuarios(){
       usuarios= new Database(null, null, null);        
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
     //EL SIGUIENTE METODO agrega un vuelo
        public static int VueloAdd(Vuelo p) throws Exception{
        String sql="insert into Vuelo (ciudadOrigen, ciudadDestino, estado,precio,"
                + "duracion,hora,oferta,imagen) "+
                "values('%s','%s',%b,%s,'%s','%s',%b,'%s')"; 
        sql=String.format(sql,p.getCiudad_origen().getCodigo(),p.getCiudad_destino().getCodigo(),
                p.isEstado(),p.getPrecio(),p.getDuracion(), new SimpleDateFormat("yyyy-MM-dd").format(p.getHora()),
                p.isOferta(),p.getImagen());
        ResultSet rs = vuelos.executeUpdateWithKeys(sql);
        if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
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
       try {
       obj.setCiudad_origen(toCiudad(rs));
       obj.setCiudad_destino(toCiudad(rs)); //REVISAR SI ES ASI
       } catch(Exception e) {
            System.out.println("Its not working");
       }
       obj.setEstado(rs.getBoolean("estado"));
       obj.setPrecio(rs.getInt("precio"));
       obj.setDuracion(rs.getString("duracion"));
       obj.setHora(rs.getDate("hora"));
       obj.setOferta(rs.getBoolean("oferta"));
       obj.setImagen(rs.getString("imagen"));
       return obj;
    }
    /*-----------------------------------------------------------------------------*/
    /*----------------------------------------Viaje---------------------------------*/
    //EL SIGUIENTE METODO agrega un vuelo
        public static int ViajeAdd(Viaje p) throws Exception{
        String sql="insert into Viaje (fecha, placa_avion, numero_vuelo) "+
                "values('%s','%s',%s)"; 
        sql=String.format(sql,new SimpleDateFormat("yyyy-MM-dd").format(p.getFecha()),p.getAvion().getPlaca(),
                p.getVuelo().getNumero_vuelo());
        ResultSet rs = viajes.executeUpdateWithKeys(sql);
        if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
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
     //EL SIGUIENTE METODO agrega un avion
     public static int insertAvion(Avion avion) throws Exception{
    //  return 1;

            String sql="insert into Avion "+
                    "(placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) "+
                    "values ('%s','%s','%s','%s','%s','%s','%s')";
            sql=String.format(sql,avion.getPlaca(),
                    avion.getModelo(),
                    avion.getMarca(),
                    avion.getAnnio(),
                    avion.getCant_pasajeros(),
                    avion.getCant_filas(),
                    avion.getCant_cant_asientos_por_fila());
            ResultSet rs =  aviones.executeUpdateWithKeys(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
     
     public static int insertCiudad(Ciudad ciudad) throws Exception{
    //  return 1;

            String sql="insert into Ciudad "+
                    "(codigo, pais, nombre) "+
                    "values ('%s','%s','%s')";
            sql=String.format(sql,ciudad.getCodigo(),
                    ciudad.getPais(),
                    ciudad.getNombre());
            ResultSet rs =  ciudades.executeUpdateWithKeys(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
     
      public static int insertViaje(Viaje viaje) throws Exception{
    //  return 1;

            String sql="insert into Viaje "+
                    "(fecha, placa_avion, numero_vuelo) "+
                    "values ('%s','%s','%s')";
            sql=String.format(sql,viaje.getFecha(),
                    viaje.getAvion(),
                    viaje.getVuelo());
            ResultSet rs =  viajes.executeUpdateWithKeys(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
      
      public static int insertVuelo(Vuelo vuelo) throws Exception{
    //  return 1;

            String sql="insert into Vuelo "+
                    "(ciudad_origen, ciudad_destino, estado, precio, duracion, hora, oferta, imagen) "+
                    "values ('%s','%s','%s')";
            sql=String.format(sql,vuelo.getCiudad_origen(),
                    vuelo.getCiudad_origen(),
                    vuelo.getCiudad_destino(),
                    vuelo.isEstado(),
                    vuelo.getPrecio(),
                    vuelo.getDuracion(),
                    vuelo.getHora(),
                    vuelo.isOferta(),
                    vuelo.getImagen());
            ResultSet rs =  vuelos.executeUpdateWithKeys(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
     
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
    //--------------USUARIO------------------------------------
     public static int insertUsuario(Usuario usuario) throws Exception{
    //  return 1;

            String sql="insert into Usuario "+
                    "(nombreUsuario, contrasena, nombre, apellidos, correo, fechaNacimiento,"
                    + " direccion, telefono, cedula, tipo) "+
                    "values ('%s','%s','%s','%s','%s','%s','%s',%s,%s,%s)";
            sql=String.format(sql,usuario.getUsuario(),
                    usuario.getContrasena(), 
                    usuario.getNombre(),
                    usuario.getApellidos(),
                    usuario.getCorreo(),
                    usuario.getFecha_nac(),
                    usuario.getDireccion(),
                    usuario.getTelefono(),
                    usuario.getCelular(),
                    usuario.getTipo());
            ResultSet rs =  usuarios.executeUpdateWithKeys(sql);
            if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
}
