package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.LibroDao;
import mx.edu.utez.sigebi.model.ResultadosConsulta;
import mx.edu.utez.sigebi.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet (name = "LibroServlet", urlPatterns = {"/mostrarlibros", "/updateBook", "/deleteBook", "/deleteBookadmin","/mostrarlibrosadmin", "/mostrarlibrosvista" })
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

            case "/mostrarlibrosadmin":
                if (req.getParameter("operacion").equals("stocklibros")) {
                    LibroDao dao = new LibroDao();

                    List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                    req.setAttribute("tablalibros", listalibro);
                }


                req.getRequestDispatcher("administrarStockAdmin.jsp").forward(req, resp);
                break;

            case "/deleteBook":
                 int id = Integer.parseInt(req.getParameter("id"));
                    System.out.println(id);
                    LibroDao dao2 = new LibroDao();
                    dao2.delete(id);
                resp.sendRedirect(req.getContextPath() + "/mostrarlibros?operacion=stocklibros");
                break;

            case "/deleteBookadmin":
                id = Integer.parseInt(req.getParameter("id"));
                System.out.println(id);
                dao2 = new LibroDao();
                dao2.delete(id);
                resp.sendRedirect(req.getContextPath() + "/mostrarlibrosadmin?operacion=stocklibros");
                break;

            case "/mostrarlibrosvista":
                LibroDao dao = new LibroDao();

                HttpSession session = req.getSession();

                Usuario user = (Usuario) session.getAttribute("sesion");

                int userId = user.getId_usuario();

                List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                //Definir fecha actual solo dia mes y año
                LocalDate fechaActual = LocalDate.now();

                req.setAttribute("id_usuario", userId);
                req.setAttribute("tablalibros", listalibro);
                req.setAttribute("fechaActual", fechaActual);

                req.getRequestDispatcher("/catalogoLibros.jsp").forward(req, resp);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
