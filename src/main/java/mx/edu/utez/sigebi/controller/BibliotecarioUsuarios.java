package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.PrestamosLibrosDao;
import mx.edu.utez.sigebi.model.HistorialLibrosPrestados;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "BibliotecarioUsuarios", value = "/BibliotecarioUsuarios")
public class BibliotecarioUsuarios extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("operacion").equals("usuarios")) {
            PrestamosLibrosDao prestamosDao = new PrestamosLibrosDao();
            List<HistorialLibrosPrestados> historialPrestamos = prestamosDao.obtenerHistorialPrestamos();
            List<HistorialLibrosPrestados> historialDevueltos = prestamosDao.obtenerHistorialDevueltos();

            req.getSession().setAttribute("historial2", historialDevueltos);
            req.getSession().setAttribute("historial", historialPrestamos);
        }

        req.getRequestDispatcher("/usuarios.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
