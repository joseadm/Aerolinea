/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*Dtabase Aerolinea*/
package airline.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AndreyCh
 */
public class Database {
    Connection cnx;
    
    public Database(String servidorArg, String usuarioArg, String claveArg){
        if (servidorArg!=null){
            cnx=this.getConnection(servidorArg, usuarioArg, claveArg);
        }
        else{
            cnx=this.getConnection(null, null, null);            
        }
    }
    public Connection getConnection(String servidorArg, String usuarioArg, String claveArg){
        try {
            String servidor=(servidorArg==null?SERVIDOR:servidorArg);
            String usuario=(usuarioArg==null?USUARIO:usuarioArg);
            String clave=(claveArg==null?CLAVE:claveArg);
            String URL_conexion=PROTOCOLO+"//"+ servidor+":"+PUERTO+"/"+BASEDATOS+"?user="+usuario+"&password="+clave;
            Class.forName(MANEJADOR_DB).newInstance();
            return DriverManager.getConnection(URL_conexion);
        } catch (Exception e) {
            System.err.println("Conexion incorrecta");
            System.exit(-1);
        } 
        return null;
    }
    
     public int executeUpdate(String statement) {
        try {
            Statement stm = cnx.createStatement();
            stm.executeUpdate(statement);
            return stm.getUpdateCount();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public ResultSet executeUpdateWithKeys(String statement) {
        try {
            Statement stm = cnx.createStatement();
            stm.executeUpdate(statement,Statement.RETURN_GENERATED_KEYS);
            return stm.getGeneratedKeys();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet executeQuery(String statement){
        try {
            Statement stm = cnx.createStatement();
            return stm.executeQuery(statement);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    private static final String MANEJADOR_DB = "com.mysql.jdbc.Driver";
    private static final String PROTOCOLO = "jdbc:mysql:";
    private static final String SERVIDOR = "localhost";
    private static final String PUERTO = "3306";
    private static final String USUARIO = "root";
    private static final String CLAVE = "root";
    private static final String BASEDATOS = "BaseAerolinea";
}
