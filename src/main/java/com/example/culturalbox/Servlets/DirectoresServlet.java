package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.DirectoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Directores", value = "/Directores")
public class DirectoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DirectoresDao directoresDao = new DirectoresDao();
        request.setAttribute("listaDirectores",directoresDao.obtenerDirectores());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Directores.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
