package mx.edu.utez.sigebi.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/admin.jsp",
        "/administrarStockAdmin.jsp",
        "/categoriasAdmin.jsp",
        "/editorialesAdmin.jsp",
        "/salasAdmin.jsp",
        "/formulariocategoriaAdmin.jsp",
        "/formularioeditorialAdmin.jsp",
        "/usuariosadmin.jsp"
})
public class FiltroSesionAdmin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the HttpSession from the request
        HttpSession session = httpRequest.getSession(false);

        // Check if the user is an admin(assuming isAdmin is a boolean session attribute)
        boolean isAdmin = false;
        if(session != null){
            System.out.println(session.getAttribute("tipoUsuario"));
            if (session.getAttribute("tipoUsuario") != null) {
                isAdmin = session.getAttribute("tipoUsuario").equals("Administrador");
            }
        }

        if (isAdmin) {
            // If the user is an admin, allow access to the Servlet
            chain.doFilter(request, response);
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
