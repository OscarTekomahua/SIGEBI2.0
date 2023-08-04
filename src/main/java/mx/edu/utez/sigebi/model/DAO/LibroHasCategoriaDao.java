package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.LibroHasCategoria;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class LibroHasCategoriaDao implements DaoLibroHasCategoria {

    private Connection con;
    private List<LibroHasCategoria> listaLibrosCat;
    private LibroHasCategoria libroHasCategoria;
    private boolean resp;

    public LibroHasCategoriaDao() {
        this.con = new MysqlConector().connect();
        this.listaLibrosCat = new ArrayList<>();
        this.libroHasCategoria = new LibroHasCategoria();
        this.resp = false;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Object findOne(int id_librohascategoria) {
        return null;
    }

    @Override
    public boolean update(int id_librohascategoria, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id_librohascategoria) {
        return false;
    }

    @Override
    public boolean insert(Object object) {
        return false;
    }
}
