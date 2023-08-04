package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.DAO.CategoriaDao;
import mx.edu.utez.sigebi.model.DAO.EditorialDao;
import mx.edu.utez.sigebi.model.Editorial;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "EditorialServlet", urlPatterns = {"/createEditorial", "/readEditorial", "/updateEditorial", "/deleteEditorial"})
public class EditorialServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();
        switch (opcion) {
            case "/createEditorial":
                String nuevaEditorial = req.getParameter("editorial");

                EditorialDao editDao = new EditorialDao();

                Editorial neweditorial = new Editorial();

                neweditorial.setNombre(nuevaEditorial);

                boolean editExiste = editDao.editorialExiste(nuevaEditorial);

                if (editExiste) {
                    String mensajeError = "¡Ya existe una editorial " + nuevaEditorial + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formularioeditorial.jsp");
                } else {
                    boolean editorialRegistrada = editDao.insert(neweditorial);

                    if (editorialRegistrada) {
                        resp.sendRedirect("administrarStok.jsp");
                    }
                }

                break;
            case "/readEditorial":

                break;
            case "/updateEditorial":

                break;
            case "/deleteEditorial":

                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
