package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.Editorial;
import mx.edu.utez.sigebi.model.Usuario;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDao implements DaoCategoria {

    private Connection con;
    private List<Categoria> listacategorias;
    private Categoria categoria;
    private boolean resp;

    public CategoriaDao() {
        this.con = new MysqlConector().connect();
        this.listacategorias = new ArrayList<>();
        this.categoria = new Categoria();
        this.resp = false;
    }

    @Override
    public List<Categoria> findAll() {

        List<Categoria> categorias = new ArrayList<>();

        try {
            String query = "SELECT * FROM categoria";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int idCategoria = rs.getInt("id_categoria");
                String nombreCategoria = rs.getString("nombre_categoria");

                Categoria categoria = new Categoria(idCategoria, nombreCategoria);
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorias;
    }

    @Override
    public Object findOne(int id_categoria) {
        return null;
    }

    @Override
    public boolean update(int id_categoria, Object object) {
        return false;
    }

    @Override
    public boolean delete(int idCategoria) {
        PreparedStatement stmt;
        {
            try {
                stmt = con.prepareStatement("call elimninarcategoria(?);");
                stmt.setInt(1,idCategoria);
                return stmt.executeUpdate() == 1;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    @Override
    public boolean insert(Categoria categoria) {

        try {
            String query = "INSERT INTO categoria (nombre_categoria) VALUES (?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, categoria.getNombre_categoria());
            stmt.executeUpdate();

            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
    }

    public boolean catExiste (String categoria) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM categoria WHERE nombre_categoria = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, categoria);
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
