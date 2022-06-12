package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.CalificacionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalificacionServlet", value = "/CalificacionServlet")
public class CalificacionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CalificacionDao calificacionDao = new CalificacionDao();
        request.setAttribute("listaCalificacion",calificacionDao.obtenerCalificacion());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Calificacion.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
