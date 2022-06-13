package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.EstadisticaDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EstadisticaServlet", value = "/EstadisticaServlet")
public class EstadisticaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null? "inicio" : request.getParameter("a");
        EstadisticaDao estad = new EstadisticaDao();
        switch (action){
            case "inicio" -> {
                request.setAttribute("inicio","vacio");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadGeneral.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        EstadisticaDao estad = new EstadisticaDao();

        switch (action){
            case "buscar" -> {
                String fecha = request.getParameter("fecha");  //Esta en String
                request.setAttribute("fecha",fecha);
                request.setAttribute("listaEstadistica",estad.buscarPorFecha(fecha));  //Aqui se filtra

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadGeneral.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }
}
