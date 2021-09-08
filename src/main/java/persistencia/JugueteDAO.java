package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import logica.Juguete;

/**
 *
 * @author Cielo Juliana
 */
public class JugueteDAO {

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
            return null;
        }
        return lista;
    }
}
