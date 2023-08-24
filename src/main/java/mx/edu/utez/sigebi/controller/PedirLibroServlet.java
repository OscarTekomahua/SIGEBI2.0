package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.LibroDao;
import mx.edu.utez.sigebi.model.DAO.PrestamosLibrosDao;
import mx.edu.utez.sigebi.model.ResultadosConsulta;
import mx.edu.utez.sigebi.model.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "PedirLibroServlet", value = "/PedirLibroServlet")
public class PedirLibroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        String fecha_actual = req.getParameter("fecha_actual");
        String fecha_devolucion = calcularFechaDevolucion();
        PrestamosLibrosDao psDAO = new PrestamosLibrosDao();
        psDAO.registrarPrestamo(idUsuario, idLibro, fecha_actual, fecha_devolucion);
        req.getSession().setAttribute("mensaje", "Libro Solicitado");
        LibroDao dao = new LibroDao();

        HttpSession session = req.getSession();

        Usuario user = (Usuario) session.getAttribute("sesion");

        int userId = user.getId_usuario();

        List<ResultadosConsulta> listalibro = dao.getAllAttributes();

        //Definir fecha actual solo dia mes y año
        LocalDate fechaActual = LocalDate.now();

        req.setAttribute("id_usuario", userId);
        req.setAttribute("tablalibros", listalibro);
        req.setAttribute("fechaActual", fechaActual);

        req.getRequestDispatcher("/catalogoLibros.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public static String calcularFechaDevolucion() {
        LocalDate fechaActual = LocalDate.now();
        LocalDate fechaDevolucion = fechaActual.plusDays(10);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fechaDevolucionString = fechaDevolucion.format(formatter);

        return fechaDevolucionString;
    }
}
