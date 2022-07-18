package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Calificacion;
import com.example.culturalbox.Beans.Historial;
import com.example.culturalbox.Beans.Usuario;
import com.example.culturalbox.Daos.CalificacionDao;
import com.example.culturalbox.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "CalificacionServlet", value = "/CalificacionServlet")
public class CalificacionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CalificacionDao calificacionDao = new CalificacionDao();
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        switch (action){

            case "crear" -> {
                String idf = request.getParameter("idf");
                String idcompra = request.getParameter("idcompra");
                request.setAttribute("idcompra",idcompra);
                request.setAttribute("listaCalificacion",calificacionDao.obtenerCalificacion(idf));
                RequestDispatcher view =request.getRequestDispatcher("Calificacion.jsp");
                view.forward(request,response);

            }
            case "ver" -> {
                String idf = request.getParameter("idf");

                System.out.print("id de la funcion "+idf+" id de la funcion");
                ArrayList<Calificacion> listaActores = calificacionDao.obtenerCalificacionActor(idf);
                ArrayList<Calificacion> listaDirectores = calificacionDao.obtenerCalificacionDirector(idf);
                ArrayList<Calificacion> listaPelicula = calificacionDao.obtenerCalificacionFuncion(idf);
                request.setAttribute("listaCalificacion",calificacionDao.obtenerCalificacion(idf));
                request.setAttribute("listaCalificacionFuncion",listaPelicula);
                request.setAttribute("listaCalificacionDirector",listaDirectores);
                request.setAttribute("listaCalificacionActor",listaActores);

                RequestDispatcher view =request.getRequestDispatcher("Calificacion_ver.jsp");
                view.forward(request,response);

            }

        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CalificacionDao calificacionDao = new CalificacionDao();
        HistorialDao historialDao = new HistorialDao();
        String action = request.getParameter("a") == null? "listar" : request.getParameter("a");
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioSesion");
        int id = user.getId();
        switch (action){
            case "guardar" -> {
                String idcompra = request.getParameter("idcompra");
                String starsDirector = request.getParameter("starsDirector");
                String stars = request.getParameter("stars");



                String f = request.getParameter("f");
                ArrayList<Calificacion> listaCalificaciones = calificacionDao.obtenerCalificacion(f);
                String d = request.getParameter("d");
                String actor = "a";
                System.out.println(stars);
                calificacionDao.obtenerPuntuacionDirector(starsDirector,d);
                calificacionDao.obtenerPuntuacionFuncion(stars,f);
                int i=1;
                String starsActor = "starsActor";
                for(Calificacion calificacion: listaCalificaciones){
                    String contador= String.valueOf(i);
                    String idactor = request.getParameter(actor+contador);
                    String estrellas = request.getParameter(starsActor+contador);

                    calificacionDao.obtenerPuntuacionActor(estrellas,idactor);
                    i++;
                }


                calificacionDao.cambiarCalificado(Integer.parseInt(idcompra), id);

                response.sendRedirect(request.getContextPath()+"/HistorialServlet");

            }
            case "actualizar" ->{
            }
        }

    }
}

