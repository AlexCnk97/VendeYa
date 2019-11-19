/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Categoria;

import Database.Database;
import Usuario.UsuarioDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author César
 */
public class CategoriaDAO implements CategoriaCRUD {

    private Database database;

    public CategoriaDAO() {
        this.database = new Database();
    }

    @Override
    public Categoria leerCategoria(Categoria categoria) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Categoria> leerCategorias() {
        ArrayList<Categoria> Lista = new ArrayList<>();
        ResultSet rs = null;
        ResultSet rs2 = null; 
        try {
            String sql = "select * from Categorias";
            rs = this.database.excuteQuery(sql);
            while (rs.next()) {
                Lista.add((new Categoria(rs.getInt("idCategoria"), rs.getString("nombre"),rs.getString("img"),rs.getString("Descripcion"))));
            }
            for(int i=0;i<Lista.size();i++){
                String sql2 = "select * from subCategorias a, Categorias b  "
                        + "where b.idCategoria=a.idCategoria and b.idCategoria="
                        +Lista.get(i).getIdCategoria();
                rs2 = this.database.excuteQuery(sql2);
                
                ArrayList<SubCategoria> subArr = new ArrayList<>();
                while (rs2.next()) {
                    
                    SubCategoria sc = new SubCategoria();
                    sc.setIdCat(rs2.getInt("idsubCategoria"));
                    sc.setNom(rs2.getString("nombre"));
                    subArr.add(sc);
                }
                
                Lista.get(i).setSubcategoriaList(subArr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Lista;
    }

    @Override
    public SubCategoria leerSubCategoria(int id) {
        ResultSet rs = null;
        SubCategoria c = new SubCategoria();
        try {
            rs = this.database.excuteQuery("select * from subCategorias where idsubCategoria="+id);
            
            while(rs.next()){
                c.setIdCat(rs.getInt("idsubCategoria"));
                c.setNom(rs.getString("nombre"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
}
