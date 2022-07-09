package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.Aforo;
import com.example.culturalbox.Daos.ActoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Objects;

@MultipartConfig
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
        HttpSession session = request.getSession();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombreA").toLowerCase();
                String apellido = request.getParameter("apellidoA").toLowerCase();
                Part fotoStr = request.getPart("foto");

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);
                InputStream foto = fotoStr.getInputStream();
                System.out.print(nombreFormato+" "+apellidoFormato);

                ArrayList<Actores> listaActores = actoresDao.obtenerNombreActores();
                int i=0;
                for(Actores listaactores: listaActores){
                    if (Objects.equals(listaactores.getNombre(), nombreFormato) && Objects.equals(listaactores.getApellido(), apellidoFormato)) {
                        i++;
                    }
                }

                if(i==0){
                    actoresDao.crearActor(nombreFormato, apellidoFormato,foto);
                    response.sendRedirect(request.getContextPath() + "/Actores");
                }else{
                    session.setAttribute("invalid1","error");
                    RequestDispatcher view =request.getRequestDispatcher("AgregarActor.jsp");
                    view.forward(request,response);
                }
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
