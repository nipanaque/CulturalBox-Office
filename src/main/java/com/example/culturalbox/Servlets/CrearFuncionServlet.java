package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.*;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.MantenimientoDao;
import com.example.culturalbox.Daos.OperadoresDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CrearFuncionServlet", value = "/CrearFuncion")
public class CrearFuncionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();

        switch (action) {
            case "listar" -> {
                ArrayList<CrearFuncion> listaActores = crearFuncionDao.obtenerNombres_Actores();
                ArrayList<CrearFuncion> listaDirectores = crearFuncionDao.obtenerNombres_Directores();

                request.setAttribute("listaActores",listaActores);
                request.setAttribute("listaDirectores",listaDirectores);

                RequestDispatcher view =request.getRequestDispatcher("CrearFuncion.jsp");
                view.forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();

        switch (action){
            case "guardar" -> {
                String nombre = request.getParameter("nombre_function");
                String genero = request.getParameter("genero_funcion");
                String duracionStr = request.getParameter("duracion_funcion");
                String restriccion = request.getParameter("restriccion");
                String descripcion = request.getParameter("descripcion");
                String intDirectorStr = request.getParameter("director_funcion");

                try {
                    int duracion = Integer.parseInt(duracionStr);
                    int idDirector = Integer.parseInt(intDirectorStr);

                    crearFuncionDao.crearFuncion(nombre, genero, duracion, restriccion, descripcion, idDirector);

                    response.sendRedirect(request.getContextPath() + "/ListaFunciones");

                } catch (NumberFormatException e) {
                    System.out.println("error al parsear");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearFuncion");
                    requestDispatcher.forward(request, response);
                }
            }
        }
    }

    public CrearFuncion leerParametrosRequest(HttpServletRequest request) {
        String nombre = request.getParameter("nombre_function");
        String genero = request.getParameter("genero_funcion");
        String duracionStr = request.getParameter("duracion_funcion");
        String restriccion = request.getParameter("restriccion");;
        String descripcion = request.getParameter("descripcion");;
        String idDirectorStr = request.getParameter("director_funcion");

        CrearFuncion funcion = new CrearFuncion();
        funcion.setNombre(nombre);
        funcion.setGenero(genero);
        funcion.setDuracion(Integer.parseInt(duracionStr));
        funcion.setRestriccion(restriccion);
        funcion.setDescripcion(descripcion);
        funcion.setIdDirector(Integer.parseInt(idDirectorStr));
        return funcion;
    }
}
