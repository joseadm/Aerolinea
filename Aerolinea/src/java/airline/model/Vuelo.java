/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.util.Date;
import java.io.Serializable;

/**
 *
 * @author josealonso
 */
public class Vuelo implements Serializable, Jsonable{
    int numero_vuelo;
    Ciudad ciudad_origen;
    Ciudad ciudad_destino;
    boolean estado;
    int precio;
    String duracion;

    public Vuelo(int numero_vuelo, Ciudad ciudad_origen, Ciudad ciudad_destino, boolean estado, int precio, String duracion) {
        this.numero_vuelo = numero_vuelo;
        this.ciudad_origen = ciudad_origen;
        this.ciudad_destino = ciudad_destino;
        this.estado = estado;
        this.precio = precio;
        this.duracion = duracion;
    }

    public Vuelo() {
    }

    public int getCodigo() {
        return numero_vuelo;
    }

    public Ciudad getCiudad_origen() {
        return ciudad_origen;
    }

    public Ciudad getCiudad_destino() {
        return ciudad_destino;
    }
 
    public boolean isEstado() {
        return estado;
    }

    public int getPrecio() {
        return precio;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setCodigo(int numero_vuelo) {
        this.numero_vuelo = numero_vuelo;
    }

    public void setCiudad_origen(Ciudad ciudad_origen) {
        this.ciudad_origen = ciudad_origen;
    }

    public void setCiudad_destino(Ciudad ciudad_destino) {
        this.ciudad_destino = ciudad_destino;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }  
}
