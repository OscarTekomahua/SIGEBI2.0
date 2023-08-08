package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Sala;

import java.util.List;

public interface DaoSala <Sala> {
    List<Sala> findAll();
    boolean update(int id_sala, Sala object);

}
