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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
