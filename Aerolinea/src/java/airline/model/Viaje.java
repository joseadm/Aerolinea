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
public class Viaje implements Jsonable{
    private int numero_viaje;
    private Avion avion;
    private Vuelo vuelo;

    public Viaje(int numero_viaje, Avion avion, Vuelo vuelo) {
        this.numero_viaje = numero_viaje;
        this.avion = avion;
        this.vuelo = vuelo;
    }
}
