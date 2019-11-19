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
public interface CategoriaCRUD {

    Categoria leerCategoria(Categoria categoria);

    ArrayList<Categoria> leerCategorias();
    
    SubCategoria leerSubCategoria(int id);
}
