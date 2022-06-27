package com.example.culturalbox.Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OperadorIndexServlet", value = "/OperadorIndexServlet")
public class OperadorIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;

        if(request.getSession().getAttribute("rol").equals(1) ){
            requestDispatcher = request.getRequestDispatcher("/MenuServlet");
        }else if(request.getSession().getAttribute("rol").equals(2)){
            requestDispatcher = request.getRequestDispatcher("index_operadores.jsp");
        }else{
            requestDispatcher = request.getRequestDispatcher("/AdminIndexServlet");
        }
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
