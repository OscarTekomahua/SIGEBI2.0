package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.PrestamoLibros;
import mx.edu.utez.sigebi.utils.MysqlConector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PrestamosLibrosDao implements DaoPrestamosLibros {
    private Connection con;
    private List<PrestamoLibros> prestamoLibros;
    private PrestamoLibros librosprestados;
    private boolean resp;

    public boolean solicitarLibro(int idUsr, int idBook, String fecha_actual) {
        try {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO prestamolibro (id_libro, id_usuario, fecha_prestamo, estado_prestamo) VALUES (?, ?, ?, ?)");
            stmt.setInt(1, idBook);
            stmt.setInt(2, idUsr);
            stmt.setString(3, fecha_actual);
            stmt.setString(4, "Prestado");
            stmt.executeUpdate();
            resp = true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public PrestamosLibrosDao() {
        this.con = new MysqlConector().connect();
        this.prestamoLibros = new ArrayList<>();
        this.librosprestados = new PrestamoLibros();
        this.resp = false;
    }

    @Override
    public boolean registrarPrestamo(int idUsuario, int idLibro) {
        try {
            String insertQuery = "INSERT INTO prestamolibro (id_libro, id_usuario, fecha_prestamo, estado_prestamo) VALUES (?, ?, NOW(), ?)";
            String updateStockQuery = "UPDATE libro SET ejemplares = ejemplares - 1 WHERE id_libro = ?";

            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
            PreparedStatement updateStockStmt = con.prepareStatement(updateStockQuery);

            insertStmt.setInt(1, idLibro);
            insertStmt.setInt(2, idUsuario);
            insertStmt.setString(3, "Prestado");

            updateStockStmt.setInt(1, idLibro);

            con.setAutoCommit(false);

            int rowsInserted = insertStmt.executeUpdate();
            int rowsUpdated = updateStockStmt.executeUpdate();

            if (rowsInserted > 0 && rowsUpdated > 0) {
                con.commit();
                return true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public List<PrestamoLibros> obtenerPrestamosPendientes() {
        List<PrestamoLibros> prestamos = new ArrayList<>();
        try {
            String selectQuery = "SELECT * FROM prestamolibro WHERE estado_prestamo = 'Prestado'";
            PreparedStatement stmt = con.prepareStatement(selectQuery);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PrestamoLibros prestamo = new PrestamoLibros();
                prestamo.setIdPrestamo(rs.getInt("id_prestamo"));
                prestamo.setIdLibro(rs.getInt("id_libro"));
                prestamo.setIdUsuario(rs.getInt("id_usuario"));
                prestamo.setFecha_prestamo(rs.getDate("fecha_prestamo"));
                prestamo.setFecha_devolcion(rs.getDate("fecha_devolucion"));
                prestamo.setEstadoPrestamo(rs.getString("estado_prestamo"));
                prestamo.setMulta(rs.getDouble("multa"));
                prestamos.add(prestamo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prestamos;
    }

    @Override
    public boolean actualizarEstadoPrestamo(int idPrestamo, String nuevoEstado) {
        try {
            String updateQuery = "UPDATE prestamolibro SET estado_prestamo = ? WHERE id_prestamo = ?";
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setString(1, nuevoEstado);
            stmt.setInt(2, idPrestamo);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean registrarDevolucion(int idPrestamo) {
        try {
            String updateQuery = "UPDATE prestamolibro SET estado_prestamo = 'Devuelto', fecha_devolucion = NOW() WHERE id_prestamo = ?";
            String updateStockQuery = "UPDATE libro SET ejemplares = ejemplares + 1 WHERE id_libro = (SELECT id_libro FROM prestamolibro WHERE id_prestamo = ?)";

            PreparedStatement updateStmt = con.prepareStatement(updateQuery);
            PreparedStatement updateStockStmt = con.prepareStatement(updateStockQuery);

            updateStmt.setInt(1, idPrestamo);
            updateStockStmt.setInt(1, idPrestamo);

            con.setAutoCommit(false);

            int rowsUpdated = updateStmt.executeUpdate();
            int rowsStockUpdated = updateStockStmt.executeUpdate();

            if (rowsUpdated > 0 && rowsStockUpdated > 0) {
                con.commit();
                return true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean registrarMulta(int idPrestamo, double monto) {
        try {
            String updateQuery = "UPDATE prestamolibro SET multa = ? WHERE id_prestamo = ?";
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setDouble(1, monto);
            stmt.setInt(2, idPrestamo);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean tieneMultasPendientes(int idUsuario) {
        try {
            String selectQuery = "SELECT COUNT(*) FROM prestamolibro WHERE id_usuario = ? AND multa > 0";
            PreparedStatement stmt = con.prepareStatement(selectQuery);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean restarStock(int idLibro) {
        try {
            String updateQuery = "UPDATE libro SET ejemplares = ejemplares - 1 WHERE id_libro = ?";
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setInt(1, idLibro);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean sumarStock(int idLibro) {
        try {
            String updateQuery = "UPDATE libro SET ejemplares = ejemplares + 1 WHERE id_libro = ?";
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setInt(1, idLibro);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean verificarDisponibilidad(int idLibro) {
        try {
            String selectQuery = "SELECT ejemplares FROM libro WHERE id_libro = ?";
            PreparedStatement stmt = con.prepareStatement(selectQuery);
            stmt.setInt(1, idLibro);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int ejemplares = rs.getInt("ejemplares");
                return ejemplares > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
