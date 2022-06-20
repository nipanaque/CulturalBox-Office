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

                if(estad.estadEspeciTwo(genero,nomFuncion,fecha,hora).get(0).getNombre() != null){
                    request.setAttribute("listaEspeci",estad.estadEspeciTwo(genero,nomFuncion,fecha,hora));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadFuncion.jsp");
                    requestDispatcher.forward(request,response);
                }else{
                    request.setAttribute("respuesta","noExiste");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadEspFunciones.jsp");
                    requestDispatcher.forward(request,response);
                }
            }
            case "buscarAcDir" -> {
                String tipo = request.getParameter("tipo");
                String nombre = request.getParameter("nombre");
                String[] name = nombre.split(" ");
                if (tipo.equals("Actor")){
                    request.setAttribute("actor",estad.buscarActorTwo(name[0],name[1]));
                }else{
                    request.setAttribute("director",estad.buscarDirectorTwo(name[0],name[1]));
                }
                request.setAttribute("tipo",tipo);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("BuscarActorDirector.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }
}
