package mx.edu.utez.sigebi.model;

import java.time.LocalTime;

public class PrestamoSalas {
    private int idPrestamo;
    private Sala idSala;
    private Usuario idUsuario;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private String estado;
    private String extras;

    public PrestamoSalas() {

    }

    public PrestamoSalas(int idPrestamo, Sala idSala, Usuario idUsuario, LocalTime horaInicio, LocalTime horaFin, String estado, String extras) {
        this.idPrestamo = idPrestamo;
        this.idSala = idSala;
        this.idUsuario = idUsuario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.estado = estado;
        this.extras = extras;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public Sala getIdSala() {
        return idSala;
    }

    public void setIdSala(Sala idSala) {
        this.idSala = idSala;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getExtras() {
        return extras;
    }

    public void setExtras(String extras) {
        this.extras = extras;
    }
}
