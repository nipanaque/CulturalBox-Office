package com.example.culturalbox.Filters;

import com.example.culturalbox.Beans.Usuario;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterCliente",servletNames = {"CalificacionServlet","CompraServlet","HistorialServlet","MenuServlet","PerfilServlet"})
public class FilterCliente implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        Usuario usuario = (Usuario) req.getSession().getAttribute("usuarioSesion");
        if (usuario != null && usuario.getId()!=0 && usuario.getRol()==1) {
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            resp.setDateHeader("Expires", 0);
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath());
        }

    }
}