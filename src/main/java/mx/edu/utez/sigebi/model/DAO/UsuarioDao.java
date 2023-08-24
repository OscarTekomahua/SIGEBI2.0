package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Persona;
import mx.edu.utez.sigebi.model.Rol;
import mx.edu.utez.sigebi.model.Usuario;
import mx.edu.utez.sigebi.model.UsuarioInter;
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

    public List<Persona> usuariosConPrestamo(){
        List<Persona> usrs = new ArrayList<>();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM vista_usuario_libro");
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                Persona usr = new Persona();
                usr.setId_persona(res.getInt("id_usuario"));
                usr.setNombre(res.getString("nombres"));
                usr.setApellido1(res.getString("apellido1"));
                usr.setApellido2(res.getString("apellido2"));
                usr.setLibroPrestado(res.getString("titulo"));
                usrs.add(usr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usrs;
    }

    @Override
    public List<UsuarioInter> findAll() {
        List<UsuarioInter> listausuarios = new ArrayList<>();
        try {
            String query = "SELECT persona.id_persona, persona.nombres, persona.apellido1, persona.apellido2, usuario.id_usuario, usuario.correo_institucional, rol.tipo_usuario FROM persona INNER JOIN usuario ON persona.id_persona = usuario.id_persona INNER JOIN rol ON usuario.rol = rol.id_rol";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                int idPersona = res.getInt("id_persona");
                int idUsuario = res.getInt("id_usuario");
                String nombres = res.getString("nombres");
                String apellidoP = res.getString("apellido1");
                String apellidoM = res.getString("apellido2");
                String correo = res.getString("correo_institucional");
                String tipo_usuario = res.getString("tipo_usuario");

                UsuarioInter usuario = new UsuarioInter(idPersona, idUsuario, nombres, apellidoP, apellidoM, correo, tipo_usuario);
                listausuarios.add(usuario);
            }
            res.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listausuarios;
    }

    @Override
    public boolean findOne(int id_usuario) {
        try {
            String query = "SELECT * FROM usuario WHERE id_usuario = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id_usuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usr.setId_usuario(rs.getInt("id_usuario"));
                usr.setId_persona(rs.getInt("id_persona"));
                usr.setCorreo_institucional(rs.getString("correo_institucional"));
                usr.setContra(rs.getString("contraseña"));
                usr.setCodigo(rs.getString("codigo"));
                Rol rol = new Rol();
                rol.setTipo_usuario(rs.getString("tipo_usuario"));
                usr.setRol(rol);
                usr.setMulta(rs.getDouble("multa"));
            }
            stmt.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }

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

        try {
            String PA = "CALL ELIMINAR_USUARIO(?)";
            PreparedStatement stmt = con.prepareStatement(PA);
            stmt.setInt(1, id_usuario);

            return stmt.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deletePersona(int id_persona) {
        try {
            String PA = "CALL ELIMINAR_PERSONA(?)";
            PreparedStatement statement = con.prepareStatement(PA);
            statement.setInt(1, id_persona);

            return statement.executeUpdate() == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    public boolean usuarioExiste (int id_usuario) {
        PreparedStatement statement = null;
        ResultSet res = null;

        try {
            String query = "SELECT COUNT(*) FROM usuario WHERE id_usuario = ?";
            statement = con.prepareStatement(query);
            statement.setInt(1, id_usuario);
            res = statement.executeQuery();

            if (res.next()) {
                int count = res.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public boolean registrarNuevoUsuario (Persona newperson, Usuario newuser, int idRol) {
        try {
            String generatedCode = generadorCodigo();

            String query = "insert into persona (nombres, apellido1, apellido2) values (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, newperson.getNombre());
            stmt.setString(2, newperson.getApellido1());
            stmt.setString(3, newperson.getApellido2());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                int idPersona = rs.getInt(1);

                String query2 = "insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)" +
                        "values (?, ?, ?, sha2(?, 256), aes_encrypt(?, 'secret_keyForPas'))";
                PreparedStatement stmt2 = con.prepareStatement(query2);
                stmt2.setInt(1, idPersona);
                stmt2.setInt(2, idRol);
                stmt2.setString(3, newuser.getCorreo_institucional());
                stmt2.setString(4, newuser.getContra());
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

        public String getFullName (String correo, String contra) {
            String nombreCompleto = "";

            try {
                String query = "SELECT p.nombres, p.apellido1, p.apellido2 FROM usuario u JOIN persona p ON u.id_persona = p.id_persona WHERE u.correo_institucional = ? AND u.contraseña = SHA2(?, 256)";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, correo);
                stmt.setString(2, contra);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String names = rs.getString("nombres");
                    String apellidoP = rs.getString("apellido1");
                    String apellidoM = rs.getString("apellido2");
                    nombreCompleto = names + " " + apellidoP + " " + apellidoM;
                }
                rs.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return nombreCompleto;
        }

}
