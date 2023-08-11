package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.PrestamoSalas;
import mx.edu.utez.sigebi.model.Sala;
import mx.edu.utez.sigebi.model.Usuario;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PrestamoSalasDao implements DaoPrestamosSalas {
    private Connection con;
    private List<PrestamoSalas> prestamoSalas;
    private PrestamoSalas prestamos;
    private boolean resp;

    public PrestamoSalasDao() {
        this.con = new MysqlConector().connect();
        this.prestamoSalas = new ArrayList<>();
        this.prestamos = new PrestamoSalas();
        this.resp = false;
    }

    @Override
    public boolean registrarPrestamo(PrestamoSalas prestamo) {
        try {
            String query = "INSERT INTO prestamosala (id_sala, id_usuario, hora_inicio, hora_fin, estado, extras) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, prestamo.getIdSala());
            stmt.setInt(2, prestamo.getIdUsuario());
            stmt.setTime(3, prestamo.getHoraInicio());
            stmt.setTime(4, prestamo.getHoraFin());
            stmt.setString(5, prestamo.getEstado());
            stmt.setString(6, prestamo.getExtras());

            int filasInsertadas = stmt.executeUpdate();

            if (filasInsertadas > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int idPrestamoSala = generatedKeys.getInt(1);
                    prestamo.setIdPrestamo(idPrestamoSala);
                    return true;
                }
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updatePrestamo(PrestamoSalas prestamoSala) {
        return false;
    }
}
