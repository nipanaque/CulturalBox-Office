package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SedesServlet", value = "/Sedes")
public class SedesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SedesDao sedesDao = new SedesDao();
        request.setAttribute("listaSedes",sedesDao.obtenerSedes());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Sedes.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

