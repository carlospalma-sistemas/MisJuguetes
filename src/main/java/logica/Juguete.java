package logica;

/**
 * Clase base
 * @author Cielo Juliana
 */
public class Juguete {
    private int id;
    private String nombre;
    private String tipo;
    private String fechaCompra;  //yyyy-mm-dd
    private String estado;
    private String disponibilidad;

    
    public Juguete() {
    }

    
    public Juguete(String nombre, String tipo, String fecha, String estado, String disponibilidad) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.fechaCompra = fecha;
        this.estado = estado;
        this.disponibilidad = disponibilidad;
    }
    
    
    public Juguete(int id, String nombre, String tipo, String fecha, String estado, String disponibilidad) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.fechaCompra = fecha;
        this.estado = estado;
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

    
    public String getTipo() {
        return tipo;
    }

    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    public String getFechaCompra() {
        return fechaCompra;
    }

    
    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }
    
    
    public String getEstado() {
        return estado;
    }

    
    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    public String getDisponibilidad() {
        return disponibilidad;
    }

    
    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
}
