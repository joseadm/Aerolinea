/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.util.Date;

/**
 *
 * @author josealonso
 */
public class Vuelo implements Jsonable{
    private int codigo;
    private Ciudad ciudad_origen;
    private Ciudad ciudad_destino;
    private Avion avion;
    private Date fecha;
    private boolean estado;
    private float precio;

    public Vuelo(int codigo, Ciudad ciudad_origen, Ciudad ciudad_destino, Avion avion, Date fecha, boolean estado, float precio) {
        this.codigo = codigo;
        this.ciudad_origen = ciudad_origen;
        this.ciudad_destino = ciudad_destino;
        this.avion = avion;
        this.fecha = fecha;
        this.estado = estado;
        this.precio = precio;
    }
    
    
    
    
}
