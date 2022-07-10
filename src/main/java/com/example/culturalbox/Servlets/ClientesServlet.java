package com.example.culturalbox.Servlets;
import com.example.culturalbox.Daos.ActoresDao;
import com.example.culturalbox.Daos.ClientesDao;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.SedesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ClientesServlet", value = "/Clientes")
public class ClientesServlet extends HttpServlet {
    @Override
        protected void doGet (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
            request.setAttribute("nombreSede","null");
            request.setAttribute("nombreFuncion","null");
            ClientesDao clientesDao = new ClientesDao();
            SedesDao sedesDao = new SedesDao();
            CrearFuncionDao funcionDao = new CrearFuncionDao();

        switch (action) {
            case  "listar"-> {
                request.setAttribute("listaClientes", clientesDao.listarClientes());
                request.setAttribute("listaSedes", sedesDao.obtenerSedes());
                request.setAttribute("listaFunciones",funcionDao.obtenerFunciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Clientes.jsp");
                requestDispatcher.forward(request, response);
            }
        }

        }

        @Override
        protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {

            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
            ClientesDao clientesDao = new ClientesDao();
            SedesDao sedesDao = new SedesDao();
            CrearFuncionDao funcionDao = new CrearFuncionDao();

            switch (action) {
            case "filtrar" -> {
                String sede = request.getParameter("sede");
                String funcion = request.getParameter("funcion");
                if (sede.equals("0")) {
                    request.setAttribute("nombreSede","null");
                    request.setAttribute("nombreFuncion", clientesDao.NombreFuncion(funcion));
                    request.setAttribute("listaClientes", clientesDao.filtraClientesFuncion(funcion));
                    if (funcion.equals("0")){
                        request.setAttribute("nombreSede","null");
                        request.setAttribute("nombreFuncion","null");
                        request.setAttribute("listaClientes", clientesDao.listarClientes());
                    }
                } else if(funcion.equals("0")){
                    request.setAttribute("nombreSede",clientesDao.nombreSede(sede));
                    request.setAttribute("nombreFuncion","null");
                    request.setAttribute("listaClientes", clientesDao.filtraClientesSede(sede));
                }else{
                    request.setAttribute("nombreSede",clientesDao.nombreSede(sede));
                    request.setAttribute("nombreFuncion", clientesDao.NombreFuncion(funcion));
                    request.setAttribute("listaClientes", clientesDao.filtraClientesAmbos(funcion,sede));
                }
                request.setAttribute("listaSedes", sedesDao.obtenerSedes());
                request.setAttribute("listaFunciones",funcionDao.obtenerFunciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Clientes.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
}
