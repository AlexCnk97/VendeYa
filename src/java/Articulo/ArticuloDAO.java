/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Articulo;

import Categoria.CategoriaDAO;
import Categoria.SubCategoria;
import Database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cnk
 */
public class ArticuloDAO implements ArticuloCRUD {

    private Database database;

    public ArticuloDAO() {
        this.database = new Database();
    }

    @Override
    public Articulo LeerArticulo(Articulo articulo) {
        ResultSet rs = null;
        CategoriaDAO ctD = new CategoriaDAO();
        Articulo ar = new Articulo();

        try {
            rs = this.database.excuteQuery("select * from Productos where nombre='" + articulo.getNombre() + "' and precio=" + articulo.getPrecio());
            while (rs.next()) {
                ar.setIdArticulo(rs.getInt("idProducto"));
                ar.setNombre(rs.getString("nombre"));
                ar.setPrecio(rs.getInt("precio"));
                SubCategoria sb = ctD.leerSubCategoria(rs.getInt("idsubCategoria"));
                ar.setSubCategoria(sb);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    @Override
    public ArrayList<Articulo> LeerArticulos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void ActualizarArticulo(Articulo articulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void InsertarArticulo(Articulo articulo) {
        try {
            this.database.excuteUpdate("insert into Productos(nombre,precio,idSubCategoria,descripcion) values "
                    + "('" + articulo.getNombre() + "', " + articulo.getPrecio() + ","
                    + "" + articulo.getSubCategoria().getIdCat() + ",'" + articulo.getDescripcion() + "');");

        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insertarArticuloImages(int id, String imagen, String dir) {
        try {
            this.database.excuteUpdate("insert into Productos_Imagenes(idProducto,Imagen,directorio) values"
                    + "(" + id + ",'" + imagen + "','" + dir + "')");

        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Articulo LeerArticulo(int id) {
        ResultSet rs = null;
        ResultSet rs2 = null;
        CategoriaDAO ctD = new CategoriaDAO();
        Articulo ar = new Articulo();
        ArrayList<String> images = new ArrayList<>();

        try {
            rs = this.database.excuteQuery("select * from Productos where idProducto=" + id);
            while (rs.next()) {
                ar.setIdArticulo(rs.getInt("idProducto"));
                ar.setNombre(rs.getString("nombre"));
                ar.setPrecio(rs.getInt("precio"));
                SubCategoria sb = ctD.leerSubCategoria(rs.getInt("idsubCategoria"));
                ar.setDescripcion(rs.getString("Descripcion"));
                ar.setSubCategoria(sb);

            }

            rs2 = this.database.excuteQuery("select * from Productos_Imagenes where idProducto=" + ar.getIdArticulo());

            while (rs2.next()) {
                images.add(rs2.getString("Imagen"));
            }

            ar.setImagesList(images);
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    @Override
    public ArrayList<Articulo> SearchArticulo(String nombre) {
        ArrayList<Articulo> list = new ArrayList<Articulo>();
        ResultSet rs = null;
        String sql = "select \n"
                + "a.idProducto,\n"
                + "a.nombre,\n"
                + "a.precio,\n"
                + "b.Imagen\n"
                + "from productos a,\n"
                + "productos_imagenes b\n"
                + "where (a.idProducto = b.idProducto) and a.nombre like '%" + nombre + "%'\n"
                + "group by a.idProducto;";

        try {
            rs = this.database.excuteQuery(sql);
            while (rs.next()) {
                Articulo articulo = new Articulo();
                articulo.setIdArticulo(rs.getInt("a.idProducto"));
                articulo.setNombre(rs.getString("a.nombre"));
                articulo.setPrecio(rs.getDouble("a.precio"));
                ArrayList<String> images = new ArrayList<>();
                images.add(rs.getString("b.Imagen"));
                articulo.setImagesList(images);
                list.add(articulo);
            }
        } catch (Exception e) {

        }

        return list;
    }

}
