package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Usuario;
import com.example.culturalbox.Daos.HistorialDao;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HistorialServlet", value = "/HistorialServlet")
public class HistorialServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioSesion");
        int id = user.getId();
        switch(action){
            case "listar" -> {
                MenuDao menuDao = new MenuDao();
                request.setAttribute("funcionesvigentes",historialDao.obtenerfuncionesvigentes(id));
                request.setAttribute("listaHistorial",historialDao.obtenerHistorial(id));
                int contCompras = menuDao.buscarComprasNopagadas(1).size();
                request.setAttribute("contCompras",contCompras);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Historial.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear" -> {

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Calificacion.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();
        if(action.equals("cancelar")){
            int idCompra = Integer.parseInt(request.getParameter("idCompra"));
            historialDao.cancelar(idCompra);
            response.sendRedirect(request.getContextPath()+"/HistorialServlet");

        }

    }
}