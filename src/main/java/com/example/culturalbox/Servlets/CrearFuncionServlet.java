package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.*;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.OperadoresDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.annotation.MultipartConfig;
import javax.swing.text.BadLocationException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;

@MultipartConfig
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
        HttpSession session = request.getSession();

        switch (action){
            case "guardar" -> {
                String nombre = request.getParameter("nombre_function");
                String genero = request.getParameter("genero_funcion");
                String duracionStr = request.getParameter("duracion_funcion");
                String restriccion = request.getParameter("restriccion");
                String descripcion = request.getParameter("descripcion");
                String intDirectorStr = request.getParameter("director_funcion");
                Part bannerStr = request.getPart("banner");

                ArrayList<CrearFuncion> crearFuncions = crearFuncionDao.obtenerFunciones();
                int i=0;
                for(CrearFuncion funcion: crearFuncions){
                    if(funcion.getNombre().equals(nombre)){
                        i++;
                    }
                }


                boolean a2 = nombre.contains("0") || nombre.contains("1") || nombre.contains("2") || nombre.contains("3") || nombre.contains("4") || nombre.contains("5")
                        || nombre.contains("6") || nombre.contains("7") || nombre.contains("8") || nombre.contains("9");
                boolean a3 = descripcion.contains(" ");
                boolean a4 = descripcion.contains("0") || descripcion.contains("1") || descripcion.contains("2") || descripcion.contains("3") || descripcion.contains("4") || descripcion.contains("5")
                        || descripcion.contains("6") || descripcion.contains("7") || descripcion.contains("8") || descripcion.contains("9");

                if((!a2)&&(!a3)&&(!a4)){
                    if(i==0){
                        try {
                            int duracion = Integer.parseInt(duracionStr);
                            int idDirector = Integer.parseInt(intDirectorStr);
                            InputStream banner = bannerStr.getInputStream();

                            crearFuncionDao.crearFuncion(nombre, genero, duracion, restriccion, descripcion, idDirector,banner);

                            response.sendRedirect(request.getContextPath() + "/ListaFunciones");

                        } catch (NumberFormatException e) {
                            System.out.println("error al parsear");
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearFuncion");
                            requestDispatcher.forward(request, response);
                        }
                    }else{
                        request.getSession().setAttribute("invalid2","error");
                        response.sendRedirect(request.getContextPath()+"/CrearFuncion");
                    }

                }else{
                    request.getSession().setAttribute("invalid1","error");
                    response.sendRedirect(request.getContextPath()+"/CrearFuncion");
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