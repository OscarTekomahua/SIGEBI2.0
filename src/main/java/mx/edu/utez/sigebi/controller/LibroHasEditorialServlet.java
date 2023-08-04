package mx.edu.utez.sigebi.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "LibroHasEditorialServlet", urlPatterns = {"/createLibroHasEditorialServlet", "/readLibroHasEditorialServlet", "/updateLibroHasEditorialServlet", "/deleteLibroHasEditorialServlet"})
public class LibroHasEditorialServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/createLibroHasEditorialServlet":
                break;
            case "/readLibroHasEditorialServlet":
                break;
            case "/updateLibroHasEditorialServlet":
                break;
            case "/deleteLibroHasEditorialServlet":
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
