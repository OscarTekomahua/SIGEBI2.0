package mx.edu.utez.sigebi.model;

import java.util.Date;

public class PrestamoLibros {
    private int idPrestamo;
    private int idLibro;
    private int idUsuario;
    private Date fecha_prestamo;
    private Date fecha_devolcion;
    private String estadoPrestamo;
    private double multa;
    public PrestamoLibros() {

    }

    public PrestamoLibros(int idPrestamo, int idLibro, int idUsuario, Date fecha_prestamo, Date fecha_devolcion, String estadoPrestamo, double multa) {
        this.idPrestamo = idPrestamo;
        this.idLibro = idLibro;
        this.idUsuario = idUsuario;
        this.fecha_prestamo = fecha_prestamo;
        this.fecha_devolcion = fecha_devolcion;
        this.estadoPrestamo = estadoPrestamo;
        this.multa = multa;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
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

    public double getMulta() {
        return multa;
    }

    public void setMulta(double multa) {
        this.multa = multa;
    }
}
