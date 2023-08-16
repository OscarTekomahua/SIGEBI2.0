package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.PrestamoSalasDao;
import mx.edu.utez.sigebi.model.DAO.UsuarioDao;
import mx.edu.utez.sigebi.model.PrestamoSalas;
import mx.edu.utez.sigebi.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Time;

@WebServlet (name = "PedirSalaServlet", value = "/PedirSalaServlet")
public class PedirSalaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("sesion");
        int idusuario = user.getId_usuario();
        int id = Integer.parseInt(req.getParameter("id"));

        req.setAttribute("id_usuario", idusuario);
        req.setAttribute("id_sala", id);

        req.getRequestDispatcher("/solicitarsala.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id_sala = Integer.parseInt(req.getParameter("id_sala"));
        int id_usuario = Integer.parseInt(req.getParameter("id_usuario"));
        String horaInicioStr = req.getParameter("horaInicio");
        String horaFinStr = req.getParameter("horaFinal");
        Time hora_inicio = Time.valueOf(horaInicioStr + ":00");
        Time hora_fin = Time.valueOf(horaFinStr + ":00");
        String estado = "";
        String extras = req.getParameter("extras");

        PrestamoSalas prestamoSalas = new PrestamoSalas(0, id_sala, id_usuario, hora_inicio, hora_fin, estado, extras);

        PrestamoSalasDao prestamosDao = new PrestamoSalasDao();
        UsuarioDao usrDao = new UsuarioDao();

        boolean usrExists = usrDao.usuarioExiste(id_usuario);
        boolean salareservada = prestamosDao.existePrestamoEnHorario(id_sala, hora_inicio, hora_fin);

        int comparacionHoras = hora_inicio.compareTo(hora_fin);

        if (comparacionHoras < 0) {
            if (usrExists) {
                System.out.println(salareservada);
                if (!salareservada) {
                    boolean registrado = prestamosDao.registrarPrestamo(prestamoSalas);
                    if (registrado) {
                        resp.sendRedirect(req.getContextPath() + "/inicio.jsp");
                    } else {
                        req.getSession().setAttribute("error", "¡Hubo un problema con el registro de tu prestamo!");
                        resp.sendRedirect("/SIGEBI_war_exploded/PedirSalaServlet?id=" + id_sala + "&id_usuario=" + id_usuario);
                    }
                } else {
                    req.getSession().setAttribute("error", "¡La sala esta reservada para ese horario!");
                    resp.sendRedirect("/SIGEBI_war_exploded/PedirSalaServlet?id=" + id_sala + "&id_usuario=" + id_usuario);
                }
            } else {
                req.getSession().setAttribute("error", "¡Usuario no encontrado!");
                resp.sendRedirect("/SIGEBI_war_exploded/PedirSalaServlet?id=" + id_sala + "&id_usuario=" + id_usuario);
            }
        } else if (comparacionHoras > 0) {
            req.getSession().setAttribute("error", "¡Hora Final no valida!");
            resp.sendRedirect("/SIGEBI_war_exploded/PedirSalaServlet?id=" + id_sala + "&id_usuario=" + id_usuario);
        } else {
            req.getSession().setAttribute("error", "¡Hora Final no valida!");
            resp.sendRedirect("/SIGEBI_war_exploded/PedirSalaServlet?id=" + id_sala + "&id_usuario=" + id_usuario);
        }

    }

}
