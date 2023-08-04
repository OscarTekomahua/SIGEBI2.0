package mx.edu.utez.sigebi.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(urlPatterns = {
        "/bibliotecario.jsp",
        "/administrarStok.jsp",
        "/revisarHistorial.jsp",
        "/modificarLibro.jsp",
        "/agregarlibro.jsp"
})
public class FiltroSesionBiblio implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req,
                         ServletResponse resp,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpResponse = (HttpServletResponse) resp;

        // Get the HttpSession from the request
        HttpSession session = httpRequest.getSession(false);

        // Check if the user is an admin(assuming isAdmin is a boolean session attribute)
        boolean isBiblio = false;
        if(session != null){
            if (session.getAttribute("tipoUsuario") != null) {
                isBiblio = session.getAttribute("tipoUsuario").equals("Bibliotecario");
            }
        }

        if (isBiblio) {
            // If the user is an admin, allow access to the Servlet
            chain.doFilter(req, resp);
        } else {
            // If the user is not an admin, redirect them to a restricted access page
            httpResponse.sendRedirect("failedAccess.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed (optional)
    }
}
