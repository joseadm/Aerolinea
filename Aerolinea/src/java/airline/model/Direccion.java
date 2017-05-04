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
public class Direccion implements Jsonable{
    private double latitud;
    private double longitud;

    public Direccion(double latitud, double longitud) {
        this.latitud = latitud;
        this.longitud = longitud;
    }
   
}
