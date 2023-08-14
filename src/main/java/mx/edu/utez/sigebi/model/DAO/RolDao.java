package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Rol;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

public class RolDao implements DaoRol {
    private Connection con;
    private List<Rol> roles;
    private Rol rol;
    private boolean resp;

    public RolDao () {
        this.con = new MysqlConector().connect();
        this.roles = new ArrayList<>();
        this.rol = new Rol();
        this.resp = false;
    }

    @Override
    public List<Rol> findAdminBiblio() {
        try {
            String query = "SELECT * FROM rol WHERE tipo_usuario = 'Administrador' OR tipo_usuario = 'Bibliotecario'";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                int idRol = res.getInt("id_rol");
                String rolUsuario = res.getString("tipo_usuario");

                Rol rol = new Rol(idRol, rolUsuario);
                roles.add(rol);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }

}
