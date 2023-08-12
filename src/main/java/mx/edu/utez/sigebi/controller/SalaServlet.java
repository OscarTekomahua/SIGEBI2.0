package mx.edu.utez.sigebi.controller;

import mx.edu.utez.sigebi.model.DAO.SalaDao;
import mx.edu.utez.sigebi.model.Sala;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "SalaServlet", urlPatterns = {"/salasBiblio", "/salasAdmin", "/salasUser"})
public class SalaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcion = req.getServletPath();

        switch (opcion) {

            case "/salasBiblio":
                if (req.getParameter("operacion").equals("tablasalas")) {
                    SalaDao salaDao = new SalaDao();

                    List<Sala> listadesalas = salaDao.findAll();

                    req.setAttribute("tablasalas", listadesalas);
                }

                req.getRequestDispatcher("salas.jsp").forward(req, resp);
                break;
            case "/salasAdmin":
                if (req.getParameter("operacion").equals("tablasalas")) {
                    SalaDao salaDao = new SalaDao();

                    List<Sala> listadesalas = salaDao.findAll();

                    req.setAttribute("tablasalas", listadesalas);
                }

                req.getRequestDispatcher("salasAdmin.jsp").forward(req, resp);
                break;

            case "/salasUser":
                HttpSession session = req.getSession();

                SalaDao salaDao = new SalaDao();

                List<Sala> listadesalas = salaDao.findAll();

                session.setAttribute("tablasalas", listadesalas);

                req.getRequestDispatcher("salasuser.jsp").forward(req, resp);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
