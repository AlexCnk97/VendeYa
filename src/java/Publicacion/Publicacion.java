/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Publicacion;

import Articulo.Articulo;
import Cuenta.Cuenta;

/**
 *
 * @author cnk
 */
public class Publicacion {

 

    /**
     * @param articulo the articulo to set
     */
    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    /**
     * @param cuenta the cuenta to set
     */
    public void setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }

    /**
     * @return the articulo
     */
    public Articulo getArticulo() {
        return this.articulo;
    }

    /**
     * @return the cuenta
     */
    public Cuenta getCuenta() {
        return this.cuenta;
    }

    /**
     * @return the idPublicacion
     */
    public int getIdPublicacion() {
        return this.idPublicacion;
    }

    /**
     * @param idPublicacion the idPublicacion to set
     */
    public void setIdPublicacion(int idPublicacion) {
        this.idPublicacion = idPublicacion;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return this.estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the fecha_pos
     */
    public String getFecha_pos() {
        return this.fecha_pos;
    }

    /**
     * @param fecha_pos the fecha_pos to set
     */
    public void setFecha_pos(String fecha_pos) {
        this.fecha_pos = fecha_pos;
    }

    /**
     * @return the ubicacion
     */
    public String getUbicacion() {
        return this.ubicacion;
    }

    /**
     * @param ubicacion the ubicacion to set
     */
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    private int idPublicacion;
    private Articulo articulo;
    private Cuenta cuenta;
    private String estado;
    private String fecha_pos;
    private String ubicacion;
    
    
    public Publicacion(){
        this.articulo = new Articulo();
        this.cuenta = new Cuenta();
    }
    
}
