package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.OperadoresDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OperadoresServlet", value = "/operadores")
public class OperadoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        OperadoresDao operadoresDao = new OperadoresDao();

        switch (action) {
            case "listar" -> {
                ArrayList<Operadores> listaOperadores = operadoresDao.obtenerOperadores();
                request.setAttribute("operadores",listaOperadores);
                RequestDispatcher view =request.getRequestDispatcher("operadores.jsp");
                view.forward(request,response);
            }
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        OperadoresDao operadoresDao = new OperadoresDao();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombre").toLowerCase();
                String apellido = request.getParameter("apellido").toLowerCase();
                String correo_pucp = request.getParameter("correo").toLowerCase();
                String contrasenha = request.getParameter("contrasenha").toLowerCase();

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);

                operadoresDao.crearOperador(nombreFormato, apellidoFormato, correo_pucp, contrasenha);
                response.sendRedirect(request.getContextPath() + "/operadores");
            }

            case "borrar" -> {
                String cantOperadoresStr = request.getParameter("cantOperadores");
                int cantOpeint = Integer.parseInt(cantOperadoresStr);
                for(int i =1;i <= cantOpeint; i++){
                    String parametro = "operador"+i;
                    String aStr = request.getParameter(parametro);
                    operadoresDao.borrarOperador(aStr);
                }
                response.sendRedirect(request.getContextPath() + "/operadores");
            }

        }

    }

    public String primeraMayus(String nombre) {
        char[] arr = nombre.toCharArray();
        arr[0] = Character.toUpperCase(arr[0]);
        return new String(arr);
    }

}
