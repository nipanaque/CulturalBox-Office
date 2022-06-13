package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.HorariosDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListaHorariosServlet", value = "/ListaHorarios")
public class ListaHorariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horariosDao = new HorariosDao();

        switch (action){
            case "listar"->{
                request.setAttribute("listahorarios",horariosDao.obtenerHorarios());
                RequestDispatcher view =request.getRequestDispatcher("ListaHorarios.jsp");
                view.forward(request,response);
            }
            case "agregarmant"->{
                String id = request.getParameter("id");
                Horarios idHorario = horariosDao.buscarPorId(id);
                request.setAttribute("idHorario",idHorario);
                request.setAttribute("listaMantenimiento",horariosDao.obtenerMantenimiento());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaMantenimiento.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horarios = new HorariosDao();

        switch (action){
            case "guardarmant" ->{
                String idFuncion= request.getParameter("idHorario");
                String idActor = request.getParameter("idMantenimiento");
                horarios.horario_has_mantenimiento(Integer.parseInt(idFuncion),Integer.parseInt(idActor));
                response.sendRedirect(request.getContextPath() + "/ListaHorarios");
            }
        }
    }
}
