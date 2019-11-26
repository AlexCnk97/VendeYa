/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cuenta;

import Articulo.ArticuloDAO;

import Database.Database;
import Publicacion.Publicacion;
import Usuario.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cnk
 */
public class CuentaDAO implements CuentaCRUD {

    private Database database;

    public CuentaDAO() {
        this.database = new Database();
    }

    @Override
    public void CrearCuenta(Cuenta ct) {
        try {
            this.database.excuteUpdate("insert into Cuentas(foto,fec_creacion,idUsuario)"
                    + "values('https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3',NOW(),'" + ct.getUser().getIdUsuario() + "')");
        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void ActualizarFoto(Cuenta ct) {
        try {
            this.database.excuteUpdate("update Cuentas set foto = '"+ct.getFoto()+ "' where idCuenta="+ct.getIdCuenta());
        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public Cuenta LeerCuenta(Usuario user) {
        ResultSet rs = null;
        Cuenta ct = new Cuenta();
        try {
            rs = this.database.excuteQuery("select * from Cuentas where idUsuario=" + user.getIdUsuario());

            while (rs.next()) {
                ct.setIdCuenta(rs.getInt("idCuenta"));
                ct.setFoto(rs.getString("Foto"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ct;
    }

    @Override
    public ArrayList<Cuenta> LeerCuentas() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Publicacion> leerPublicacion(Cuenta ct) {
        int valor = 1;
        ArrayList<Publicacion> listPos = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = this.database.excuteQuery("select * from Publicaciones where idCuenta=" + ct.getIdCuenta() + " and estado=" + valor);

            while (rs.next()) {
                ArticuloDAO articulo = new ArticuloDAO();
                Publicacion publicacion = new Publicacion();
                publicacion.setArticulo(articulo.LeerArticulo(rs.getInt("idProducto")));
                publicacion.setCuenta(ct);
                publicacion.setFecha_pos(rs.getString("fec_Post"));
                publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                publicacion.setEstado(String.valueOf(rs.getInt("estado")));
                publicacion.setUbicacion(rs.getString("ubicacion"));
                listPos.add(publicacion);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPos;
    }

    @Override
    public void EliminarPublicacion(int id) {
        try {
            this.database.excuteUpdate("delete from Publicaciones where idProducto=" + id);
            this.database.excuteUpdate("delete from Productos_Imagenes where idProducto=" + id);
            this.database.excuteUpdate("delete from Productos where idProducto=" + id);
        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void ActualizarPublicacion(int id) {
        int valor = 0;
        try {
            this.database.excuteUpdate("update Publicaciones set estado=" + valor + " where idProducto=" + id);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public ArrayList<Publicacion> leerPublicacionVendida(Cuenta ct) {
        int estado = 0;
        ArrayList<Publicacion> listPos = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = this.database.excuteQuery("select * from Publicaciones where idCuenta=" + ct.getIdCuenta() + " and estado =" + estado);

            while (rs.next()) {
                ArticuloDAO articulo = new ArticuloDAO();
                Publicacion publicacion = new Publicacion();
                publicacion.setArticulo(articulo.LeerArticulo(rs.getInt("idProducto")));
                publicacion.setCuenta(ct);
                publicacion.setFecha_pos(rs.getString("fec_Post"));
                publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                publicacion.setEstado(String.valueOf(rs.getInt("estado")));
                publicacion.setUbicacion(rs.getString("ubicacion"));
                listPos.add(publicacion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPos;
    }

    @Override
    public Cuenta LeerCuenta(int id) {
        ResultSet rs2 = null;
        Cuenta ct = new Cuenta();
        Usuario user = new Usuario();
        try {
            rs2 = this.database.excuteQuery("select * from Usuarios a, Cuentas b where (a.idUsuario = b.idUsuario) and b.idCuenta = "+id);
           
            while(rs2.next()){
                ct.setIdCuenta(rs2.getInt("idCuenta"));
                ct.setFoto(rs2.getString("foto"));
                user.setIdUsuario(rs2.getInt("idUsuario"));
                user.setNombre(rs2.getString("nombreUsuario"));
                user.setCorreo(rs2.getString("email"));
                user.setNumero(rs2.getString("numeroTelefono"));
                ct.setUser(user);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ct;
    }

}
