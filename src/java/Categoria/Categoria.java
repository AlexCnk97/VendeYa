/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Categoria;

import java.util.ArrayList;

/**
 *
 * @author César
 */
public class Categoria {

    /**
     * @return the SubcategoriaList
     */
    public ArrayList<SubCategoria> getSubcategoriaList() {
        return SubcategoriaList;
    }

    /**
     * @param SubcategoriaList the SubcategoriaList to set
     */
    public void setSubcategoriaList(ArrayList<SubCategoria> SubcategoriaList) {
        this.SubcategoriaList = SubcategoriaList;
    }

    private int idCategoria;
    private String Nombre;
    private String Img;
    private String Descripcion;
    private ArrayList<SubCategoria> SubcategoriaList;

    public Categoria(int idCategoria, String Nombre, String Img, String Descripcion) {
        this.idCategoria = idCategoria;
        this.Nombre = Nombre;
        this.Img = Img;
        this.Descripcion = Descripcion;
    }
    
    
    
    
    /**
     * @return the idCategoria
     */
    public int getIdCategoria() {
        return idCategoria;
    }

    /**
     * @param idCategoria the idCategoria to set
     */
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Img
     */
    public String getImg() {
        return Img;
    }

    /**
     * @param Img the Img to set
     */
    public void setImg(String Img) {
        this.Img = Img;
    }

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

}
