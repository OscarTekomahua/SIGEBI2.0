package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Libro;
import mx.edu.utez.sigebi.model.ResultadosConsulta;

import java.util.List;

public interface DaoLibro {
    boolean insert(Libro libro, List<Integer> idEditoriales, List<Integer> idCategorias);
    Libro findOne(int id_libro);
    boolean update(Libro object);
    boolean delete (int id_libro);

}

