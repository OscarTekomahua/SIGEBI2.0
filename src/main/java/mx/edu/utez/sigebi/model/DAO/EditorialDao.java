package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.Editorial;
import mx.edu.utez.sigebi.model.Libro;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EditorialDao implements DaoEditorial {
    private Connection con;
    private List<Editorial> listaeditoriales;
    private Editorial editorial;
    private boolean resp;

    public EditorialDao() {
        this.con = new MysqlConector().connect();
        this.listaeditoriales = new ArrayList<>();
        this.editorial = new Editorial();
        this.resp = false;
    }


    @Override
    public List<Editorial> findAll() {

        List<Editorial> editoriales = new ArrayList<>();

        try {
            String query = "SELECT * FROM editorial";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int idEditorial = rs.getInt("id_editorial");
                String nombreEditorial = rs.getString("nombre");

                Editorial editorial = new Editorial(idEditorial, nombreEditorial);
                editoriales.add(editorial);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return editoriales;
    }

    @Override
    public Object findOne(int id_editorial) {
        return null;
    }

    @Override
    public boolean update(int id_editorial, Object object) {
        return false;
    }

    @Override
    public boolean delete(int idEditorial) {
        PreparedStatement stmt;
        {
            try {
                stmt = con.prepareStatement("call ELIMINAR_EDITORIAL(?);");
                stmt.setInt(1,idEditorial);
                return stmt.executeUpdate() ==1;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }



    @Override
    public boolean insert(Editorial editorial) {

        try {
            String query = "INSERT INTO editorial (nombre) VALUES (?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, editorial.getNombre());
            stmt.executeUpdate();

            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
    }

    public boolean editorialExiste (String editorial) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM editorial WHERE nombre = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, editorial);
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
}
