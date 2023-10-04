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

        // Intenta eliminar al usuario y guarda el resultado
        boolean usuarioEliminado = userdao.delete(idUsuario);

        // Verifica si se eliminó el usuario y muestra un mensaje en la consola
        if (userdao.delete(idUsuario) == usuarioEliminado && userdao.getErrorMessage()==0) {
            System.out.println("Usuario eliminado correctamente.");
            req.setAttribute("eliminacionExitosa", usuarioEliminado);
            req.setAttribute("eliminacionExitosa", true);// o false
        } else {
            System.out.println("No se pudo eliminar el usuario.");
            req.setAttribute("eliminacionExitosa",false);
        }

        // Independientemente del resultado, recarga la lista de usuarios
        List<UsuarioInter> usuarios = userdao.findAll();
        req.setAttribute("users", usuarios);

        req.getRequestDispatcher("admin.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
