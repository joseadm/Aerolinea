/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

/**
 *
 * @author josealonso
 */
public class Ciudad implements Jsonable {
    public String codigo;
    public String nombre;
    private String pais;

    public Ciudad(String codigo, String nombre, String pais) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.pais = pais;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return codigo + nombre + pais;
    }
    
    
}
