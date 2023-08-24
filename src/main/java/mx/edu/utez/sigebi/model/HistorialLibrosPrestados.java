package mx.edu.utez.sigebi.model;

public class HistorialLibrosPrestados {
    private int idPrestamo;
    private String nombres;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String tituloLibro;
    private String fechaPrestamo;
    private String fechaDevolucion;
    private String estadoPrestamo;
    private double multa;

    public HistorialLibrosPrestados() {

    }

    public HistorialLibrosPrestados(int idPrestamo, String nombres, String apellidoPaterno, String apellidoMaterno, String tituloLibro, String fechaPrestamo, String fechaDevolucion, String estadoPrestamo, double multa) {
        this.idPrestamo = idPrestamo;
        this.nombres = nombres;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.tituloLibro = tituloLibro;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaDevolucion = fechaDevolucion;
        this.estadoPrestamo = estadoPrestamo;
        this.multa = multa;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getTituloLibro() {
        return tituloLibro;
    }

    public void setTituloLibro(String tituloLibro) {
        this.tituloLibro = tituloLibro;
    }

    public String getFechaPrestamo() {
        return fechaPrestamo;
    }

    public void setFechaPrestamo(String fechaPrestamo) {
        this.fechaPrestamo = fechaPrestamo;
    }

    public String getFechaDevolucion() {
        return fechaDevolucion;
    }

    public void setFechaDevolucion(String fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
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
