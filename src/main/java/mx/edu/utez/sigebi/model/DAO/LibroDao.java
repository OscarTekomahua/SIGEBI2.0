package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.*;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LibroDao implements DaoLibro {
    private Connection con;
    private List<Libro> listalibros;
    private Libro l;
    private boolean resp;

    public LibroDao(){
        this.con = new MysqlConector().connect();
        this.listalibros = new ArrayList<>();
        this.l = new Libro();
        this.resp = false;
    }

    @Override
    public boolean insert (Libro libro, List<Integer> idEditoriales, List<Integer> idCategorias) {
        try {
            String query = "INSERT INTO libro (titulo, autor, ejemplares, isbn, imagen) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, libro.getTitulo());
            stmt.setString(2, libro.getAutor());
            stmt.setInt(3, libro.getEjemplares());
            stmt.setString(4, libro.getIsbn());
            stmt.setString(5, libro.getImagen());

            int filasInsertadas = stmt.executeUpdate();

            if (filasInsertadas > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int idLibro = generatedKeys.getInt(1);
                    libro.setId_libro(idLibro);

                    for (int idEditorial: idEditoriales) {
                        agregarRelacionLibroEditorial(idLibro, idEditorial);
                    }

                    for (int idCategoria: idCategorias) {
                        agregarRelacionLibroCategoria(idLibro, idCategoria);
                    }

                    return true;

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    private void agregarRelacionLibroEditorial (int idLibro, int idEditorial) {

        try {
            String query = "INSERT INTO librohaseditorial (id_libro, id_editorial) VALUES (?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setInt(1, idLibro);
            stmt.setInt(2, idEditorial);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void agregarRelacionLibroCategoria (int idLibro, int idCategoria) {

        try {
            String query = "INSERT INTO librohascategoria (id_libro, id_categoria) VALUES (?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setInt(1, idLibro);
            stmt.setInt(2, idCategoria);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<ResultadosConsulta> getAllAttributes () {
        List <ResultadosConsulta> tablalibros = new ArrayList<>();

        try {
            String query = "SELECT l.id_libro, l.titulo, l.autor, l.ejemplares, l.isbn, GROUP_CONCAT(DISTINCT c.nombre_categoria SEPARATOR ', ') AS categorias, GROUP_CONCAT(DISTINCT e.nombre SEPARATOR ', ') AS editoriales FROM libro l LEFT JOIN librohascategoria lc ON l.id_libro = lc.id_libro LEFT JOIN categoria c ON lc.id_categoria = c.id_categoria LEFT JOIN librohaseditorial le ON l.id_libro = le.id_libro LEFT JOIN editorial e ON le.id_editorial = e.id_editorial GROUP BY l.id_libro, l.titulo, l.autor, l.ejemplares, l.isbn";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_libro");
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                int ejemplares = rs.getInt("ejemplares");
                String isbn = rs.getString("isbn");
                String categoria = rs.getString("categorias");
                String editorial = rs.getString("editoriales");

                ResultadosConsulta consulta = new ResultadosConsulta(id, isbn, titulo, autor, editorial, categoria, ejemplares);
                tablalibros.add(consulta);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tablalibros;
    }

    @Override
    public Libro findOne(int id_libro) {
        return null;
    }

    @Override
    public boolean update(Libro object) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        PreparedStatement stmt;
        {
            try {
                stmt = con.prepareStatement("call ELIMINAR_LIBRO(?);");
                stmt.setInt(1,id);
                return stmt.executeUpdate() ==1;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }





}
