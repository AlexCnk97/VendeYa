/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

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
public class UsuarioDAO implements UsuarioCRUD {

    private Database database;
    
    public UsuarioDAO(){
        this.database = new Database();
    }

    @Override
    public void insertarUsuario(Usuario usuario) {
        try {
            this.database.excuteUpdate("insert into Usuarios("
                    + "nombreUsuario,numeroTelefono,email,password) values("
                    + "'" + usuario.getNombre() + "','" + usuario.getNumero() + "','" + usuario.getCorreo() + "',"
                    + "'" + usuario.getPassword() + "')");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void eliminarUsuario(Usuario usuario) {
        
    }


    @Override
    public Usuario leerUsuario(Usuario usuario) {
        ResultSet rs = null;
        Usuario user = new Usuario();
        try {
            rs = this.database.excuteQuery("select * from Usuarios where email='"+usuario.getCorreo()+"' and "
                    + "password='"+usuario.getPassword()+"'");
            while(rs.next()){
                user.setNombre(rs.getString("nombreUsuario"));
                user.setCorreo(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setNumero(rs.getString("numeroTelefono"));
                user.setIdUsuario(rs.getInt("idUsuario"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public ArrayList<Usuario> leerUsuarios() {
        ArrayList<Usuario> list = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = this.database.excuteQuery("select * from Usuarios");
            while(rs.next()){
                list.add((Usuario) rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public void actualizarUsuarioNombre(Usuario usuario) {
       String sql = "update Usuarios set nombreUsuario='"+ usuario.getNombre()+"' where idUsuario="+usuario.getIdUsuario()+"";
        try {
            this.database.excuteUpdate(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    @Override
    public void actualizarUsuarioPass(Usuario usuario) {
       String sql = "update Usuarios set password='"+ usuario.getPassword()+"' where idUsuario="+usuario.getIdUsuario()+"";
        try {
            this.database.excuteUpdate(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void actualizarUsuarioNumero(Usuario usuario) {
          String sql = "update Usuarios set numeroTelefono='"+ usuario.getNumero()+"' where idUsuario="+usuario.getIdUsuario()+"";
        try {
            this.database.excuteUpdate(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
