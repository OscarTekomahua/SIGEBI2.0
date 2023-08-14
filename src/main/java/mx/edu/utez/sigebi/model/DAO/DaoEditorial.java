package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Editorial;

import java.util.List;

public interface DaoEditorial <T> {
    List<T> findAll();

    T findOne(int id_editorial);

    boolean update(int id_editorial, T object);

    boolean delete(int id_editorial);

    boolean insert(Editorial editorial);
}
