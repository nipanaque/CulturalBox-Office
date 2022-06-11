package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Directores;
import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.OperadoresDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CrearFuncionServlet", value = "/CrearFuncion")
public class CrearFuncionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();
        ArrayList<CrearFuncion> listaActores = crearFuncionDao.obtenerNombres_Actores();
        ArrayList<CrearFuncion> listaDirectores = crearFuncionDao.obtenerNombres_Directores();

        request.setAttribute("listaActores",listaActores);
        request.setAttribute("listaDirectores",listaDirectores);

        RequestDispatcher view =request.getRequestDispatcher("CrearFuncion.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
