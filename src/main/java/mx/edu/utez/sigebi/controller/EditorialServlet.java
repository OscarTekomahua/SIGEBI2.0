package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.DAO.CategoriaDao;
import mx.edu.utez.sigebi.model.DAO.EditorialDao;
import mx.edu.utez.sigebi.model.DAO.LibroDao;
import mx.edu.utez.sigebi.model.Editorial;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet (name = "EditorialServlet", urlPatterns = {"/createEditorial", "/createEditorialAdmin","/createEditorialMod", "/readEditorial", "/readEditorialAdmin", "/updateEditorial", "/deleteEditorial"})
public class    EditorialServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        String nuevaEditorial = req.getParameter("editorial");

        EditorialDao editDao = new EditorialDao();

        boolean editExiste = editDao.editorialExiste(nuevaEditorial);



        switch (opcion) {
            case "/createEditorial":
                if (editExiste) {
                    String mensajeError = "¡Ya existe una editorial " + nuevaEditorial + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formularioeditorial.jsp");
                } else {
                    Editorial neweditorial = new Editorial();

                    neweditorial.setNombre(nuevaEditorial);

                    boolean editorialRegistrada = editDao.insert(neweditorial);

                    if (editorialRegistrada) {
                        List<Editorial> listaeditoriales = editDao.findAll();
                        req.getSession().setAttribute("editoriales", listaeditoriales);

                        CategoriaDao catDao = new CategoriaDao();
                        List<Categoria> listacategorias = catDao.findAll();
                        req.getSession().setAttribute("categorias", listacategorias);

                        resp.sendRedirect("agregarlibro.jsp");
                    }
                }
                break;

            case "/createEditorialAdmin":
                if (editExiste) {
                    String mensajeError = "¡Ya existe una editorial " + nuevaEditorial + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formularioeditorialAdmin.jsp");
                } else {
                    Editorial neweditorial = new Editorial();

                    neweditorial.setNombre(nuevaEditorial);

                    boolean editorialRegistrada = editDao.insert(neweditorial);

                    if (editorialRegistrada) {
                        List<Editorial> listaeditoriales = editDao.findAll();
                        req.getSession().setAttribute("editoriales", listaeditoriales);

                        CategoriaDao catDao = new CategoriaDao();
                        List<Categoria> listacategorias = catDao.findAll();
                        req.getSession().setAttribute("categorias", listacategorias);

                        resp.sendRedirect("agregarlibro.jsp");
                    }
                }
                break;

            case "/createEditorialMod":
                if (editExiste) {
                    String mensajeError = "¡Ya existe una editorial " + nuevaEditorial + "!";
                    req.getSession().setAttribute("error", mensajeError);
                    resp.sendRedirect("formularioeditorial.jsp");
                } else {
                    Editorial neweditorial = new Editorial();

                    neweditorial.setNombre(nuevaEditorial);

                    boolean editorialRegistrada = editDao.insert(neweditorial);

                    if (editorialRegistrada) {
                        List<Editorial> listaeditoriales = editDao.findAll();
                        req.getSession().setAttribute("editoriales", listaeditoriales);

                        CategoriaDao catDao = new CategoriaDao();
                        List<Categoria> listacategorias = catDao.findAll();
                        req.getSession().setAttribute("categorias", listacategorias);

                        resp.sendRedirect("editoriales.jsp");
                    }
                }
                break;


            case "/readEditorial":
                break;


            case "/updateEditorial":
                int idEditorial = Integer.parseInt(req.getParameter("idEditorial"));
                System.out.println(idEditorial);
                String nuevoNombre = req.getParameter("nuevoNombre"); // Asegúrate de tener un campo en tu formulario con el nombre nuevo
                if (nuevoNombre == null || nuevoNombre.trim().isEmpty()) {
                    // Mostrar mensaje de error en caso de nombre vacío
                    req.setAttribute("error", "Por favor, ingrese un nombre válido.");
                    resp.sendRedirect(req.getContextPath() + "/readEditorial?operacion=editoriales");
                    return;
                }
                editDao = new EditorialDao();
                Editorial editorial = new Editorial(idEditorial, nuevoNombre);
                boolean actualizado = editDao.update(idEditorial, editorial);
                if (actualizado) {
                    // Realiza las acciones necesarias después de la actualización
                    resp.sendRedirect(req.getContextPath() + "/readEditorial?operacion=editoriales");
                } else {
                    // Manejo de error si la actualización falla
                    // Redirecciona a una página de error o muestra un mensaje de error
                }
                break;

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/readEditorial":
                if (req.getParameter("operacion").equals("editoriales")) {

                    EditorialDao editorialDao = new EditorialDao();

                    List<Editorial> editoriales = editorialDao.findAll();

                    req.setAttribute("editoriales", editoriales);
                }

                req.getRequestDispatcher("editoriales.jsp").forward(req, resp);
                break;

            case "/readEditorialAdmin":
                if (req.getParameter("operacion").equals("editoriales")) {

                    EditorialDao editorialDao = new EditorialDao();

                    List<Editorial> editoriales = editorialDao.findAll();

                    req.setAttribute("editoriales", editoriales);
                }

                req.getRequestDispatcher("editorialesAdmin.jsp").forward(req, resp);
                break;

            case "/deleteEditorial":
                int idEditorial = Integer.parseInt(req.getParameter("idEditorial"));
                System.out.println(idEditorial);
                EditorialDao dao2 = new EditorialDao();
                dao2.delete(idEditorial);

                String referer = req.getHeader("referer");
                resp.sendRedirect(referer);
                break;


        }

    }

}
