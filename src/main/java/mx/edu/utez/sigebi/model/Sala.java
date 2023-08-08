package mx.edu.utez.sigebi.model;

public class Sala {

    private int id_sala;
    private String nombre;
    private int capacidad_maxima;
    private String imagen;
    private boolean estado;
    private String estadoTexto;

    public Sala() {

    }

    public Sala(int id_sala, String nombre, int capacidad_maxima, String imagen, boolean estado, String estadoTexto) {
        this.id_sala = id_sala;
        this.nombre = nombre;
        this.capacidad_maxima = capacidad_maxima;
        this.imagen = imagen;
        this.estado = estado;
        this.estadoTexto = estadoTexto;
    }

    public int getId_sala() {
        return id_sala;
    }

    public void setId_sala(int id_sala) {
        this.id_sala = id_sala;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCapacidad_maxima() {
        return capacidad_maxima;
    }

    public void setCapacidad_maxima(int capacidad_maxima) {
        this.capacidad_maxima = capacidad_maxima;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getEstadoTexto() {
        return estadoTexto;
    }

    public void setEstadoTexto(String estadoTexto) {
        this.estadoTexto = estadoTexto;
    }
}
