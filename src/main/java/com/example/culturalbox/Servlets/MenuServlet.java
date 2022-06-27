package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Menu;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MenuServlet", value = "/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MenuDao menuDao = new MenuDao();

        switch (action) {
            case "listar" -> {
                ArrayList<Menu> listaMenu = menuDao.obtenerListaMenu();
                ArrayList<ArrayList<Horarios>> listaListasHorarios = new ArrayList<>();
                for (Menu menu:listaMenu) {
                    listaListasHorarios.add(menuDao.listarHorarios(menu.getNombre_funcion()));

                }

                System.out.printf(String.valueOf(listaListasHorarios.size()));

                //caso usuario logueado
                int contCompras = menuDao.buscarComprasNopagadas(1).size();
                request.setAttribute("contCompras",contCompras);

                request.setAttribute("listaMenu", listaMenu);
                request.setAttribute("listaListasHorarios", listaListasHorarios);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu_usuariolog.jsp");
                requestDispatcher.forward(request,response);
            }
            case "verHorarios" -> {
                String nombre = request.getParameter("nombre");

                request.setAttribute("listaHorarios", menuDao.listarHorarios(nombre));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Menu_usuariolog.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crearCompra1" -> {
                int idHorario = Integer.parseInt(request.getParameter("idHorario"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

                menuDao.crearCompra1(idHorario, idUsuario);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            }
            case "listarCompras" -> {
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                request.setAttribute("comprasNopagadas", menuDao.buscarComprasNopagadas(idUsuario));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Compra.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrarCompra" -> {
                String id = request.getParameter("id");
                menuDao.borrarCompraNopagada(id);
                response.sendRedirect(request.getContextPath() + "/MenuServlet?a=listarCompras&idUsuario=1");
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        MenuDao menuDao = new MenuDao();

        switch (action) {
            case "setNumtickets" -> {
                String id = request.getParameter("id");
                int num = Integer.parseInt(request.getParameter("num_tickets"));
                System.out.printf(id);
                System.out.printf(String.valueOf(num));
                menuDao.setNuerotickets(id, num);
                response.sendRedirect(request.getContextPath() + "/MenuServlet?a=listarCompras&idUsuario=1");
            }
        }
    }
}

