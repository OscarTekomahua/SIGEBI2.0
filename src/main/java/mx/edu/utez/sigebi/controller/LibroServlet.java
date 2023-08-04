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
import java.io.IOException;
import java.util.List;

@WebServlet (name = "LibroServlet", urlPatterns = {"/mostrarlibros", "/updateBook", "/deleteBook" })
public class LibroServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();
        switch (opcion){
            case "/mostrarlibros":
                if (req.getParameter("operacion").equals("stocklibros")) {
                    LibroDao dao = new LibroDao();

                    List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                    req.setAttribute("tablalibros", listalibro);
                }

                req.getRequestDispatcher("administrarStok.jsp").forward(req, resp);
              break;

            case "/deleteBook":



                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
