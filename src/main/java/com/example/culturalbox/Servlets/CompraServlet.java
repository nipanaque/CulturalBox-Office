package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.CompraDao;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CompraServlet", value = "/CompraServlet")
public class CompraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CompraDao compraDao = new CompraDao();

        request.setAttribute("listaCompra", compraDao.listarCompra());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Compra.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
