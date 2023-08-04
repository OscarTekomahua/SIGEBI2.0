package mx.edu.utez.sigebi.model;

import java.io.Serializable;

public class Usuario implements Serializable {
    private int id_usuario;
    private int id_persona;
    private Rol rol;
    private String correo_institucional;
    private String contra;
    private String codigo;
    private double multa;

    public Usuario() {

    }

    public Usuario(int id_usuario, int id_persona, Rol rol, String correo_institucional, String contra, String codigo, double multa) {
        this.id_usuario = id_usuario;
        this.id_persona = id_persona;
        this.rol = rol;
        this.correo_institucional = correo_institucional;
        this.contra = contra;
        this.codigo = codigo;
        this.multa = multa;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public String getCorreo_institucional() {
        return correo_institucional;
    }

    public void setCorreo_institucional(String correo_institucional) {
        this.correo_institucional = correo_institucional;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public double getMulta() {
        return multa;
    }

    public void setMulta(double multa) {
        this.multa = multa;
    }
}
