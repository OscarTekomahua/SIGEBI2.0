package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Sala;

import java.util.List;

public interface DaoSala <Sala> {
    List<Sala> findAll();
    void update(int id_sala, boolean estadoActualizado);

}
