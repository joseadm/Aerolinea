/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

/**
 *
 * @author AndreyCh
 */
public class Tiquete implements Jsonable{
    private String codigo;
    private Usuario usuario;
    private String nombre_pasajero;
    private String apellidos_pasajero;
    private String pasaporte_pasajero;

    public Tiquete(String codigo, Usuario usuario, String nombre_pasajero, String apellidos_pasajero, String pasaporte_pasajero) {
        this.codigo = codigo;
        this.usuario = usuario;
        this.nombre_pasajero = nombre_pasajero;
        this.apellidos_pasajero = apellidos_pasajero;
        this.pasaporte_pasajero = pasaporte_pasajero;
    } 
}
