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
    
    static {
        initCiudades();
    }
    private static void initCiudades(){
       ciudades= new Database(null, null, "root");        
    }
    
     public static List<Ciudad> selectAllCities() throws Exception{
       List<Ciudad> cities;
       cities= new ArrayList();
        try {
            String sql="select * "+
                    "from ciudad   ";
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
}
