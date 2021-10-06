/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.JugueteDAO;

/**
 * Contiene la lógica requerida para gestionar la información de los juguetes
 * @author Cielo Juliana
 */
public class LogicaJuguetes {
    private ArrayList<Juguete> lista;
    
    /**
     * Obtiene una lista de juguetes
     * @return una estructura de datos con los datos de los juguetes requeridos
     */
    public ArrayList<Juguete> getLista() {
        return lista;
    }
    
    /**
     * Obtiene el nombre del tipo de juguete dado el id correspondiente
     * @param key el id del tipo
     * @return el nombre del tipo de juguete
     */
    public String getTipoJuguete(int key) {
        JugueteDAO dao = new JugueteDAO();
        TreeMap<Integer, String> listaTiposJuguetes = dao.cargarTiposJuguetes();
        String value = listaTiposJuguetes.get(key);
        return value;
    }
    
    /**
     * Obtiene la lista de los tipos de juguetes
     * @return un treemap con los tipos de juguetes
     */
    public TreeMap<Integer, String> getTiposJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        TreeMap<Integer, String> listaTiposJuguetes = dao.cargarTiposJuguetes();
        return listaTiposJuguetes;
    }
    
    /**
     * Obtiene el nombre del estado de juguete dado el id correspondiente
     * @param key el id del estado
     * @return el nombre del estado de juguete
     */
    public String getEstadoJuguete(int key) {
        JugueteDAO dao = new JugueteDAO();
        TreeMap<Integer, String> listaEstadosJuguetes = dao.cargarEstadosJuguetes();
        String value = listaEstadosJuguetes.get(key);
        return value;
    }
    
    /**
     * Obtiene la lista de los estados de juguetes
     * @return un treemap con los estados de juguetes
     */
    public TreeMap<Integer, String> getEstadosJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        TreeMap<Integer, String> listaEstadosJuguetes = dao.cargarEstadosJuguetes();
        return listaEstadosJuguetes;
    }
    
    /**
     * Carga la información de todos los juguetes de la base de datos
     * @return true si carga los juguetes, o false si no se logró cargar
     */
    public boolean cargarTodosLosJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        lista = dao.consultarJuguetes();
        if (lista.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * Carga la información de ciertos juguetes de la base de datos mediante filtro
     * @return true si carga los juguetes, o false si no se logró cargar
     */
    public boolean cargarJuguetesPorFiltro(String filtro) {
        JugueteDAO dao = new JugueteDAO();
        lista = dao.consultarJuguetesPorFiltro(filtro);
        if (lista.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * Carga la información de un solo juguete de la base de datos
     * @return true si carga los juguetes, o false si no se logró cargar
     */
    public Juguete cargarUnJuguete(int id) {
        JugueteDAO dao = new JugueteDAO();
        Juguete j = dao.consultarJuguete(id);
        return j;
    }
    
    /**
     * Guarda la información de un juguete capturada desde el formulario
     * @param j un objeto con los datos de un juguete específico
     * @return true si guarda el juguete en la base de datos, o false si no lo guarda
     */
    public boolean guardarJuguete(Juguete j) {
        JugueteDAO dao = new JugueteDAO();
        if (j.getId() == 0) {
            int id = dao.guardarNuevoJuguete(j);
            if (id > 0) {
                return true;
            } else {
                return false;
            }
        }
        else {
            int filas = dao.guardarJugueteExistente(j);
            if (filas == 1) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    
}
