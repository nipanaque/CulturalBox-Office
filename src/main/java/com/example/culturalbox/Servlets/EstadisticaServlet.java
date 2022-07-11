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

                //El 1 indica que hay compras, porque puede darse el caso de una funcion publicada pero nadie ha comprado boletos, lo cual
                //significa que no hay calificaciones y funciones mejor y menos vistas estaran nulas.
                if(estad.buscarPorFecha(fecha).get(1).getNombre() == null){
                    request.getSession().setAttribute("msg","No se encontraron resultados"+" para "+fecha);
                    response.sendRedirect(request.getContextPath() + "/EstadGeneral.jsp");
                }else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadGeneral.jsp");
                    requestDispatcher.forward(request,response);
                }
            }
            case "buscarEspeciFun" -> {
                String genero = request.getParameter("genero");
                String nomFuncion = request.getParameter("nomFuncion");
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");

                if(estad.estadEspeciTwo(genero,nomFuncion,fecha,hora).get(0).getNombre() != null){

                    if(nomFuncion.length() >= 3){
                        request.setAttribute("listaEspeci",estad.estadEspeciTwo(genero,nomFuncion,fecha,hora));
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("EstadFuncion.jsp");
                        requestDispatcher.forward(request,response);
                    }else{
                        request.getSession().setAttribute("msg","Por favor sea más específico en el nombre");
                        response.sendRedirect(request.getContextPath() + "/EstadEspFunciones.jsp");
                    }


                }else{
                    request.getSession().setAttribute("msg","No se encontró resultados");
                    response.sendRedirect(request.getContextPath() + "/EstadEspFunciones.jsp");
                }
            }
            case "buscarAcDir" -> {
                String tipo = request.getParameter("tipo");
                String nombre = request.getParameter("nombre");
                String[] name = nombre.split(" ");

                if(name.length == 1){
                    request.getSession().setAttribute("msg","Información incompleta, se requiere nombre y apellido");
                    response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                }else if (name.length == 2){
                    if (tipo.equals("Actor")){
                        request.setAttribute("actor",estad.buscarActorTwo(name[0],name[1]));

                        if(estad.buscarActorTwo(name[0],name[1]).size() >= 3){  //Repetidos
                            request.getSession().setAttribute("msg","Hay mas de 1 resultado con lo ingresado, por favor sea más específico");
                            response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                        }else if(estad.buscarActorTwo(name[0],name[1]).get(0).getNombre() == null){   //No encontrado
                            request.getSession().setAttribute("msg","No se encontró resultados");
                            response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                        }else{  //Si encontrado
                            request.setAttribute("tipo",tipo);

                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("BuscarActorDirector.jsp");
                            requestDispatcher.forward(request,response);
                        }
                    }else{
                        request.setAttribute("director",estad.buscarDirectorTwo(name[0],name[1]));
                        if(estad.buscarDirectorTwo(name[0],name[1]).size() >= 3){  //Repetidos
                            request.getSession().setAttribute("msg","Hay mas de 1 resultado con lo ingresado, por favor sea más específico");
                            response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                        }else if(estad.buscarDirectorTwo(name[0],name[1]).get(0).getNombre() == null){
                            request.getSession().setAttribute("msg","No se encontró resultados");
                            response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                        }else{
                            request.setAttribute("tipo",tipo);

                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("BuscarActorDirector.jsp");
                            requestDispatcher.forward(request,response);
                        }
                    }
                }else{
                    request.getSession().setAttribute("msg","Se requiere 1 nombre y 1 apellido");
                    response.sendRedirect(request.getContextPath() + "/BuscarActorDirector.jsp");
                }
            }
        }
    }
}
