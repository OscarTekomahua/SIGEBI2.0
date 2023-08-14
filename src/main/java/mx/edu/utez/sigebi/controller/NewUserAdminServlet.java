package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.RolDao;
import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.Persona;
import mx.edu.utez.sigebi.model.Rol;
import mx.edu.utez.sigebi.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet (name = "NewUserAdminServlet", value = "/NewUserForAdmin")
public class NewUserAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String respuesta = "usuariosadmin.jsp";
        RolDao rolDao = new RolDao();

        if (req.getParameter("operacion").equals("nuevousuario")) {
            respuesta = "nuevousuario.jsp";
            List<Rol> roles = rolDao.findAdminBiblio();

            req.getSession().setAttribute("roles", roles);
        }

        resp.sendRedirect(respuesta);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String nombre =  req.getParameter("nombre");
        String apellido1 = req.getParameter("apellidoPaterno");
        String apellido2 = req.getParameter("apellidoMaterno");
        int idRol = Integer.parseInt(req.getParameter("rol"));

        UsuarioDao dao = new UsuarioDao();
        Usuario newusr = new Usuario();
        Persona newperson = new Persona();

        newusr.setCorreo_institucional(correo);
        newusr.setContra(contra);

        newperson.setNombre(nombre);
        newperson.setApellido1(apellido1);
        newperson.setApellido2(apellido2);

        boolean correoExiste = dao.correoExiste(correo);

        String correoRegex = ".*@utez\\.edu\\.mx$";
        Pattern patt = Pattern.compile(correoRegex);
        Matcher matcher = patt.matcher(correo);

        if (!matcher.matches()) {
            String mensajeError = "¡Correo Inválido!";
            req.getSession().setAttribute("error", mensajeError);
            resp.sendRedirect("nuevousuario.jsp");
        } else if (correoExiste) {
            String mensajeError = "¡Ya existe una cuenta con ese correo!";
            req.getSession().setAttribute("error", mensajeError);
            resp.sendRedirect("nuevousuario.jsp");
        } else {
            boolean registroHecho = dao.registrarNuevoUsuario(newperson, newusr, idRol);
            if (registroHecho) {
                resp.sendRedirect("admin.jsp");
            } else {
                resp.sendRedirect("failedAccess.jsp");
            }
        }
    }
}
