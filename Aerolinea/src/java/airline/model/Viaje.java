/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;
import java.io.Serializable;
import java.util.Date;
/**
 *
 * @author AndreyCh
 */
public class Viaje implements Serializable, Jsonable{
    int numero_viaje;
    Date fecha;
    Avion avion;
    Vuelo vuelo;
    int horaLlegada;

    public Viaje(int numero_viaje, Date fecha, Avion avion, Vuelo vuelo, int horaLlegada) {
        this.numero_viaje = numero_viaje;
        this.fecha = fecha;
        this.avion = avion;
        this.vuelo = vuelo;
        this.horaLlegada = horaLlegada;
    }

    public Viaje() {
    }

    public int getNumero_viaje() {
        return numero_viaje;
    }

    public void setNumero_viaje(int numero_viaje) {
        this.numero_viaje = numero_viaje;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public int getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(int horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

   
}
