package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.Directores;
import com.example.culturalbox.Daos.DirectoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Objects;

@MultipartConfig
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
        HttpSession session = request.getSession();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombreA").toLowerCase();
                String apellido = request.getParameter("apellidoA").toLowerCase();
                Part fotoStr = request.getPart("foto");
                InputStream foto = fotoStr.getInputStream();

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);

                ArrayList<Directores> listaDirectores = directoresDao.obtenerNombreDirectores();
                int i=0;
                for(Directores listadirectores: listaDirectores){
                    if (Objects.equals(listadirectores.getNombre(), nombreFormato) && Objects.equals(listadirectores.getApellido(), apellidoFormato)) {
                        i++;
                    }
                }
                if(i==0){
                    directoresDao.crearDirector(nombreFormato, apellidoFormato,foto);
                    response.sendRedirect(request.getContextPath() + "/Directores");
                }else{
                    session.setAttribute("invalid1","error");
                    RequestDispatcher view =request.getRequestDispatcher("AgregarDirector.jsp");
                    view.forward(request,response);
                }
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
