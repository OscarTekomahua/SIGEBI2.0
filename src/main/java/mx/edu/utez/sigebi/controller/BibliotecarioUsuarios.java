package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.LibroDao;
import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.Libro;
import mx.edu.utez.sigebi.model.Persona;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "BibliotecarioUsuarios", value = "/BibliotecarioUsuarios")
public class BibliotecarioUsuarios extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Persona> usrs = new UsuarioDao().usuariosConPrestamo();
        for (Persona usr: usrs) {
            System.out.println(usr.getNombre());
            System.out.println(usr.getLibroPrestado());
            System.out.println(usr.getApellido1());
            System.out.println(usr.getApellido2());
        }
        req.setAttribute("usrLibPres", usrs);
        resp.sendRedirect("usuarios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
