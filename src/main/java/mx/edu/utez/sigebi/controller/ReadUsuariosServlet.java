package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.UsuarioInter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name = "ReadUsuariosAdminServlet", urlPatterns = {"/readUsersAdmin", "/readUsersBiblio"})
public class ReadUsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {
            case "/readUsersAdmin":
                if (req.getParameter("operacion").equals("usuarios")) {

                    UsuarioDao userDao = new UsuarioDao();

                    List<UsuarioInter> usuarios = userDao.findAll();

                    req.setAttribute("users", usuarios);

                }

                req.getRequestDispatcher("usuariosadmin.jsp").forward(req, resp);
                break;

            case "/readUsersBiblio":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
