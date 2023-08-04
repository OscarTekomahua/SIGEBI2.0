package mx.edu.utez.sigebi.model.DAO;

import java.util.List;

public interface DaoLibroHasEditorial <T> {

    List<T> findAll();

    T findOne(int id_librohaseditorial);

    boolean update(int id_librohaseditorial, T object);

    boolean delete(int id_librohaseditorial);

    boolean insert(T object);

}
