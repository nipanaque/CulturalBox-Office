package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Menu;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MenuSinLoginServlet", urlPatterns = {"/MenuSinLoginServlet",""})
public class MenuSinLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDao menuDao = new MenuDao();
        ArrayList<Menu> listaMenu = menuDao.obtenerListaMenu();
        ArrayList<ArrayList<Horarios>> listaListasHorarios = new ArrayList<>();
        for (Menu menu:listaMenu) {
            listaListasHorarios.add(menuDao.listarHorarios(menu.getNombre_funcion()));

        }

        System.out.printf(String.valueOf(listaListasHorarios.size()));


        request.setAttribute("listaMenu", listaMenu);
        request.setAttribute("listaListasHorarios", listaListasHorarios);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu_usuario.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
