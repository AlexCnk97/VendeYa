/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Publicacion;

import Articulo.Articulo;
import Articulo.ArticuloDAO;
import Cuenta.Cuenta;
import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public class publicarArticulo {
    private Publicacion publicacion;
    private Articulo articulo;
    private Cuenta cuenta;
    private PublicacionDAO posDao;
    private ArticuloDAO articuloDao;
    private ArrayList<String> images;
    private String Directorio;
    
    public publicarArticulo(Publicacion pos){
        this.publicacion = new Publicacion();
        this.publicacion = pos;
        this.articulo = new Articulo();
        this.cuenta = new Cuenta();
        this.images = new ArrayList<>();
        this.articuloDao = new ArticuloDAO();
        this.posDao = new PublicacionDAO();
    }
    
    public void setDirectorio(String dir){
        this.Directorio = dir;
    }
    
    public String getDirectorio(){
        return this.Directorio;
    }
    
    public void setArrayListImages(ArrayList<String> ar){
        this.images = ar;
    }
    
    public void CrearArticulo(){
        Articulo ar = new Articulo(); 
        this.articuloDao.InsertarArticulo(this.publicacion.getArticulo());
        ar = this.articuloDao.LeerArticulo(this.publicacion.getArticulo());
        this.articulo.setIdArticulo(ar.getIdArticulo());
        for(int i=0;i<this.images.size();i++){
            this.articuloDao.insertarArticuloImages(this.articulo.getIdArticulo(), this.images.get(i),this.getDirectorio());
        }
    }
    
    public void CrearPublicacion(){
        this.publicacion.setArticulo(this.articulo);
        this.publicacion.setCuenta(this.publicacion.getCuenta());
        this.posDao.InsertarPublicacion(this.publicacion);
    }
}
