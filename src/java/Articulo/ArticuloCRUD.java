/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Articulo;

import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public interface ArticuloCRUD {
    public Articulo LeerArticulo(Articulo articulo);
    public Articulo LeerArticulo(int id);
    public ArrayList<Articulo> LeerArticulos();
    public void ActualizarArticulo(Articulo articulo);
    public void InsertarArticulo(Articulo articulo);
    public void insertarArticuloImages(int id,String imagen,String dir);
    public ArrayList<Articulo> SearchArticulo(String nombre);
    
}
