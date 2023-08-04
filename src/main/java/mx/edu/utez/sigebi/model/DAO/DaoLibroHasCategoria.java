package mx.edu.utez.sigebi.model.DAO;

import java.util.List;

public interface DaoLibroHasCategoria <T>{

    List<T> findAll();

    T findOne(int id_librohascategoria);

    boolean update(int id_librohascategoria, T object);

    boolean delete(int id_librohascategoria);

    boolean insert(T object);
}
