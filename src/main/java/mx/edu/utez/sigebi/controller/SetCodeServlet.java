package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.Usuario;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet (name = "SetCodeServlet", value = "/SetCodeServlet")
public class SetCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String codigo = req.getParameter("codigo");
        String correo = req.getParameter("correo");


        UsuarioDao dao = new UsuarioDao();

        String codigoAlmacenado = dao.obtenerCodigoRestablecimiento(correo);

        //Session session = req.getSession();

        if (codigoAlmacenado.equals(codigo)) {
            resp.sendRedirect("restablecer.jsp?correo=" + URLEncoder.encode(correo, "UTF-8"));
        } else {
            req.setAttribute("error", "El codigo ingresado no corresponde al enviado por correo");
            RequestDispatcher dispatcher = req.getRequestDispatcher("codigo.jsp");
            dispatcher.forward(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
