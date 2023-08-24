package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.PrestamosLibrosDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "PedirLibroServlet", value = "/PedirLibroServlet")
public class PedirLibroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
        int idLibro = Integer.parseInt(req.getParameter("idLibro"));
        String fecha_actual = req.getParameter("fecha_actual");
        PrestamosLibrosDao psDAO = new PrestamosLibrosDao();
        psDAO.solicitarLibro(idUsuario, idLibro, fecha_actual);
        resp.sendRedirect("inicio.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
