/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Publicacion;

import Cuenta.Cuenta;
import java.util.ArrayList;

/**
 *
 * @author cnk
 */
public interface PublicacionCRUD {
    public void InsertarPublicacion(Publicacion pos);
    public Publicacion LeerPublicacion(int id);
}
