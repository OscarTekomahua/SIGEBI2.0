package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.DAO.CategoriaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "CategoriaServlet", urlPatterns = {"/createCategoria", "/readCategoria", "/updateCategoria", "/deleteCategoria"})
public class CategoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/createCategoria":
                String nombreCategoria = req.getParameter("categoria");

                CategoriaDao catDao = new CategoriaDao();

                Categoria newcategoria = new Categoria();

                newcategoria.setNombre_categoria(nombreCategoria);

                boolean categoriaExiste = catDao.catExiste(nombreCategoria);

                if (categoriaExiste) {
                    String mensajeError = "¡Ya existe una categoria " + nombreCategoria + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formulariocategoria.jsp");
                } else {
                    boolean catRegistrada = catDao.insert(newcategoria);

                    if (catRegistrada) {
                        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                        resp.setHeader("Pragma", "no-cache");
                        resp.setDateHeader("Expires", 0);
                        resp.sendRedirect("agregarlibro.jsp");
                    }
                }

                break;
            case "/readCategoria":
                break;
            case "/updateCategoria":
                break;
            case "/deleteCategoria":
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
