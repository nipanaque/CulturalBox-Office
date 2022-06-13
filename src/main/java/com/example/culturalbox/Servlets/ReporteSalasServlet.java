package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.EstadisticaDao;
import com.example.culturalbox.Daos.SalaReporteDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReporteSalasServlet", value = "/ReporteSalasServlet")
public class ReporteSalasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null? "inicio" : request.getParameter("a");
        SalaReporteDao salas = new SalaReporteDao();
        switch (action){
            case "inicio" -> {
                request.setAttribute("inicio","vacio");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReporteSalas.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        SalaReporteDao salas = new SalaReporteDao();

        switch (action){
            case "buscar" -> {
                String fecha = request.getParameter("fecha");
                String idSedeStr = request.getParameter("sede");
                request.setAttribute("fecha",fecha);
                request.setAttribute("sede", idSedeStr);
                request.setAttribute("listaSalas",salas.reporteFechaSede(fecha,idSedeStr));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReporteSalas.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }
}
