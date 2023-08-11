package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.PrestamoSalas;
import mx.edu.utez.sigebi.model.Sala;
import mx.edu.utez.sigebi.model.Usuario;

public interface DaoPrestamosSalas {
    boolean registrarPrestamo (PrestamoSalas prestamosala);

    boolean updatePrestamo (PrestamoSalas prestamoSala);

}
