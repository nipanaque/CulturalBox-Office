package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.EstadisticaDao;
import com.example.culturalbox.Daos.SalaReporteDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ReporteSalasServlet", value = "/ReporteSalasServlet")
public class ReporteSalasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null? "inicio" : request.getParameter("a");
        SalaReporteDao salas = new SalaReporteDao();
        SedesDao sedesDao = new SedesDao();
        switch (action){
            case "inicio" -> {
                request.setAttribute("listaSedes",sedesDao.obtenerSedes());
                request.setAttribute("inicio","vacio");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReporteSalas.jsp");
                requestDispatcher.forward(request,response);
            }
            case "descargar"->{
                String idSede = request.getParameter("idSede");
                String idSala = request.getParameter("idSala");
                String dia = request.getParameter("dia");
                request.setAttribute("reporte_horarios",salas.obtenerReporte(dia,Integer.parseInt(idSede),Integer.parseInt(idSala)));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReporteExcel.jsp");
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
