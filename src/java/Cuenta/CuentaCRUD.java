/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cuenta;

import Publicacion.Publicacion;
import Usuario.Usuario;
import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public interface CuentaCRUD {

    public void CrearCuenta(Cuenta ct);

    public void ActualizarFoto(Cuenta ct);

    public Cuenta LeerCuenta(Usuario user);

    public ArrayList<Cuenta> LeerCuentas();

    public ArrayList<Publicacion> leerPublicacion(Cuenta ct);

    public void EliminarPublicacion(int id);

    public void ActualizarPublicacion(int id);

    public ArrayList<Publicacion> leerPublicacionVendida(Cuenta ct);
    
    public Cuenta LeerCuenta(int id);
}
