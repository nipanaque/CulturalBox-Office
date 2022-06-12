package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HistorialServlet", value = "/HistorialServlet")
public class HistorialServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HistorialDao historialDao = new HistorialDao();
        request.setAttribute("listaHistorial",historialDao.obtenerHistorial());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Historial.jsp");
        requestDispatcher.forward(request,response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
