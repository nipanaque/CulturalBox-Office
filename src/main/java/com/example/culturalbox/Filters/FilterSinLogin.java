package com.example.culturalbox.Filters;

import com.example.culturalbox.Beans.Usuario;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "FilterSinLogin",servletNames = {"MenuSinLoginServlet","RegistroServlet","RestablecerServlet"})
public class FilterSinLogin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        Usuario usuario = (Usuario) req.getSession().getAttribute("usuarioSesion");
        if (usuario==null || usuario.getId()==0) {
            chain.doFilter(request, response);
        } else {
            if(usuario.getRol() == 1){
                resp.sendRedirect(req.getContextPath()+"/MenuServlet");
            }else if(usuario.getRol() == 2){
                resp.sendRedirect(req.getContextPath()+"/OperadorIndexServlet");
            }else{
                resp.sendRedirect(req.getContextPath()+"/AdminIndexServlet");
            }

    }
    }
}
