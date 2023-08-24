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

@WebServlet (name = "LibroServlet", urlPatterns = {"/mostrarlibros", "/updateBook", "/updateBookRegreso", "/updateBookAdmin","/updateBookRegresoAdmin","/deleteBook", "/deleteBookadmin","/mostrarlibrosadmin", "/mostrarlibrosvista" })
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
                double multaAcumulada = user.getMulta();

                List<ResultadosConsulta> listalibro = dao.getAllAttributes();

                //Definir fecha actual solo dia mes y año
                LocalDate fechaActual = LocalDate.now();

                req.setAttribute("multa", multaAcumulada);
                req.setAttribute("id_usuario", userId);
                req.setAttribute("tablalibros", listalibro);
                req.setAttribute("fechaActual", fechaActual);

                req.getRequestDispatcher("/catalogoLibros.jsp").forward(req, resp);
                break;

            case "/updateBook":
                LibroDao dao1 = new LibroDao();
                int id_libro = Integer.parseInt(req.getParameter("id"));

                ResultadosConsulta libro =  dao1.MostrarLibroid(id_libro);
                System.out.println(libro.getId_libro());
                System.out.println(libro.getTitulo());
                req.getSession().setAttribute("libro", libro);
                req.getRequestDispatcher("modificarLibroAdmin.jsp").forward(req, resp);

                break;
            case "/updateBookRegreso":
                System.out.println("Entro para modificar el lbro");
                LibroDao dao11 = new LibroDao();
                int id_libro1 = Integer.parseInt(req.getParameter("id"));
                String isbn =req.getParameter("isbn");
                String titulo =req.getParameter("titulo");
                String autor =req.getParameter("autor");
                int ejemplares = Integer.parseInt(req.getParameter("stock"));
                boolean envio = dao11.updateLibro(new ResultadosConsulta(id_libro1,isbn,titulo,autor,ejemplares));
                if(envio){
                    LibroDao dao111 = new LibroDao();
                    List<ResultadosConsulta> listalibroo = dao111.getAllAttributes();
                    req.setAttribute("tablalibros", listalibroo);
                    req.getRequestDispatcher("administrarStockAdmin.jsp").forward(req, resp);
                }
                break;


            case "/updateBookAdmin":
                dao1 = new LibroDao();
                id_libro = Integer.parseInt(req.getParameter("id"));

                libro =  dao1.MostrarLibroid(id_libro);
                System.out.println(libro.getId_libro());
                System.out.println(libro.getTitulo());
                req.getSession().setAttribute("libro", libro);
                req.getRequestDispatcher("modificarLibro.jsp").forward(req, resp);

                break;
            case "/updateBookRegresoAdmin":
                System.out.println("Entro para modificar el lbro");
                dao11 = new LibroDao();
                id_libro1 = Integer.parseInt(req.getParameter("id"));
                isbn =req.getParameter("isbn");
                titulo =req.getParameter("titulo");
                autor =req.getParameter("autor");
                ejemplares = Integer.parseInt(req.getParameter("stock"));
                envio = dao11.updateLibro(new ResultadosConsulta(id_libro1,isbn,titulo,autor,ejemplares));
                if(envio){
                    LibroDao dao111 = new LibroDao();
                    List<ResultadosConsulta> listalibroo = dao111.getAllAttributes();
                    req.setAttribute("tablalibros", listalibroo);
                    req.getRequestDispatcher("administrarStok.jsp").forward(req, resp);
                }
                break;


            default:
                System.out.println("No entro a ninguna sentencia");

        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
