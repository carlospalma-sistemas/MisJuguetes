package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Juguete;

/**
 * Contiene todas las operaciones CRUD requeridas para los datos de los juguetes
 * @author Cielo Juliana
 */
public class JugueteDAO {

    /**
     * Envía la sentencia SQL para obtener la lista de todos los juguetes y estructura
     * la respuesta en una estructura de datos
     * @return una estructura de datos con los objetos de tipo juguete
     */
    public ArrayList<Juguete> consultarJuguetes() {
        ArrayList<Juguete> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT id, nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad " +
                     "FROM juguetes ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int idTipo = rs.getInt("tipojuguete_id");
                String fechaCompra = rs.getString("fechacompra");
                int idEstado = rs.getInt("estadojuguete_id");
                String disponibilidad = rs.getString("disponibilidad");
                Juguete j = new Juguete(id, nombre, idTipo, fechaCompra, idEstado, disponibilidad);
                lista.add(j);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
    /**
     * Envía la sentencia SQL para obtener la información de 1 juguete específico y estructura
     * la respuesta en un objeto de tipo Juguete
     * @param idAConsultar el id del juguete para consultar
     * @return un objeto de tipo Juguete con la información cargada o null
     */
    public Juguete consultarJuguete(int idAConsultar) {
        Juguete j = null;
        ConexionBD con = new ConexionBD();
        String sql = "SELECT id, nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad " +
                     "FROM juguetes "+
                     "WHERE id = " + idAConsultar + " ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int idTipo = rs.getInt("tipojuguete_id");
                String fechaCompra = rs.getString("fechacompra");
                int idEstado = rs.getInt("estadojuguete_id");
                String disponibilidad = rs.getString("disponibilidad");
                j = new Juguete(id, nombre, idTipo, fechaCompra, idEstado, disponibilidad);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return j;
        }
        con.desconectar();
        return j;
    }
    
    /**
     * Envía la sentencia SQL para obtener la información de ciertos juguete mediante filtro y estructura
     * la respuesta en una lista de tipo Juguete
     * @param filtro el filtro para buscar datos en la lista de juguetes para consultar
     * @return un arraylist de tipo Juguete con la información cargada
     */
     public ArrayList<Juguete> consultarJuguetesPorFiltro(String filtro) {
        ArrayList<Juguete> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT j.id, j.nombre, j.tipojuguete_id, t.tipo, j.fechacompra, j.estadojuguete_id, e.estado, j.disponibilidad " +
                     "FROM juguetes j " +
                     "JOIN tipos_juguetes t ON (j.tipojuguete_id = t.id) " +
                     "JOIN estados_juguetes e ON (j.estadojuguete_id = e.id) " +
                     "WHERE j.nombre LIKE '%" + filtro + "%' " +
                     "OR t.tipo LIKE '%" + filtro + "%' " +
                     "OR e.estado LIKE '%" + filtro + "%' " +
                     "OR j.disponibilidad LIKE '%" + filtro + "%' ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int idTipo = rs.getInt("tipojuguete_id");
                String fechaCompra = rs.getString("fechacompra");
                int idEstado = rs.getInt("estadojuguete_id");
                String disponibilidad = rs.getString("disponibilidad");
                Juguete j = new Juguete(id, nombre, idTipo, fechaCompra, idEstado, disponibilidad);
                lista.add(j);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
    /**
     * Envía la sentencia SQL para almacenar el dato de un juguete
     * @param j un objeto de tipo Juguete
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoJuguete(Juguete j) {
        ConexionBD con = new ConexionBD();
        String nombre = j.getNombre();
        int idTipo = j.getIdTipo();
        String fechacompra = j.getFechaCompra();
        int idEstado = j.getIdEstado();
        String disponibilidad = j.getDisponibilidad();
        
        String sql = "INSERT INTO juguetes (nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad) "+
                     "VALUES ('"+nombre+"', "+idTipo+", '"+fechacompra+"', "+idEstado+", '"+disponibilidad+"') ";
        ResultSet rs = con.ejecutarInsert(sql);
        int id = 0;
        try {
            if (rs.next()){
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return 0; 
        }
        con.desconectar();
        return id;
    }
    
    /**
     * Envía la sentencia SQL para actualizar el dato de un juguete existente
     * @param j un objeto de tipo Juguete
     * @return un número indicando la cantidad de registros afectados
     */
    public int guardarJugueteExistente(Juguete j) {
        ConexionBD con = new ConexionBD();
        int id = j.getId();
        String nombre = j.getNombre();
        int idTipo = j.getIdTipo();
        String fechacompra = j.getFechaCompra();
        int idEstado = j.getIdEstado();
        String disponibilidad = j.getDisponibilidad();
        
        String sql = "UPDATE juguetes "+
                     "SET nombre = '" + nombre + "' , tipojuguete_id = " + idTipo + " , fechacompra = '" + fechacompra + "', estadojuguete_id = " + idEstado + ", disponibilidad = '" + disponibilidad + "' " + 
                     "WHERE id = " + id + " ";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }
    
    
    /**
     * Cargar los diferentes tipos de juguetes desde la BD
     * @return un treemap con la lista de los tipos de juguetes
     */
    public TreeMap<Integer, String> cargarTiposJuguetes() {
        TreeMap<Integer, String> listaTipos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT id, tipo FROM tipos_juguetes ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String tipo = rs.getString("tipo");
                listaTipos.put(id, tipo);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaTipos;
    }
    
    /**
     * Cargar los diferentes estados de juguetes desde la BD
     * @return un treemap con la lista de los estados de juguetes
     */
    public TreeMap<Integer, String> cargarEstadosJuguetes() {
        TreeMap<Integer, String> listaEstados = new TreeMap<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT id, estado FROM estados_juguetes ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String estado = rs.getString("estado");
                listaEstados.put(id, estado);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaEstados;
    }
}
