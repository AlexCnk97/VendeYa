/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public interface UsuarioCRUD {

    void insertarUsuario(Usuario usuario);

    void eliminarUsuario(Usuario usuario);

    void actualizarUsuarioNombre(Usuario usuario);
    
    void actualizarUsuarioPass(Usuario usuario);
    
    void actualizarUsuarioNumero(Usuario usuario);

    Usuario leerUsuario(Usuario usuario);

    ArrayList<Usuario> leerUsuarios();

}
