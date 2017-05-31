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
public class Reservacion implements Serializable, Jsonable{
    String codigo;
    Viaje viaje1;
    Viaje viaje2;
    Date fecha_reserva;

    public Reservacion(String codigo, Viaje viaje1, Viaje viaje2, Date fecha_reserva) {
        this.codigo = codigo;
        this.viaje1 = viaje1;
        this.viaje2 = viaje2;
        this.fecha_reserva = fecha_reserva;
    }

    public Reservacion() {
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Viaje getViaje1() {
        return viaje1;
    }

    public void setViaje1(Viaje viaje1) {
        this.viaje1 = viaje1;
    }

    public Viaje getViaje2() {
        return viaje2;
    }

    public void setViaje2(Viaje viaje2) {
        this.viaje2 = viaje2;
    }

    public Date getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(Date fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }


    
}
