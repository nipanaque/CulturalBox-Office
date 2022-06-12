package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.PerfilDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PerfilServlet", value = "/PerfilServlet")
public class PerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PerfilDao perfilDao = new PerfilDao();
        request.setAttribute("listaPerfil",perfilDao.obtenerPerfil());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Perfil.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
