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
            case "irFunciones" -> {
                request.setAttribute("listaFunciones",estad.listarFunciones());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadEspFunciones.jsp");
                requestDispatcher.forward(request,response);
            }
            case "irAcDir" -> {
                request.setAttribute("listaActores",estad.listarActores());
                request.setAttribute("listaDirectores",estad.listarDirectores());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("BuscarActorDirector.jsp");
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
            case "buscarEspeciFun" -> {
                String genero = request.getParameter("genero");
                String nomFuncion = request.getParameter("nomFuncion");
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                request.setAttribute("listaEspeci",estad.estadEspeciTwo(genero,nomFuncion,fecha,hora));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadFuncion.jsp");
                requestDispatcher.forward(request,response);
            }
            case "buscarActor" -> {
                String nombreActor = request.getParameter("nombreActor");
                String[] actor = nombreActor.split("-");
                request.setAttribute("actor",estad.buscarActorTwo(actor[0],actor[1]));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadActor.jsp");
                requestDispatcher.forward(request,response);
            }
            case "buscarDirector" -> {
                String nombreDirector = request.getParameter("nombreDirector");
                String[] director = nombreDirector.split("-");
                request.setAttribute("director",estad.buscarDirectorTwo(director[0],director[1]));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadDirector.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }
}
