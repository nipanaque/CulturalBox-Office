package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Aforo;
import com.example.culturalbox.Daos.ActoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

@WebServlet(name = "Actores", value = "/Actores")
public class ActoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ActoresDao actoresDao = new ActoresDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaActores", actoresDao.obtenerActores());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Actores.jsp");
                requestDispatcher.forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        ActoresDao actoresDao = new ActoresDao();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombreA").toLowerCase();
                String apellido = request.getParameter("apellidoA").toLowerCase();

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);

                actoresDao.crearActor(nombreFormato, apellidoFormato);
                response.sendRedirect(request.getContextPath() + "/Actores");
            }

            case "borrar" -> {
                String cantActoresStr = request.getParameter("cantActores");
                int cantActoresint = Integer.parseInt(cantActoresStr);
                for(int i =1;i <= cantActoresint; i++){
                    String parametro = "actor"+i;
                    String aStr = request.getParameter(parametro);
                    actoresDao.borrarActor(aStr);
                }
                response.sendRedirect(request.getContextPath() + "/Actores");
            }

        }

    }

    public String primeraMayus(String nombre) {
        char[] arr = nombre.toCharArray();
        arr[0] = Character.toUpperCase(arr[0]);
        return new String(arr);
    }

    }
