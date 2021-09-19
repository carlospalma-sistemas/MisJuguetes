package logica;

/**
 * Clase base
 * @author Cielo Juliana
 */
public class Juguete {
    private int id;
    private String nombre;
    private int idTipo;
    private String fechaCompra;  //yyyy-mm-dd
    private int idEstado;
    private String disponibilidad;

    
    public Juguete() {
    }

    
    public Juguete(String nombre, int idTipo, String fecha, int idEstado, String disponibilidad) {
        this.nombre = nombre;
        this.idTipo = idTipo;
        this.fechaCompra = fecha;
        this.idEstado = idEstado;
        this.disponibilidad = disponibilidad;
    }
    
    
    public Juguete(int id, String nombre, int idTipo, String fecha, int idEstado, String disponibilidad) {
        this.id = id;
        this.nombre = nombre;
        this.idTipo = idTipo;
        this.fechaCompra = fecha;
        this.idEstado = idEstado;
        this.disponibilidad = disponibilidad;
    }
    
    
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }
    

    public String getNombre() {
        return nombre;
    }

    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    public String getFechaCompra() {
        return fechaCompra;
    }

    
    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }
    
    
    public String getDisponibilidad() {
        return disponibilidad;
    }

    
    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
}
