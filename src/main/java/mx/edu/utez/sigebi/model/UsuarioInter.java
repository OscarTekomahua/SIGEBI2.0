package mx.edu.utez.sigebi.model;

public class UsuarioInter {
    private int id_persona;
    private int id_usuario;
    private String nombres;
    private String apellido1;
    private String apellido2;
    private String correo_institucional;
    private String tipo_usuario;

    public UsuarioInter() {

    }

    public UsuarioInter(int id_persona, int id_usuario, String nombres, String apellido1, String apellido2, String correo_institucional, String tipo_usuario) {
        this.id_persona = id_persona;
        this.id_usuario = id_usuario;
        this.nombres = nombres;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.correo_institucional = correo_institucional;
        this.tipo_usuario = tipo_usuario;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
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

    public String getCorreo_institucional() {
        return correo_institucional;
    }

    public void setCorreo_institucional(String correo_institucional) {
        this.correo_institucional = correo_institucional;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
}
