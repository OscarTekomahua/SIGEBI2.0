package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.UsuarioInter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "BajaUsuario", value = "/BajaUsuarioServlet")
public class BajaUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(req.getParameter("idUser"));
        int idPersona = Integer.parseInt(req.getParameter("idPersona"));

        UsuarioDao userdao = new UsuarioDao();

        userdao.delete(idUsuario);
        userdao.deletePersona(idPersona);

        List<UsuarioInter> usuarios = userdao.findAll();

        req.setAttribute("users", usuarios);

        req.getRequestDispatcher("usuariosadmin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
