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
public class Avion implements Jsonable{
    private String codigo;
    private String marca;
    private String modelo;
    private String annio;
    private int cant_pasajeros;
    private int cant_filas;
    private int cant_asientos;

    public Avion(String codigo, String marca, String modelo, String annio, int cant_pasajeros, int cant_filas, int cant_asientos) {
        this.codigo = codigo;
        this.marca = marca;
        this.modelo = modelo;
        this.annio = annio;
        this.cant_pasajeros = cant_pasajeros;
        this.cant_filas = cant_filas;
        this.cant_asientos = cant_asientos;
    }

 
    
}
