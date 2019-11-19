/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Publicacion;

import Articulo.Articulo;
import Articulo.ArticuloDAO;
import Categoria.CategoriaDAO;
import Categoria.SubCategoria;
import Cuenta.Cuenta;
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
public class PublicacionDAO implements PublicacionCRUD {

    private Database database;

    public PublicacionDAO() {
        this.database = new Database();
    }

    @Override
    public void InsertarPublicacion(Publicacion pos) {
        System.out.print(pos.getArticulo().getNombre());
        int idArt = pos.getArticulo().getIdArticulo();
        int idCue = pos.getCuenta().getIdCuenta();
        String lo = pos.getUbicacion();
        try {
            //Vendido = true
            this.database.excuteUpdate("insert into Publicaciones(idProducto,idCuenta,fec_Post,estado,ubicacion)"
                    + "values(" + idArt + "," + idCue + ",NOW(),true,'" + pos.getUbicacion() + "');");
        } catch (SQLException ex) {
            Logger.getLogger(PublicacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Publicacion LeerPublicacion(int id) {
        Publicacion pub = new Publicacion();
        ResultSet rs = null;
        Articulo articulo = new Articulo();
        Cuenta cuenta = new Cuenta();
        try {
            rs = this.database.excuteQuery("select * from Publicaciones where idProducto=" + id);
            while (rs.next()) {
                pub.setIdPublicacion(rs.getInt("idPublicacion"));
                cuenta.setIdCuenta(rs.getInt("idCuenta"));
                pub.setCuenta(cuenta);
                pub.setFecha_pos(rs.getString("fec_Post"));
                pub.setUbicacion(rs.getString("ubicacion"));
                articulo.setIdArticulo(id);
                pub.setArticulo(articulo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pub;
    }

}
