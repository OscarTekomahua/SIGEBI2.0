package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.PrestamoSalas;
import mx.edu.utez.sigebi.utils.MysqlConector;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class PrestamoSalasDao implements DaoPrestamosSalas {
    private Connection con;
    private List<PrestamoSalas> prestamoSalas;
    private PrestamoSalas prestamos;
    private boolean resp;
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    private int idSalaToUpdate;

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

            int idSala = prestamo.getIdSala();

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

    public void schedulePrestamoUpdate(int idSala) {
        this.idSalaToUpdate = idSala;
        scheduler.scheduleAtFixedRate(this::updatePrestamoSalaEstado, 0, 1, TimeUnit.MINUTES);
    }

    private void updatePrestamoSalaEstado() {
        try {
            String updatePrestamoQuery = "UPDATE prestamosala SET estado = ? WHERE hora_fin < ? AND estado = ?";
            String updateSalaQuery = "UPDATE sala SET estado = ? WHERE id_sala = ?";

            Time horaActual = obtenerHoraActual();

            String estadoDevuelto = "Devuelto";

            boolean estadoDisponible = true;

            con.setAutoCommit(false);

            try (PreparedStatement stmtPrestamo = con.prepareStatement(updatePrestamoQuery)) {
                stmtPrestamo.setString(1, estadoDevuelto);
                stmtPrestamo.setTime(2, horaActual);
                stmtPrestamo.setString(3, "Prestada");
                stmtPrestamo.executeUpdate();
            }

            try (PreparedStatement stmtSala = con.prepareStatement(updateSalaQuery)) {
                stmtSala.setBoolean(1, estadoDisponible);
                stmtSala.setInt(2, idSalaToUpdate);
                stmtSala.executeUpdate();
            }

            con.commit();

        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException rollbackException) {
                    rollbackException.printStackTrace();
                }
            }
            e.printStackTrace();
        }
    }

    private Time obtenerHoraActual() {
        LocalTime horaActual = LocalTime.now();
        return Time.valueOf(horaActual);
    }

    @Override
    public boolean updatePrestamo(PrestamoSalas prestamoSala) {
        return false;
    }

    private void updateEstadoSala(int id_sala, boolean updatedStatus) {
        try {
            String query = "UPDATE sala SET estado = ? WHERE id_sala = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setBoolean(1, updatedStatus);
            stmt.setInt(2, id_sala);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
