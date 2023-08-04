package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet (name = "RestablecerContra", value = "/RestablecerContraUsuarioServlet")
public class RestablecerContraUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String correo = req.getParameter("correo");

        UsuarioDao usuarioDao =  new UsuarioDao();

        boolean correoRegistrado = usuarioDao.correoExiste(correo);

        if (correoRegistrado) {
            String newCode = usuarioDao.generadorCodigo();

            usuarioDao.updateCode(correo, newCode);

            String codigoRestablecimiento = usuarioDao.obtenerCodigoRestablecimiento(correo);


            if (codigoRestablecimiento != null) {
                usuarioDao.enviarCodigoPorCorreo(correo, codigoRestablecimiento);

                resp.sendRedirect("codigo.jsp?correo=" + URLEncoder.encode(correo, "UTF-8"));

            } else {
                req.getSession().setAttribute("error", "Hubo un problema al obtener el código de restablecimiento. Inténtalo nuevamente.");
                resp.sendRedirect("correo.jsp");
            }
        } else {
            req.getSession().setAttribute("error", "El correo electrónico no está registrado");
            resp.sendRedirect("correo.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("codigo.jsp");
        dispatcher.forward(req, resp);
    }
}
