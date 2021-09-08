/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import persistencia.JugueteDAO;

/**
 *
 * @author Cielo Juliana
 */
public class ColeccionJuguetes {
    
    private ArrayList<Juguete> lista;
    
    public ArrayList<Juguete> getLista() {
        return lista;
    }
    
    public boolean cargarJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        lista = dao.consultarJuguetes();
        if (lista.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    } 
}
