package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Categoria;

import java.util.List;

public interface DaoCategoria <T> {

    List<T> findAll();

    T findOne(int id_categoria);

    boolean update(int id_categoria, T object);

    boolean delete(int id_categoria);

    boolean insert(Categoria categoria);

}
