package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Compra;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Menu;
import com.example.culturalbox.Beans.Usuario;
import com.example.culturalbox.Daos.MenuDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

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
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();
                int contCompras = menuDao.buscarComprasNopagadas(idUsuario).size();
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
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();
                int idHorario = Integer.parseInt(request.getParameter("idHorario"));


                menuDao.crearCompra1(idHorario, idUsuario);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            }
            case "listarCompras" -> {
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();
                request.setAttribute("comprasNopagadas", menuDao.buscarComprasNopagadas(idUsuario));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Compra.jsp");
                requestDispatcher.forward(request, response);
            }
            case "erlistarCompras" -> {
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();
                String error = "Esta seleccionando más tickets de los que hay en Stock";
                request.setAttribute("comprasNopagadas", menuDao.buscarComprasNopagadas(idUsuario));
                request.setAttribute("msj", error);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Compra.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrarCompra" -> {
                String id = request.getParameter("id");
                menuDao.borrarCompraNopagada(id);
                response.sendRedirect(request.getContextPath() + "/MenuServlet?a=listarCompras");
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

                //obtengo el stock del horario de tal compra
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();
                ArrayList<Compra> comprasNopagadas = menuDao.buscarComprasNopagadas(idUsuario);

                for (Compra compra:comprasNopagadas) {
                    if (Objects.equals(compra.getIdCompra(), id)){
                        //busco el stock segun el id horario
                        int stock = menuDao.obtenerStockhorario(compra.getIdHorario());

                        //ahora, se setea si el num es menor o igual q el stock
                        if (num <= stock) {
                            menuDao.setNuerotickets(id, num);
                            response.sendRedirect(request.getContextPath() + "/MenuServlet?a=listarCompras");
                        }
                        else {
                            response.sendRedirect(request.getContextPath() + "/MenuServlet?a=erlistarCompras");
                        }

                    }
                }
            }

            case "facturacion" -> {
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSesion");
                int idUsuario = usuario.getId();

                String titular = request.getParameter("titular");
                String tarjeta = request.getParameter("tarjeta");
                String mes = request.getParameter("mes");
                String anho = request.getParameter("anho");
                String cvv = request.getParameter("cvv");

                //Actualizar el estado de compra

                //compras no pagadas y cambiar el stock
                ArrayList<Compra> comprasNopagadas = menuDao.buscarComprasNopagadas(idUsuario);
                for (Compra compra:comprasNopagadas) {
                    menuDao.actualizarEstadocompra(compra.getIdCompra());
                    menuDao.updateStockhorario(compra.getIdHorario(), compra.getNu_tickets());
                }

                //obtener el correo del usuario
                String correo = menuDao.obtenerCorreo(idUsuario);
                //enviar entradas por correo
                String context = getServletContext().getRealPath("");
                StringBuilder sb = new StringBuilder(context);
                int i = 1;
                while (i<33){
                    sb.deleteCharAt(context.length()-1);
                    context = sb.toString();
                    i++;
                }
                context = context + "src\\main\\java\\com\\example\\culturalbox\\Daos\\qr.jpg";
                menuDao.enviarFactura(correo,context);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            }
        }

    }
}
