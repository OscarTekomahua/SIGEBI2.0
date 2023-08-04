package mx.edu.utez.sigebi.model;

import java.io.Serializable;

public class Persona implements Serializable {
    private int id_persona;
    private String nombre;
    private String apellido1;
    private String apellido2;

    public Persona() {
    }

    public Persona(int id_persona, String nombre, String apellido1, String apellido2) {
        this.id_persona = id_persona;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }
}
