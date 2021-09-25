/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import persistencia.UsuarioDAO;

/**
 *
 * @author Cielo Juliana
 */
public class LogicaUsuario {
    
    private ArrayList<Usuario> lista;
    
    public ArrayList<Usuario> getListaUsuarios() {
        return lista;
    }
    
    /**
     * Carga la información de todos los usuarios de la base de datos
     * @return true si carga los usuarios, o false si no se logró cargar
     */
    public boolean cargarTodosLosUsuarios() {
        UsuarioDAO dao = new UsuarioDAO();
        lista = dao.consultarUsuarios();
        if (lista.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    }
}
