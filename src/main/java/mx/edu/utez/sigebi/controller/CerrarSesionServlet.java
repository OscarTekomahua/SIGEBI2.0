package mx.edu.utez.sigebi.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet (name = "CerrarSesionServlet", value = "/CloseSession")
public class CerrarSesionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String respuesta = "bibliotecario.jsp";

        if (req.getParameter("operacion").equals("cerrarsesion")) {
            respuesta = "index.jsp";

            HttpSession sesion = req.getSession();
            sesion.invalidate();
        }

        resp.sendRedirect(respuesta);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
