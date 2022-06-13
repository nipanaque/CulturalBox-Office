package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Daos.HorariosDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "IndexOpServlet", value = "/IndexOpServlet")
public class IndexOpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horariosDao = new HorariosDao();
        switch (action){
            case "listar" ->{
                request.setAttribute("listaHorarios",horariosDao.obtenerHorarios_Menu());
                RequestDispatcher view =request.getRequestDispatcher("index_operadores.jsp");
                view.forward(request,response);
            }
            case "editar" -> {
                String id = request.getParameter("id");
                Horarios horario = horariosDao.buscarPorIdActHorario(id);
                if (horario != null) {
                    request.setAttribute("idHorario", horario);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditarHorario.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/IndexOpServlet");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horariosDao = new HorariosDao();

        switch (action){
            case "actualizar" -> {
                Horarios horario = leerParametrosRequest(request);
                horariosDao.actualizarHorario(horario);
                response.sendRedirect(request.getContextPath() + "/IndexOpServlet");
            }
        }
    }

    public Horarios leerParametrosRequest(HttpServletRequest request) {
        String dia = request.getParameter("dia");
        String tiempo_inicio = request.getParameter("tiempo_inicio");
        String costoStr = request.getParameter("costo");

        Horarios horario = new Horarios();
        horario.setDia(dia);
        horario.setTiempo_inicio(tiempo_inicio);
        horario.setCosto(Float.parseFloat(costoStr));
        return horario;
    }
}
