package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Persona;
import mx.edu.utez.sigebi.model.Usuario;

import java.util.List;
public interface DaoRepository <T>{
    List<T> findAll();

    T findOne(int id_usuario);

    boolean update(int id_usuario, T object);

    boolean delete(int id_usuario);

    boolean insert(T object);

    boolean insert(Persona objectperson, Usuario objectusr);

}
