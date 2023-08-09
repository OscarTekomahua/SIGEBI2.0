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
import java.io.PrintWriter;
import java.util.List;

@WebServlet (name = "CategoriaServlet", urlPatterns = {"/createCategoria", "/createCategoriaAdmin","/readCategoria", "/readCategoriaAdmin","/updateCategoria", "/deleteCategoria"})
public class CategoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        String nombreCategoria = req.getParameter("categoria");

        CategoriaDao catDao = new CategoriaDao();

        boolean categoriaExiste = catDao.catExiste(nombreCategoria);

        switch (opcion) {
            case "/createCategoria":
                if (categoriaExiste) {
                    String mensajeError = "¡Ya existe una categoria " + nombreCategoria + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formulariocategoria.jsp");
                } else {
                    Categoria newcategoria = new Categoria();

                    newcategoria.setNombre_categoria(nombreCategoria);

                    boolean catRegistrada = catDao.insert(newcategoria);

                    if (catRegistrada) {
                        EditorialDao editDao = new EditorialDao();
                        List<Editorial> listaeditoriales = editDao.findAll();
                        req.getSession().setAttribute("editoriales", listaeditoriales);

                        List<Categoria> listacategorias = catDao.findAll();
                        req.getSession().setAttribute("categorias", listacategorias);

                        resp.sendRedirect("agregarlibro.jsp");
                    }
                }
                break;

            case "/createCategoriaAdmin":
                if (categoriaExiste) {
                    String mensajeError = "¡Ya existe una categoria " + nombreCategoria + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formulariocategoriaAdmin.jsp");
                } else {
                    Categoria newcategoria = new Categoria();

                    newcategoria.setNombre_categoria(nombreCategoria);

                    boolean catRegistrada = catDao.insert(newcategoria);

                    if (catRegistrada) {
                        EditorialDao editDao = new EditorialDao();
                        List<Editorial> listaeditoriales = editDao.findAll();
                        req.getSession().setAttribute("editoriales", listaeditoriales);

                        List<Categoria> listacategorias = catDao.findAll();
                        req.getSession().setAttribute("categorias", listacategorias);

                        resp.sendRedirect("agregarlibroAdmin.jsp");
                    }
                }
                break;

            case "/updateCategoria":
                break;

            case "/deleteCategoria":
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/readCategoria":

                if (req.getParameter("operacion").equals("categorias")) {

                    CategoriaDao categoriaDao = new CategoriaDao();

                    List<Categoria> categorias = categoriaDao.findAll();

                    req.setAttribute("categorias", categorias);

                }

                req.getRequestDispatcher("categorias.jsp").forward(req, resp);

                break;

            case "/readCategoriaAdmin":
                if (req.getParameter("operacion").equals("categorias")) {

                    CategoriaDao categoriaDao = new CategoriaDao();

                    List<Categoria> categorias = categoriaDao.findAll();

                    req.setAttribute("categorias", categorias);

                }

                req.getRequestDispatcher("categoriasAdmin.jsp").forward(req, resp);
                break;

            case "/deleteCategoria":
                int idCategoria = Integer.parseInt(req.getParameter("idCategoria"));
                CategoriaDao dao2 = new CategoriaDao();
                dao2.delete(idCategoria);

                String referer = req.getHeader("referer");
                resp.sendRedirect(referer);
                break;
        }
    }

}

//g
