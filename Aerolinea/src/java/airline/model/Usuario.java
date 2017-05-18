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
 * @author AndreyCh
 */
public class Usuario implements Serializable, Jsonable{
    String usuario;
    String contrasena;
    String nombre;
    String apellidos;
    String correo;
    Date fecha_nac;
    String direccion;
    String telefono;
    String celular;
    int tipo;

    public Usuario(String usuario, String contrasena, String nombre, String apellidos, String correo, Date fecha_nac, String direccion, String telefono, String celular, int tipo) {
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correo = correo;
        this.fecha_nac = fecha_nac;
        this.direccion = direccion;
        this.telefono = telefono;
        this.celular = celular;
        this.tipo = tipo;
    }

    public Usuario() {
    }

    public String getUsuario() {
        return usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCelular() {
        return celular;
    }

    public int getTipo() {
        return tipo;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
