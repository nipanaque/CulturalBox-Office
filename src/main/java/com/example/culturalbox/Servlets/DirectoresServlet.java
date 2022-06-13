package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.DirectoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Directores", value = "/Directores")
public class DirectoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        DirectoresDao directoresDao = new DirectoresDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaDirectores",directoresDao.obtenerDirectores());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Directores.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        DirectoresDao directoresDao = new DirectoresDao();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombreA").toLowerCase();
                String apellido = request.getParameter("apellidoA").toLowerCase();

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);

                directoresDao.crearDirector(nombreFormato, apellidoFormato);
                response.sendRedirect(request.getContextPath() + "/Directores");
            }

            case "borrar" -> {
                String cantDirectoresStr = request.getParameter("cantDirectores");
                int cantDirectoresint = Integer.parseInt(cantDirectoresStr);
                for(int i =1;i <= cantDirectoresint; i++){
                    String parametro = "director"+i;
                    String aStr = request.getParameter(parametro);
                    directoresDao.borrarDirector(aStr);
                }
                response.sendRedirect(request.getContextPath() + "/Directores");
            }

        }

    }

    public String primeraMayus(String nombre) {
        char[] arr = nombre.toCharArray();
        arr[0] = Character.toUpperCase(arr[0]);
        return new String(arr);
    }

}
