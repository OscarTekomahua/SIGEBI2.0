package mx.edu.utez.sigebi.model;

import java.sql.Time;

public class SalaConsulta {
    private String nombreSala;
    private int capacidadMaxima;
    private String nombreUsuario;
    private String apellido1Usuario;
    private String apellido2Usuario;
    private String estado;
    private String hora_inicio;
    private String hora_fin;
    private String extras;

    public SalaConsulta() {

    }

    public SalaConsulta(String nombreSala, int capacidadMaxima, String nombreUsuario, String apellido1Usuario, String apellido2Usuario, String estado, String hora_inicio, String hora_fin, String extras) {
        this.nombreSala = nombreSala;
        this.capacidadMaxima = capacidadMaxima;
        this.nombreUsuario = nombreUsuario;
        this.apellido1Usuario = apellido1Usuario;
        this.apellido2Usuario = apellido2Usuario;
        this.estado = estado;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.extras = extras;
    }

    public String getNombreSala() {
        return nombreSala;
    }

    public void setNombreSala(String nombreSala) {
        this.nombreSala = nombreSala;
    }

    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }

    public void setCapacidadMaxima(int capacidadMaxima) {
        this.capacidadMaxima = capacidadMaxima;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellido1Usuario() {
        return apellido1Usuario;
    }

    public void setApellido1Usuario(String apellido1Usuario) {
        this.apellido1Usuario = apellido1Usuario;
    }

    public String getApellido2Usuario() {
        return apellido2Usuario;
    }

    public void setApellido2Usuario(String apellido2Usuario) {
        this.apellido2Usuario = apellido2Usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(String hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public String getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(String hora_fin) {
        this.hora_fin = hora_fin;
    }

    public String getExtras() {
        return extras;
    }

    public void setExtras(String extras) {
        this.extras = extras;
    }
}
