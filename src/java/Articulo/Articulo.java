/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Articulo;

import Categoria.SubCategoria;
import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public class Articulo {
    
    
       /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return Descripcion;
    }

    /**
     * @param Descripcion the Descripcion to set
     */
    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    /**
     * @return the idArticulo
     */
    public int getIdArticulo() {
        return this.idArticulo;
    }

    /**
     * @param idArticulo the idArticulo to set
     */
    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return this.nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the precio
     */
    public double getPrecio() {
        return this.precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * @return the subCategoria
     */
    public SubCategoria getSubCategoria() {
        return this.subCategoria;
    }

    /**
     * @param subCategoria the subCategoria to set
     */
    public void setSubCategoria(SubCategoria subCategoria) {
        this.subCategoria = subCategoria;
    }

    /**
     * @return the imagesList
     */
    public ArrayList<String> getImagesList() {
        return this.imagesList;
    }

    /**
     * @param imagesList the imagesList to set
     */
    public void setImagesList(ArrayList<String> image) {
        this.imagesList = image;
    }
    private int idArticulo;
    private String nombre;
    private double precio;
    private SubCategoria subCategoria;
    private ArrayList<String> imagesList;
    private String Descripcion;
    
    public Articulo(){
        this.imagesList = new ArrayList<>();
        this.subCategoria = new SubCategoria();
        
    }
}
