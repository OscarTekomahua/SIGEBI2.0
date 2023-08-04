package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.LibroHasCategoria;
import mx.edu.utez.sigebi.model.LibroHasEditorial;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class LibroHasEditorialDao implements DaoLibroHasEditorial {
    private Connection con;
    private List<LibroHasEditorial> listaLibrosEdit;
    private LibroHasEditorial libroHasEditorial;
    private boolean resp;

    public LibroHasEditorialDao() {
        this.con = new MysqlConector().connect();
        this.listaLibrosEdit = new ArrayList<>();
        this.libroHasEditorial = new LibroHasEditorial();
        this.resp = false;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Object findOne(int id_librohaseditorial) {
        return null;
    }

    @Override
    public boolean update(int id_librohaseditorial, Object object) {
        return false;
    }

    @Override
    public boolean delete(int id_librohaseditorial) {
        return false;
    }

    @Override
    public boolean insert(Object object) {
        return false;
    }
}
