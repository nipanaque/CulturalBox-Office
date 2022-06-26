package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Daos.ActoresDao;
import com.example.culturalbox.Daos.CrearFuncionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListarFuncionesServlet", value = "/ListaFunciones")
public class ListarFuncionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();

        switch (action) {
            case "listar" -> {
                ArrayList<CrearFuncion> listaFunciones = crearFuncionDao.obtenerFunciones();
                request.setAttribute("listaFunciones",listaFunciones);
                RequestDispatcher view =request.getRequestDispatcher("ListaFunciones.jsp");
                view.forward(request,response);
            }
            case "agregaract" ->{
                String id = request.getParameter("id");
                CrearFuncion idFuncion = crearFuncionDao.buscarPorId(id);
                request.setAttribute("idFuncion",idFuncion);
                request.setAttribute("listaActores",crearFuncionDao.obtenerNombres_Actores());
                request.setAttribute("listaActoresFuncion",crearFuncionDao.obtenerNombres_Actores_Horario(id));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("AgregarActores.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrar" -> {
                String id = request.getParameter("id");
                crearFuncionDao.eliminarFuncion(id);
                response.sendRedirect(request.getContextPath() + "/ListaFunciones");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();

        switch (action) {
            case "guardaract" -> {
                String idFuncion= request.getParameter("IdFuncion");
                String idActor = request.getParameter("IdActor");
                crearFuncionDao.funcion_has_actor(Integer.parseInt(idFuncion),Integer.parseInt(idActor));
                response.sendRedirect(request.getContextPath() + "/ListaFunciones?a=agregaract&id="+idFuncion);
          }
        }
    }
}
