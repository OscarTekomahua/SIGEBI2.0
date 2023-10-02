package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.Persona;
import mx.edu.utez.sigebi.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet (name = "SignUpUser", value = "/RegistrarUsuarioServlet")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String nombre =  req.getParameter("nombre");
        String apellido1 = req.getParameter("apellido1");
        String apellido2 = req.getParameter("apellido2");

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
            //resp.sendRedirect("registro.jsp");
        } else if (correoExiste) {
            String mensajeError = "¡Ya existe una cuenta con ese correo!";
            req.getSession().setAttribute("error", mensajeError);
            //resp.sendRedirect("registro.jsp");
        } else {
            boolean registroHecho = dao.insert(newperson, newusr);
            if (registroHecho) {
                String mensajeError = "¡Registro realizado con éxito!";
                req.getSession().setAttribute("error", mensajeError);
                resp.sendRedirect(" index.jsp");
            } else {
                resp.sendRedirect("failedAccess.jsp");
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("sesion");
        resp.sendRedirect("inicio.jsp");
    }
}
