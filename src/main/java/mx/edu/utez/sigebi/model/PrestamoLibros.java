package mx.edu.utez.sigebi.model;

import java.util.Date;

public class PrestamoLibros {
    private int idPrestamo;
    private Libro idLibro;
    private Usuario idUsuario;
    private Date fecha_prestamo;
    private Date fecha_devolcion;
    private String estadoPrestamo;

    public PrestamoLibros() {

    }

    public PrestamoLibros(int idPrestamo, Libro idLibro, Usuario idUsuario, Date fecha_prestamo, Date fecha_devolcion, String estadoPrestamo) {
        this.idPrestamo = idPrestamo;
        this.idLibro = idLibro;
        this.idUsuario = idUsuario;
        this.fecha_prestamo = fecha_prestamo;
        this.fecha_devolcion = fecha_devolcion;
        this.estadoPrestamo = estadoPrestamo;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public Libro getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(Libro idLibro) {
        this.idLibro = idLibro;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Date getFecha_prestamo() {
        return fecha_prestamo;
    }

    public void setFecha_prestamo(Date fecha_prestamo) {
        this.fecha_prestamo = fecha_prestamo;
    }

    public Date getFecha_devolcion() {
        return fecha_devolcion;
    }

    public void setFecha_devolcion(Date fecha_devolcion) {
        this.fecha_devolcion = fecha_devolcion;
    }

    public String getEstadoPrestamo() {
        return estadoPrestamo;
    }

    public void setEstadoPrestamo(String estadoPrestamo) {
        this.estadoPrestamo = estadoPrestamo;
    }
}
