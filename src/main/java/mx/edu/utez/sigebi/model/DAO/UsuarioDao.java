package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Persona;
import mx.edu.utez.sigebi.model.Rol;
import mx.edu.utez.sigebi.model.Usuario;
import mx.edu.utez.sigebi.utils.EnviarCorreo;
import mx.edu.utez.sigebi.utils.MysqlConector;
import java.sql.*;
import java.util.*;
import java.util.List;

public class UsuarioDao implements DaoRepository {

    private Connection con;
    private List<Usuario> listaUsuario;
    private Usuario usr;
    private boolean resp;

    public UsuarioDao() {
        this.con = new MysqlConector().connect();
        this.listaUsuario = new ArrayList<>();
        this.usr = new Usuario();
        this.resp = false;
    }

    @Override
    public List findAll() {
        try {
            PreparedStatement stmt = con.prepareStatement("select * from usuario");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                usr.setId_usuario(res.getInt("id_usuario"));
                usr.setId_persona(res.getInt("id_persona"));
                usr.setRol((Rol) (res.getObject("rol")));
                usr.setCorreo_institucional(res.getString("correo_institucional"));
                usr.setContra(res.getString("contraseña"));
                usr.setCodigo(res.getString("codigo"));
                listaUsuario.add(usr);
            }
            res.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaUsuario;
    }

    @Override
    public Object findOne(int id_usuario) {return null;}

    public Object findOne(String correo, String contra) {
        try {
            String query = "select usuario.*, rol.tipo_usuario from usuario join rol on usuario.rol = rol.id_rol where correo_institucional = ? AND contraseña = sha2(?, 256)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1,correo);
            stmt.setString(2,contra);
            ResultSet res = stmt.executeQuery();
            if (res.next()) {
                usr.setId_usuario(res.getInt("id_usuario"));
                usr.setId_persona(res.getInt("id_persona"));
                usr.setCorreo_institucional(res.getString("correo_institucional"));
                usr.setContra(res.getString("contraseña"));
                usr.setCodigo(res.getString("codigo"));
                Rol rol = new Rol();
                rol.setTipo_usuario(res.getString("tipo_usuario"));
                usr.setRol(rol);
            }
            stmt.close();
            res.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usr;
    }

    public String obtenerCodigoRestablecimiento(String correo) {
        String codigoRestablecimiento = null;

        try {
            String query = "SELECT usuario.codigo, convert (aes_decrypt(codigo, 'secret_keyForPas') using utf8)" +
                    "as codigodesencriptado FROM usuario WHERE correo_institucional = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, correo);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                codigoRestablecimiento = rs.getString("codigodesencriptado");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el codigo de restablecimiento: " + e.getMessage());
        }

        return codigoRestablecimiento;
    }

    @Override
    public boolean update(int id_usuario, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id_usuario) {
        return false;
    }

    @Override
    public boolean insert (Object object){return false;}

    public String generadorCodigo () {

        String caracteresPermitidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int longitudCadena = 10;
        StringBuilder cadenaAleatoria = new StringBuilder();

        Random random = new Random();

        for (int i = 0; i < longitudCadena; i++) {
            int indiceAleatorio = random.nextInt(caracteresPermitidos.length());
            char caracterAleatorio = caracteresPermitidos.charAt(indiceAleatorio);
            cadenaAleatoria.append(caracterAleatorio);
        }

        return cadenaAleatoria.toString();
    }

    @Override
    public boolean insert(Persona objectperson, Usuario objectusr) {
        try {
            String generatedCode = generadorCodigo();

            String query = "insert into persona (nombres, apellido1, apellido2) values (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, objectperson.getNombre());
            stmt.setString(2, objectperson.getApellido1());
            stmt.setString(3, objectperson.getApellido2());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                int idPersona = rs.getInt(1);

                String query2 = "insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)" +
                        "values (?, ?, ?, sha2(?, 256), aes_encrypt(?, 'secret_keyForPas'))";
                PreparedStatement stmt2 = con.prepareStatement(query2);
                stmt2.setInt(1, idPersona);
                stmt2.setInt(2, 3);
                stmt2.setString(3, objectusr.getCorreo_institucional());
                stmt2.setString(4, objectusr.getContra());
                stmt2.setString(5, generatedCode);
                stmt2.executeUpdate();
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public boolean correoExiste (String correo) {

        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM usuario WHERE correo_institucional = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, correo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
    }

    public void updateCode (String correoInstitucional, String nuevoCodigo) {
        PreparedStatement stmt = null;

        try {
            String query = "UPDATE usuario SET codigo = aes_encrypt(?, 'secret_keyForPas') WHERE correo_institucional = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, nuevoCodigo);
            stmt.setString(2, correoInstitucional);

            int updateCode = stmt.executeUpdate();

            if (updateCode > 0) {
                System.out.println("Codigo Actualizado");
            } else {
                System.out.println("ERROR");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void enviarCodigoPorCorreo (String correo, String codigoRestablecimiento) {
        String asunto = "Restablecimiento de Contraseña";
        String mensaje = "Hola,\n\n";
        mensaje += "Hemos recibido una solicitud para restablecer la contraseña de tu cuenta. ";
        mensaje += "Por favor, ingresa el siguiente código en el formulario para completar el proceso:\n\n";
        mensaje += codigoRestablecimiento + "\n\n";
        mensaje += "Si no solicitaste este restablecimiento, puedes ignorar este mensaje.\n\n";
        mensaje += "Gracias.";

        EnviarCorreo newmail = new EnviarCorreo();
        newmail.enviarCorreo(correo, asunto, mensaje);

    }

    public boolean updatePassword (String correo, String nuevaContra) {

        PreparedStatement stmt = null;

        try {
            String query = "UPDATE usuario SET contraseña = sha2(?, 256) WHERE correo_institucional = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, nuevaContra);
            stmt.setString(2, correo);

            int actualizacion = stmt.executeUpdate();

            if (actualizacion > 0) {
                System.out.println("Contraseña actualizada correctamente.");
            } else {
                System.out.println("No se encontró ningún registro con ese correo institucional.");
            }

            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;

    }

}
