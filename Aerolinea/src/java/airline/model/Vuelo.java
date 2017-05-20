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
    Date hora;
    boolean oferta; // si el vuelo esta en oferta lo tira en el carrusel
    String imagen; //Direccion de la imagen

    public Vuelo(int numero_vuelo, Ciudad ciudad_origen, Ciudad ciudad_destino, boolean estado, int precio, String duracion, Date hora, boolean oferta, String imagen) {
        this.numero_vuelo = numero_vuelo;
        this.ciudad_origen = ciudad_origen;
        this.ciudad_destino = ciudad_destino;
        this.estado = estado;
        this.precio = precio;
        this.duracion = duracion;
        this.hora = hora;
        this.oferta = oferta;
        this.imagen = imagen;
    }

    public Vuelo() {
    }

    public int getNumero_vuelo() {
        return numero_vuelo;
    }

    public Date getHora() {
        return hora;
    }

    public boolean isOferta() {
        return oferta;
    }

    public String getImagen() {
        return imagen;
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

    public void setNumero_vuelo(int numero_vuelo) {
        this.numero_vuelo = numero_vuelo;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public void setOferta(boolean oferta) {
        this.oferta = oferta;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
}
