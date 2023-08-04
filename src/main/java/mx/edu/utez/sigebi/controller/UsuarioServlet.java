package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.Rol;
import mx.edu.utez.sigebi.model.Usuario;
import mx.edu.utez.sigebi.model.DAO.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "UserDao", value = "/login")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");

        UsuarioDao dao = new UsuarioDao();

        req.getSession().removeAttribute("mensaje");
        Usuario usr = (Usuario) dao.findOne(correo, contra);

        if ((usr.getId_usuario() != 0) && (usr.getCorreo_institucional().matches(".*@utez\\.edu\\.mx$"))) {
            req.getSession().setAttribute("sesion",usr);

            Rol rol = new Rol();

            rol.setTipo_usuario(usr.getRol().getTipo_usuario());
            req.getSession().setAttribute("tipoUsuario", rol.getTipo_usuario());


            if (rol.getTipo_usuario().equals("Administrador")) {
                resp.sendRedirect("admin.jsp");
            } else if (rol.getTipo_usuario().equals("Bibliotecario")) {
                resp.sendRedirect("bibliotecario.jsp");
            } else if (rol.getTipo_usuario().equals("Usuario UTEZ")) {
                resp.sendRedirect("inicio.jsp");
            }
        } else {
            req.getSession().setAttribute("mensaje", "El usuario o la contraseña son incorrectos");
            resp.sendRedirect("index.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("sesion");
        resp.sendRedirect("inicio.jsp");
    }

}
