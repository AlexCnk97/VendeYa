/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Registrar;

import Cuenta.Cuenta;
import Cuenta.CuentaDAO;
import Usuario.Usuario;
import Usuario.UsuarioDAO;

/**
 *
 * @author cnk
 */
public class Registrar {
    private Usuario user;
    private UsuarioDAO userDao;
    private Cuenta ct;
    private CuentaDAO ctDao;
    
    public Registrar(String user, String password, String email, String numero){
        this.user = new Usuario();
        this.userDao = new UsuarioDAO();
        this.user.setNombre(user);
        this.user.setPassword(password);
        this.user.setCorreo(email);
        this.user.setNumero(numero);
        this.ct = new Cuenta();
        this.ctDao = new CuentaDAO();
    }
    
    public void crearUsuario(){
        Usuario usuario = new Usuario();
        this.userDao.insertarUsuario(this.user);
        usuario = this.userDao.leerUsuario(this.user);
        this.user.setIdUsuario(usuario.getIdUsuario());
    }
    
    public void crearCuenta(){
        this.ct.setUser(this.user);
        this.ctDao.CrearCuenta(this.ct);
        this.ct = this.ctDao.LeerCuenta(this.user);
    }
    
    public Usuario getUsuario(){
        return this.user;
    }
    public Cuenta getCuenta(){
        return this.ct;
    }
    
    
    
}
