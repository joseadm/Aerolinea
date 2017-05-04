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
public class Rol implements Jsonable{
    private String codigo;
    private String descripcion;

    public Rol(String codigo, String descripcion) {
        this.codigo = codigo;
        this.descripcion = descripcion;
    }    
    
}
