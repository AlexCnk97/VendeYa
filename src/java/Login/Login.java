/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import Cuenta.Cuenta;
import Cuenta.CuentaDAO;
import Usuario.Usuario;
import Usuario.UsuarioDAO;

/**
 *
 * @author cnk
 */
public class Login {
    private Usuario user;
    private UsuarioDAO userDao;
    private Cuenta cuenta;
    private CuentaDAO ctDao;
    
    public Login(String user, String password){
        this.user = new Usuario();
        this.userDao = new UsuarioDAO();
        this.user.setCorreo(user);
        this.user.setPassword(password);
        this.cuenta = new Cuenta();
        this.ctDao = new CuentaDAO();
    }
    
    public String validarDatos(){
        Usuario us = new Usuario();
        Cuenta ct = new Cuenta();
        us = this.userDao.leerUsuario(this.user);
        this.user = us;
        ct = this.ctDao.LeerCuenta(this.user);
        this.cuenta = ct;
        return this.user.getNombre();
    }
    
    public Usuario getUsuario(){
        return this.user;
    }
    
    public Cuenta getCuenta(){
        return this.cuenta;
    }
}
