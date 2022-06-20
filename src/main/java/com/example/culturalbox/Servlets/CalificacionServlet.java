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
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        switch (action){

            case "crear" -> {
                String idf = request.getParameter("idf");
                request.setAttribute("listaCalificacion",calificacionDao.obtenerCalificacion(idf));
                RequestDispatcher view =request.getRequestDispatcher("Calificacion.jsp");
                view.forward(request,response);

            }

        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CalificacionDao calificacionDao = new CalificacionDao();
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        switch (action){
            case "guardar" -> {
                String starsDirector = request.getParameter("starsDirector");
                String starsActor1 = request.getParameter("starsActor1");
                String starsActor2 = request.getParameter("starsActor2");
                String starsActor3 = request.getParameter("starsActor3");
                String stars = request.getParameter("stars");
                String f = request.getParameter("f");
                String d = request.getParameter("d");
                String a1 = request.getParameter("a1");
                String a2 = request.getParameter("a2");
                String a3 = request.getParameter("a3");
                calificacionDao.obtenerPuntuacionDirector(starsDirector,d);
                calificacionDao.obtenerPuntuacionFuncion(stars,f);
                calificacionDao.obtenerPuntuacionActor(starsActor1,a1);
                calificacionDao.obtenerPuntuacionActor(starsActor2,a2);
                calificacionDao.obtenerPuntuacionActor(starsActor3,a3);
                response.sendRedirect("/HistorialServlet");

            }
            case "actualizar" ->{
            }
        }

    }
}

