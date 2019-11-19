/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Categoria;

/**
 *
 * @author cnk
 */
public class SubCategoria {
    private int idSubCat;
    private String nombre;
    
    public SubCategoria(){
        
    }
    
    public void setIdCat(int id){
        this.idSubCat =  id;
    }
    
    public int getIdCat(){
        return this.idSubCat;
    }
    
    public void setNom(String nom){
        this.nombre = nom;
    }
    
    public String getNom(){
        return this.nombre;
    }
    
}
