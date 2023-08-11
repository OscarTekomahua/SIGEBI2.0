package mx.edu.utez.sigebi.model;

import java.sql.Time;
import java.time.LocalTime;

public class PrestamoSalas {
    private int idPrestamo;
    private int idSala;
    private int idUsuario;
    private Time horaInicio;
    private Time horaFin;
    private String estado;
    private String extras;

    public PrestamoSalas() {

    }

    public PrestamoSalas(int idPrestamo, int idSala, int idUsuario, Time horaInicio, Time horaFin, String estado, String extras) {
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

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
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
