package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Mantenimiento;
import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.MantenimientoDao;
import com.example.culturalbox.Daos.OperadoresDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CrearHorarioServlet", value = "/CrearHorario")
public class CrearHorarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SedesDao sedesDao = new SedesDao();
        MantenimientoDao mantenimientoDao = new MantenimientoDao();

        request.setAttribute("listaSedes",sedesDao.obtenerSedeCantidad());
        request.setAttribute("listaMantenimiento",mantenimientoDao.obtenerMantenimiento());
        RequestDispatcher view =request.getRequestDispatcher("CrearHorario.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
