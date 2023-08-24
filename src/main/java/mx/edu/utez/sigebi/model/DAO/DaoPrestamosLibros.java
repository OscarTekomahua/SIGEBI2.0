package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.HistorialLibrosPrestados;

import java.util.List;

public interface DaoPrestamosLibros {
    boolean registrarPrestamo(int idUsuario, int idLibro, String fecha_actual, String fecha_devolucion);
    List<HistorialLibrosPrestados> obtenerHistorialPrestamos();
    boolean actualizarEstadoPrestamo(int idPrestamo, String nuevoEstado);
    boolean registrarDevolucion(int idPrestamo);
    boolean registrarMulta(int idPrestamo, double monto);
    boolean tieneMultasPendientes(int idUsuario);
    boolean restarStock(int idLibro);
    boolean sumarStock(int idLibro);
    boolean verificarDisponibilidad(int idLibro);
}
