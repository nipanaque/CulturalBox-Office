package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Menu;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MenuServlet", value = "/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MenuDao menuDao = new MenuDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaMenu", menuDao.listarMenu());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu_usuario.jsp");
                requestDispatcher.forward(request,response);
            }
            case "verHorarios" -> {
                String nombre = request.getParameter("nombre");

                request.setAttribute("listaHorarios", menuDao.listarHorarios(nombre));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu_usuario.jsp");
                requestDispatcher.forward(request,response);

            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MenuDao menuDao = new MenuDao();

        int contCompras = 0;

        switch (action) {
            case "crearCompra1" -> {
                int idCompra = contCompras;
                int idHorario = Integer.parseInt(request.getParameter("idHorario"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                menuDao.crearCompra1(idCompra, idHorario, idUsuario);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");

            }

        }
    }
}
