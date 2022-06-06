package com.example.culturalbox.Servlets;
import com.example.culturalbox.Daos.ActoresDao;
import com.example.culturalbox.Daos.ClientesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ClientesServlet", value = "/ClientesServlet")
public class ClientesServlet extends HttpServlet {
    @Override
        protected void doGet (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {

            ClientesDao clientesDao = new ClientesDao();
            request.setAttribute("listaClientes", clientesDao.listarClientes());

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Clientes.jsp");
            requestDispatcher.forward(request, response);

        }

        @Override
        protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {

        }

}
