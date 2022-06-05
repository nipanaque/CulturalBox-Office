package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.OperadoresDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OperadoresServlet", value = "/operadores")
public class OperadoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OperadoresDao operadoresDao = new OperadoresDao();
        ArrayList<Operadores> listaOperadores = operadoresDao.obtenerOperadores();
        request.setAttribute("operadores",listaOperadores);
        RequestDispatcher view =request.getRequestDispatcher("operadores.jsp");
        view.forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
