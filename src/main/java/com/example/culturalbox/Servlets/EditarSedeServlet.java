package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.EditarSedeDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditarSedeServlet", value = "/EditarSedeServlet")
public class EditarSedeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EditarSedeDao editarSedeDao = new EditarSedeDao();
        request.setAttribute("listaAforos", editarSedeDao.obtenerAforo());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditarSede.jsp");
        requestDispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
