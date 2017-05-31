/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;
import java.io.Serializable;
/**
 *
 * @author AndreyCh
 */
public class Tiquete implements Serializable, Jsonable{
    int codigo;
    Usuario usuario;
    String nombre_pasajero;
    String apellidos_pasajero;
    String pasaporte_pasajero;
    Reservacion codigo_reservacion;
    Asiento codigo_asiento;

    public Tiquete(int codigo, Usuario usuario, String nombre_pasajero, String apellidos_pasajero, String pasaporte_pasajero, Reservacion codigo_reservacion, Asiento codigo_asiento) {
        this.codigo = codigo;
        this.usuario = usuario;
        this.nombre_pasajero = nombre_pasajero;
        this.apellidos_pasajero = apellidos_pasajero;
        this.pasaporte_pasajero = pasaporte_pasajero;
        this.codigo_reservacion = codigo_reservacion;
        this.codigo_asiento = codigo_asiento;
    }

    
    public Tiquete() {
    }

    public int getCodigo() {
        return codigo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public String getNombre_pasajero() {
        return nombre_pasajero;
    }

    public String getApellidos_pasajero() {
        return apellidos_pasajero;
    }

    public String getPasaporte_pasajero() {
        return pasaporte_pasajero;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public void setNombre_pasajero(String nombre_pasajero) {
        this.nombre_pasajero = nombre_pasajero;
    }

    public void setApellidos_pasajero(String apellidos_pasajero) {
        this.apellidos_pasajero = apellidos_pasajero;
    }

    public void setPasaporte_pasajero(String pasaporte_pasajero) {
        this.pasaporte_pasajero = pasaporte_pasajero;
    }

    public Reservacion getCodigo_reservacion() {
        return codigo_reservacion;
    }

    public void setCodigo_reservacion(Reservacion codigo_reservacion) {
        this.codigo_reservacion = codigo_reservacion;
    }

    public Asiento getCodigo_asiento() {
        return codigo_asiento;
    }

    public void setCodigo_asiento(Asiento codigo_asiento) {
        this.codigo_asiento = codigo_asiento;
    }
      
}
