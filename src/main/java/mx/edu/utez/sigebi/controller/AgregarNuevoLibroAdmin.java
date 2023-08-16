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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@WebServlet (name = "AddNewBookAdmin", value = "/AddNewBookAdmin")
@MultipartConfig
public class AgregarNuevoLibroAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String respuesta = "admin.jsp";
        EditorialDao editDao = new EditorialDao();
        CategoriaDao catDao = new CategoriaDao();

        if (req.getParameter("operacion").equals("nuevolibro")) {
            respuesta ="agregarlibroAdmin.jsp";

            List<Editorial> listaeditoriales = editDao.findAll();
            req.getSession().setAttribute("editoriales", listaeditoriales);

            List<Categoria> listacategorias = catDao.findAll();
            req.getSession().setAttribute("categorias", listacategorias);
        }
        resp.sendRedirect(respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String isbn = req.getParameter("isbn");
        String titulo = req.getParameter("titulo");
        String autor = req.getParameter("autor");
        List<Integer> idEditoriales = obtenerIdsSeleccionados(req.getParameterValues("editoriales"));
        List<Integer> idCategorias = obtenerIdsSeleccionados(req.getParameterValues("categorias"));
        String ejemplaresStr = req.getParameter("ejemplares");
        int ejemplares = 0;

        if (ejemplaresStr != null && !ejemplaresStr.isEmpty()) {
            try {
                ejemplares = Integer.parseInt(ejemplaresStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        String UPLOAD_DIRECTORY = req.getServletContext().getRealPath("/") + "assets/img";
        String filePath = "";

        try {
            Part filePart = req.getPart("imagen");
            String fileName = getSubmittedFileName(filePart);

            // Generar nombre unico con UUID
            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;

            filePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;
            InputStream fileContent = filePart.getInputStream();

            //una ves termine este proceso el archivo ya esta en assets
            Files.copy(fileContent, Paths.get(filePath));

        } catch (Exception e) {
            e.printStackTrace();
        }

        LibroDao libroDao = new LibroDao();
        Libro newlibro = new Libro(0, titulo, autor, ejemplares, isbn, filePath);
        boolean existo = libroDao.insert(newlibro, idEditoriales, idCategorias);
        if (existo) {
            LibroDao dao = new LibroDao();

            List<ResultadosConsulta> listalibro = dao.getAllAttributes();

            req.setAttribute("tablalibros", listalibro);

            req.getRequestDispatcher("administrarStockAdmin.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("revisarHistorial.jsp");
        }
    }

    private List<Integer> obtenerIdsSeleccionados (String[] valoresSeleccionados) {
        if (valoresSeleccionados != null) {
            return IntStream.of(Arrays.stream(valoresSeleccionados).mapToInt(Integer::parseInt).toArray()).boxed().collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

}
