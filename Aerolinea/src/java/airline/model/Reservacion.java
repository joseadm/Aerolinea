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
public class Reservacion implements Jsonable {
    private String codigo;
    private Viaje viaje;
    private Tiquete tiquete;

    public Reservacion(String codigo, Viaje viaje, Tiquete tiquete) {
        this.codigo = codigo;
        this.viaje = viaje;
        this.tiquete = tiquete;
    }  
}
