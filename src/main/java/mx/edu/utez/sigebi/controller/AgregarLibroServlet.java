package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.Categoria;
import mx.edu.utez.sigebi.model.DAO.CategoriaDao;
import mx.edu.utez.sigebi.model.DAO.EditorialDao;
import mx.edu.utez.sigebi.model.DAO.LibroDao;
import mx.edu.utez.sigebi.model.Editorial;
import mx.edu.utez.sigebi.model.Libro;
import mx.edu.utez.sigebi.model.ResultadosConsulta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet (name = "AgregarLibroServlet", urlPatterns = {"/addnewBookBiblio", "/addnewBookAdmin"})
public class AgregarLibroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();
        String respuesta = "";
        EditorialDao editDao = new EditorialDao();
        List<Editorial> listaeditoriales;
        CategoriaDao catDao = new CategoriaDao();
        List<Categoria> listacategorias;

        switch (opcion) {
            case "/addnewBookBiblio":
                respuesta ="bibliotecario.jsp";

                if (req.getParameter("operacion").equals("nuevolibro")) {
                    respuesta ="agregarlibro.jsp";

                    listaeditoriales = editDao.findAll();
                    req.getSession().setAttribute("editoriales", listaeditoriales);

                    listacategorias = catDao.findAll();
                    req.getSession().setAttribute("categorias", listacategorias);
                }
                resp.sendRedirect(respuesta);
                break;

            case "/addnewBookAdmin":
                respuesta ="admin.jsp";

                if (req.getParameter("operacion").equals("nuevolibro")) {
                    respuesta ="agregarlibroAdmin.jsp";

                    listaeditoriales = editDao.findAll();
                    req.getSession().setAttribute("editoriales", listaeditoriales);

                    listacategorias = catDao.findAll();
                    req.getSession().setAttribute("categorias", listacategorias);
                }
                resp.sendRedirect(respuesta);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        String titulo = req.getParameter("titulo");
        String autor = req.getParameter("autor");
        int ejemplares = Integer.parseInt(req.getParameter("ejemplares"));
        String isbn = req.getParameter("isbn");
        String imagen = req.getParameter("imagen");

        List<Integer> idEditoriales = obtenerIdsSeleccionados(req.getParameterValues("editoriales"));
        List<Integer> idCategorias = obtenerIdsSeleccionados(req.getParameterValues("categorias"));

        LibroDao libroDao = new LibroDao();
        Libro newlibro = new Libro(0, titulo, autor, ejemplares, isbn, imagen);

        boolean existo = libroDao.insert(newlibro, idEditoriales, idCategorias);

        switch (opcion) {
            case "/addnewBookBiblio":
                if (existo) {
                    LibroDao dao = new LibroDao();

                    List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                    req.setAttribute("tablalibros", listalibro);

                    req.getRequestDispatcher("administrarStok.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("revisarHistorial.jsp");
                }
                break;

            case "/addnewBookAdmin":
                if (existo) {
                    LibroDao dao = new LibroDao();

                    List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                    req.setAttribute("tablalibros", listalibro);

                    req.getRequestDispatcher("administrarStockAdmin.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("revisarHistorial.jsp");
                }
                break;
        }
    }
    private List<Integer> obtenerIdsSeleccionados (String[] valoresSeleccionados) {
        if (valoresSeleccionados != null) {
            return IntStream.of(Arrays.stream(valoresSeleccionados).mapToInt(Integer::parseInt).toArray()).boxed().collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

}
