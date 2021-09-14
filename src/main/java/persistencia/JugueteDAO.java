package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre, tipo, fechacompra, estado, disponibilidad FROM juguetes ");
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String tipo = rs.getString("tipo");
                String fechaCompra = rs.getString("fechacompra");
                String estado = rs.getString("estado");
                String disponibilidad = rs.getString("disponibilidad");
                Juguete j = new Juguete(id, nombre, tipo, fechaCompra, estado, disponibilidad);
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
        String tipo = j.getTipo();
        String fechacompra = j.getFechaCompra();
        String estado = j.getEstado();
        String disponibilidad = j.getDisponibilidad();
        
        String sql = "INSERT INTO juguetes (nombre, tipo, fechacompra, estado, disponibilidad) VALUES ('"+nombre+"', '"+tipo+"', '"+fechacompra+"', '"+estado+"', '"+disponibilidad+"') ";
        System.out.println(sql);
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
}
