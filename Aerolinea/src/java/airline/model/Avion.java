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
public class Avion implements Serializable, Jsonable{
    String placa;
    String modelo;
    String marca;
    String annio;
    int cant_pasajeros;
    int cant_filas;
    int cant_asientos_por_fila;

    public Avion(String placa, String modelo, String marca, String annio, int cant_pasajeros, int cant_filas, int cant_asientos_por_fila) {
        this.placa = placa;
        this.modelo = modelo;
        this.marca = marca;
        this.annio = annio;
        this.cant_pasajeros = cant_pasajeros;
        this.cant_filas = cant_filas;
        this.cant_asientos_por_fila = cant_asientos_por_fila;
    }

    public Avion() {
    }

    public String getPlaca() {
        return placa;
    }

    public String getModelo() {
        return modelo;
    }

    public String getMarca() {
        return marca;
    }

    public String getAnnio() {
        return annio;
    }

    public int getCant_pasajeros() {
        return cant_pasajeros;
    }

    public int getCant_filas() {
        return cant_filas;
    }

    public int getCant_cant_asientos_por_fila() {
        return cant_asientos_por_fila;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setAnnio(String annio) {
        this.annio = annio;
    }

    public void setCant_pasajeros(int cant_pasajeros) {
        this.cant_pasajeros = cant_pasajeros;
    }

    public void setCant_filas(int cant_filas) {
        this.cant_filas = cant_filas;
    }

    public void setcant_asientos_por_fila(int cant_asientos_por_fila) {
        this.cant_asientos_por_fila = cant_asientos_por_fila;
    }
    
}
