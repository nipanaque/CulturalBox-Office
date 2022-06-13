package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HistorialServlet", value = "/HistorialServlet")
public class HistorialServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();

        switch(action){
            case "listar" -> {

                request.setAttribute("listaHistorial",historialDao.obtenerHistorial());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Historial.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear" -> {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Calificacion.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();
        String puntajeFuncion = request.getParameter("contador");
        String puntajeDirector = request.getParameter("contadorDirector");
        String puntajeActor1 = request.getParameter("contadorActor1");
        String puntajeActor2= request.getParameter("contadorActor2");
        String puntajeActor3= request.getParameter("contadorActor3");

    }
}
