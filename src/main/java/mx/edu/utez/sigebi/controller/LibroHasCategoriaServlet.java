package mx.edu.utez.sigebi.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "LibroHasCategoriaServlet", urlPatterns = {"/createLibroHasCategoria", "/readLibroHasCategoria", "/updateLibroHasCategoria", "/deleteLibroHasCategoria"})
public class LibroHasCategoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/createLibroHasCategoria":

                break;
            case "/readLibroHasCategoria":

                break;
            case "/updateLibroHasCategoria":

                break;
            case "/deleteLibroHasCategoria":

                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
