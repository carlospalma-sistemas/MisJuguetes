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
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad FROM juguetes ");
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
        
        String sql = "INSERT INTO juguetes (nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad) VALUES ('"+nombre+"', "+idTipo+", '"+fechacompra+"', "+idEstado+", '"+disponibilidad+"') ";
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
     * Cargar los diferentes tipos de juguetes desde la BD
     * @return un treemap con la lista de los tipos de juguetes
     */
    public TreeMap<Integer, String> cargarTiposJuguetes() {
        TreeMap<Integer, String> listaTipos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT id, tipo FROM tipos_juguetes ");
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
        TreeMap<Integer, String> listaEstados = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT id, estado FROM estados_juguetes ");
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
