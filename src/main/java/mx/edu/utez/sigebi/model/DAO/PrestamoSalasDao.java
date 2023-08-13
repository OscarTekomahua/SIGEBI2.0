package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.PrestamoSalas;
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

    public boolean existePrestamoEnHorario(int idSala, Time horaInicio, Time horaFin) {
        try {
            String query = "SELECT COUNT(*) AS count FROM prestamosala WHERE id_sala = ? " +
                    "AND (estado = 'Prestada' OR estado = 'Reservada') " +
                    "AND ((hora_inicio BETWEEN ? AND ?) OR (hora_fin BETWEEN ? AND ?))";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idSala);
            stmt.setTime(2, horaInicio);
            stmt.setTime(3, horaFin);
            stmt.setTime(4, horaInicio);
            stmt.setTime(5, horaFin);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

}
