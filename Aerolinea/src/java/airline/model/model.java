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
import java.util.Date;
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
    static Database asientos;
    
    static {
        initCiudades();
        initVuelos();
        initViajes();
        initAviones();
        initUsuarios();
        initAsientos();
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
     private static void initAsientos(){
       asientos= new Database(null, null, null);        
    }
    /*--------------------------------Ciudades-----------------------------------------*/
     public static List<Ciudad> selectAllCities() throws Exception{
       List<Ciudad> cities;
       cities= new ArrayList();
        try {
            String sql="select * from Ciudad ";
            ResultSet rs =  ciudades.executeQuery(sql);
            while (rs.next()) {
                cities.add(toCiudad(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de ciudades");
        }
       return cities;
   }
     public static Ciudad selectCity(String codigo) throws Exception{
       Ciudad c1 = new Ciudad();
        try {
            String sql="select * from Ciudad c where c.codigo='"+codigo+"'";
            ResultSet rs =  ciudades.executeQuery(sql);
            while (rs.next()) {
                c1= toCiudad(rs);
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de ciudades");
        }
       return c1;
   }
    private static Ciudad toCiudad(ResultSet rs) throws Exception{
       try{
       Ciudad obj= new Ciudad();
       obj.setCodigo(rs.getString("codigo"));
       obj.setNombre(rs.getString("nombre"));
       obj.setPais(rs.getString("pais"));
       return obj;
       }catch(SQLException ex){
            return null;
        }
    }
    /*-----------------------------------------------------------------------------*/
    /*-------------------------------------------Vuelos-----------------------*/
     //EL SIGUIENTE METODO agrega un vuelo
        public static int VueloAdd(Vuelo p) throws Exception{
        String sql="insert into Vuelo (ciudadOrigen, ciudadDestino, estado,precio,"
                + "duracion,hora,oferta,imagen,dia,descuento) "+
                "values('%s','%s',%b,%s,'%s','%s',%b,'%s','%s',%s)"; 
        sql=String.format(sql,p.getCiudad_origen().getCodigo(),p.getCiudad_destino().getCodigo(),
                    p.isEstado(),p.getPrecio(),p.getDuracion(),p.getHora(),
                p.isOferta(),p.getImagen(),p.getDia(),p.getDescuento());
        ResultSet rs = vuelos.executeUpdateWithKeys(sql);
        if (rs.next()) {
                return rs.getInt(1);
            }
            else{
                return 0;
            }
    }
    public static Viaje selectTravel(int numero) throws Exception{
       Viaje v1 = new Viaje();
        try {
            String sql="select * from Viaje v where v.numeroviaje="+numero+"";
            ResultSet rs =  viajes.executeQuery(sql);
            while (rs.next()) {
                v1= toTravels(rs);
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de Viajes");
        }
       return v1;
   }
 
    public static List<Vuelo> selectAllFlights() throws Exception{
       List<Vuelo> flights;
       flights= new ArrayList();
        try {
            String sql="select * from Vuelo v inner join Ciudad c1 on v.ciudadOrigen = c1.codigo "
                    + "inner join Ciudad c2 on v.ciudadDestino = c2.codigo";
            ResultSet rs =  vuelos.executeQuery(sql);
            while (rs.next()) {
                flights.add(toFlights(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No exiten registros de Vuelos");
        }
       return flights;
   }
   public static List<Vuelo> selectAllFlightsPromo() throws Exception{
       List<Vuelo> flights;
       flights= new ArrayList();
        try {
            String sql="select * from Vuelo v inner join Ciudad c1 on v.ciudadOrigen = c1.codigo "
                    + "inner join Ciudad c2 on v.ciudadDestino = c2.codigo where v.oferta = true";
            ResultSet rs =  vuelos.executeQuery(sql);
            while (rs.next()) {
                flights.add(toFlights(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen Vuelos en promocion");
        }
       return flights;
   }
    private static Vuelo toFlights(ResultSet rs) throws Exception{
       try {
        Vuelo obj= new Vuelo();
       obj.setNumero_vuelo(rs.getInt("numeroVuelo"));
       Ciudad ciudad1= new Ciudad();
       ciudad1.setCodigo(rs.getString("ciudadOrigen"));
       ciudad1 = selectCity(ciudad1.getCodigo());
       obj.setCiudad_origen(ciudad1);
       Ciudad ciudad2= new Ciudad();
       ciudad2.setCodigo(rs.getString("ciudadDestino"));
       ciudad2 = selectCity(ciudad2.getCodigo());
       obj.setCiudad_destino(ciudad2);
       obj.setEstado(rs.getBoolean("estado"));
       obj.setPrecio(rs.getInt("precio"));
       obj.setDuracion(rs.getString("duracion"));
       obj.setHora(rs.getString("hora"));
       obj.setOferta(rs.getBoolean("oferta"));
       obj.setImagen(rs.getString("imagen"));
       obj.setDia(rs.getString("dia"));
       obj.setDescuento(rs.getInt("descuento"));
       return obj;
       } catch(SQLException ex) {
            return null;
       }
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
        int numeroAsiento =1;
        Asiento spot;
        for(int i=0 ; i < p.getAvion().getCant_filas(); i++){
            for(int j=0; j < p.getAvion().getCant_cant_asientos_por_fila(); j++){
                spot = new Asiento(numeroAsiento,true,p);
                numeroAsiento++;
                AsientoAdd(spot);
            }
        }
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
            String sql="select * from Viaje vi inner join Avion a on vi.placa_avion = a.placa inner join"
                    + " Vuelo vu on vi.numero_vuelo = vu.numeroVuelo inner join  Ciudad c1 on "
                    + "vu.ciudadOrigen = c1.codigo inner join Ciudad c2 on vu.ciudadDestino = c2.codigo";
            ResultSet rs =  viajes.executeQuery(sql);
            while (rs.next()) {
                travels.add(toTravels(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de Viajes");
        }
       return travels;
   }
   public static List<Viaje> searchTravels(String origen,String destino,String dia,String fecha) throws Exception{
       List<Viaje> travels;
       travels = new ArrayList();
        try {
            String sql="select * from Viaje vi inner join Avion a on vi.placa_avion = a.placa inner join"
                    + " Vuelo vu on vi.numero_vuelo = vu.numeroVuelo "
                    + "inner join Ciudad c1 on vu.ciudadOrigen = c1.codigo "
                    + "inner join Ciudad c2 on vu.ciudadDestino = c2.codigo where c1.nombre='"
                    + origen+"' and c2.nombre='"+destino+"' and vu.dia='"+dia+"' and vi.fecha='"+fecha+"'";
            ResultSet rs =  viajes.executeQuery(sql);
            while (rs.next()) {
                travels.add(toTravels(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de Viajes");
        }
       return travels;
   }
    private static Viaje toTravels(ResultSet rs) throws Exception{
       try{
        Viaje obj= new Viaje();
       obj.setNumero_viaje(rs.getInt("numeroviaje"));
       obj.setFecha(rs.getDate("fecha"));
       obj.setAvion(toPlanes(rs));
       obj.setVuelo(toFlights(rs));
       return obj;
       } catch(SQLException ex) {
            return null;
       }
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
     
//      public static int insertViaje(Viaje viaje) throws Exception{ // hay un metodo viajeAdd
//    //  return 1;
//
//            String sql="insert into Viaje "+
//                    "(fecha, placa_avion, numero_vuelo) "+
//                    "values ('%s','%s',%s)";
//            sql=String.format(sql,viaje.getFecha(),
//                    viaje.getAvion(),
//                    viaje.getVuelo());
//            ResultSet rs =  viajes.executeUpdateWithKeys(sql);
//            if (rs.next()) {
//                return rs.getInt(1);
//            }
//            else{
//                return 0;
//            }
//    }
      
//      public static int insertVuelo(Vuelo vuelo) throws Exception{ //hay un metodo vueloAdd
//    //  return 1;
//
//            String sql="insert into Vuelo "+
//                    "(ciudad_origen, ciudad_destino, estado, precio, duracion, hora, oferta, imagen,descuento) "+
//                    "values ('%s','%s','%s')";
//            sql=String.format(sql,vuelo.getCiudad_origen().getCodigo(),
//                    vuelo.getCiudad_destino().getCodigo(),
//                    vuelo.isEstado(),
//                    vuelo.getPrecio(),
//                    vuelo.getDuracion(),
//                    vuelo.getHora(),
//                    vuelo.isOferta(),
//                    vuelo.getImagen(),
//                    vuelo.getDescuento()
//            );
//            ResultSet rs =  vuelos.executeUpdateWithKeys(sql);
//            if (rs.next()) {
//                return rs.getInt(1);
//            }
//            else{
//                return 0;
//            }
//    }
     
    public static List<Avion> selectAllPlanes() throws Exception{
       List<Avion> planes;
       planes = new ArrayList();
        try {
            String sql="select * from Avion";
            ResultSet rs =  aviones.executeQuery(sql);
            while (rs.next()) {
                planes.add(toPlanes(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de Aviones");
        }
       return planes;
   }
    
    
   

    private static Avion toPlanes(ResultSet rs) throws Exception{
       try{
        Avion obj= new Avion();
       obj.setPlaca(rs.getString("placa"));
       obj.setModelo(rs.getString("modelo"));
       obj.setMarca(rs.getString("marca"));
       obj.setAnnio(rs.getString("annio"));
       obj.setCant_pasajeros(rs.getInt("cant_pasajeros"));
       obj.setCant_filas(rs.getInt("cant_filas"));
       obj.setcant_asientos_por_fila(rs.getInt("cant_asientos_por_fila"));
       return obj;
       } catch(SQLException ex) {
            return null;
       }
    }
    //--------------USUARIO------------------------------------
    public static List<Usuario> selectAllUsers() throws Exception{
       List<Usuario> users;
       users = new ArrayList();
        try {
            String sql="select * from Usuario";
            ResultSet rs =  usuarios.executeQuery(sql);
            while (rs.next()) {
                users.add(toUsers(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de usuarios");
        }
       return users;
   }
    public static Usuario userLogin(Usuario usuario) throws Exception{
        try {
            String sql="select * from "+
                    "Usuario  u  "+
                    "where u.nombreUsuario = '%s' and u.contrasena='%s'";
            sql=String.format(sql,usuario.usuario,usuario.contrasena);
            
            ResultSet rs =  usuarios.executeQuery(sql);
            if (rs.next()) {
                return toUsers(rs);
            }
            else{
                return new Usuario(usuario.usuario,usuario.contrasena,"","","",new Date(),"",0,0,0);
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de usuarios");
        }
   }
     private static Usuario toUsers(ResultSet rs) throws Exception{
      try{
       Usuario obj= new Usuario();
       obj.setUsuario(rs.getString("nombreUsuario"));
       obj.setContrasena(rs.getString("contrasena"));
       obj.setNombre(rs.getString("nombre"));
       obj.setApellidos(rs.getString("apellidos"));
       obj.setCorreo(rs.getString("correo"));
       obj.setFecha_nac(rs.getDate("fechaNacimiento"));
       obj.setDireccion(rs.getString("direccion"));
       obj.setTelefono(rs.getInt("telefono"));
       obj.setCelular(rs.getInt("celular"));
       obj.setTipo(rs.getInt("tipo"));
       return obj;
       } catch(SQLException ex) {
            return null;
       }
    }
     public static void insertUsuario(Usuario usuario) throws Exception{
    //  return 1;

            String sql="insert into Usuario "+
                    "(nombreUsuario, contrasena, nombre, apellidos, correo, fechaNacimiento,"
                    + " direccion, telefono, celular, tipo) "+
                    "values ('%s','%s','%s','%s','%s','%s','%s',%s,%s,%s)";
            sql=String.format(sql,usuario.getUsuario(),
                    usuario.getContrasena(), 
                    usuario.getNombre(),
                    usuario.getApellidos(),
                    usuario.getCorreo(),
                    new SimpleDateFormat("yyyy-MM-dd").format(usuario.getFecha_nac()),
                    usuario.getDireccion(),
                    usuario.getTelefono(),
                    usuario.getCelular(),
                    usuario.getTipo());
                    int count=usuarios.executeUpdate(sql);
                    if (count==0){
                     throw new Exception("Usuario ya existente");
                    } 
    }
    public static boolean usuarioExiste(String nombreUsuario) throws Exception{
       List<Usuario> users;
       users = new ArrayList();
        try {
            String sql="select * from Usuario where nombreUsuario =" +nombreUsuario;
            ResultSet rs =  usuarios.executeQuery(sql);
            while (rs.next()) {
                users.add(toUsers(rs));
            }
        } catch (SQLException ex) {
            throw new Exception("No existen registros de Viajes");
        }
       if(users != null)
           return true; //usuario ya existe
       return false;
   }
     //ASientos----------------------------------------------------------------------
      private static Asiento toSits(ResultSet rs) throws Exception{
      try{
       Asiento obj= new Asiento();
       obj.setNumero(rs.getInt("numero"));
       obj.setEstado(rs.getBoolean("estado"));
       obj.setViaje(toTravels(rs));
       return obj;
       } catch(SQLException ex) {
            return null;
       }
    }
    public static int AsientoAdd(Asiento p) throws Exception{
    String sql="insert into Asiento (numero, estado, numero_viaje) "+
            "values('%s','%s','%s')"; 
    sql=String.format(sql,p.getNumero(),p.isEstado(),p.getViaje().getNumero_viaje());
    ResultSet rs = asientos.executeUpdateWithKeys(sql);
    if (rs.next()) {
            return rs.getInt(1);
        }
        else{
            return 0;
        }
}
    //----------------Delete ----------------------------------
    public static int deleteCiudad(String codigo) throws Exception{
            String sql="delete from Ciudad where codigo="+codigo+"";
            ResultSet rs =  viajes.executeQuery(sql);
            if (rs.next()) {
            return rs.getInt(1);
        }
        else{
            return 0;
        }
   }
    public static int deleteAvion(String placa) throws Exception{
            String sql="delete from Avion where placa="+placa+"";
            ResultSet rs =  viajes.executeQuery(sql);
            if (rs.next()) {
            return rs.getInt(1);
        }
        else{
            return 0;
        }
   }
    public static int deleteViaje(String numero_viaje) throws Exception{
            String sql="delete from Viaje where numero_viaje="+numero_viaje+"";
            ResultSet rs =  viajes.executeQuery(sql);
            if (rs.next()) {
            return rs.getInt(1);
        }
        else{
            return 0;
        }
   }
    public static int deleteVuelo(String numero_vuelo) throws Exception{
            String sql="delete from Vuelo where numero_vuelo="+numero_vuelo+"";
            ResultSet rs =  viajes.executeQuery(sql);
            if (rs.next()) {
            return rs.getInt(1);
        }
        else{
            return 0;
        }
   }
}
