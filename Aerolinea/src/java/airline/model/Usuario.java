/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.util.Date;

/**
 *
 * @author AndreyCh
 */
public class Usuario implements Jsonable{
    private String usuario;
    private String contrasena;
    private String nombre;
    private String apellidos;
    private String correo;
    private Date fecha_nac;
    private Direccion direccion;
    private String telefono;
    private String celular;
    private Rol rol;

    public Usuario(String usuario, String contrasena, String nombre, String apellidos, String correo, Date fecha_nac, Direccion direccion, String telefono, String celular, Rol rol) {
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correo = correo;
        this.fecha_nac = fecha_nac;
        this.direccion = direccion;
        this.telefono = telefono;
        this.celular = celular;
        this.rol = rol;
    }  
}
