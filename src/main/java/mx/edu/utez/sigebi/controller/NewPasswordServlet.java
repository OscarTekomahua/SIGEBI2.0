package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "NewPassword", value = "/NewPasswordServlet")
public class NewPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nuevaContra = req.getParameter("contra");
        String correo = req.getParameter("correo");

        System.out.println(correo);

        UsuarioDao dao = new UsuarioDao();

        boolean actualizacionHecha = dao.updatePassword(correo, nuevaContra);

        if (actualizacionHecha) {
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "Ocurrio un error durante la actulizacion de su contrseña");
            resp.sendRedirect("restablecer.jsp");
        }


    }
}
