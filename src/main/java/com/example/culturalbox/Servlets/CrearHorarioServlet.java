package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Mantenimiento;
import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "CrearHorarioServlet", value = "/CrearHorario")
public class CrearHorarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        SedesDao sedesDao = new SedesDao();
        CrearFuncionDao crearFuncionDao = new CrearFuncionDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaSedes",sedesDao.obtenerSedes());
                request.setAttribute("listaFunciones",crearFuncionDao.obtenerFunciones());
                RequestDispatcher view =request.getRequestDispatcher("CrearHorario.jsp");
                view.forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        SedesDao sedesDao = new SedesDao();
        HorariosDao horariosDao = new HorariosDao();
        ArrayList<Horarios> listaHorarios = horariosDao.obtenerHorarios();

        switch (action){
            case "guardar" -> {
                //break;
                String vigenciaStr = request.getParameter("vigencia");
                String costoStr = request.getParameter("costo");
                String dia = request.getParameter("dia");
                String tiempo_inicio = request.getParameter("tiempo_inicio");
                String stockStr = request.getParameter("stock");
                String idSalaStr = request.getParameter("sala");
                String idSedeStr = request.getParameter("sede");
                String idFuncionStr = request.getParameter("funcion");

                int vigencia = Integer.parseInt(vigenciaStr);
                float costo = Float.parseFloat(costoStr);
                int stock = Integer.parseInt(stockStr);
                int idSala = Integer.parseInt(idSalaStr);
                int idSede = Integer.parseInt(idSedeStr);
                int idFuncion = Integer.parseInt(idFuncionStr);

                int i=0;
                try {
                    for (Horarios listahorarios : listaHorarios) {
                        if (listahorarios.getIdSede() == idSede && listahorarios.getIdSala() == idSala &&
                                Objects.equals(listahorarios.getDia(), dia) &&
                                Objects.equals(listahorarios.getTiempo_inicio().substring(0, 5), tiempo_inicio)) {
                            i++;
                        }
                    }
                } catch (Exception e){
                    System.out.println("Cruce de horarios");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearHorario");
                    requestDispatcher.forward(request, response);
                }

                System.out.println("El valor de i es: " + i);

                if(i==0) {
                    try {
                        horariosDao.crearHorario(vigencia, costo, dia, tiempo_inicio, stock, idSala, idSede, idFuncion);
                        response.sendRedirect(request.getContextPath() + "/ListaHorarios");

                    } catch (NumberFormatException e) {
                        System.out.println("error al parsear");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearHorario");
                        requestDispatcher.forward(request, response);
                    }
                }else{
                    request.setAttribute("cruce","Cruce de horarios");
                    response.sendRedirect(request.getContextPath() + "/CrearHorario");
                }
            }
        }
    }

    public Horarios leerParametrosRequest(HttpServletRequest request) {
        String vigencia = request.getParameter("vigencia");
        String costo = request.getParameter("costo");
        String dia = request.getParameter("dia");
        String tiempo_inicio = request.getParameter("tiempo_inicio");
        String stock = request.getParameter("stock");
        String idSala = request.getParameter("sala");
        String idSede= request.getParameter("sede");;
        String idFuncion= request.getParameter("funcion");;

        Horarios horario = new Horarios();
        horario.setVigencia(Integer.parseInt(vigencia));
        horario.setCosto(Float.parseFloat(costo));
        horario.setDia(dia);
        horario.setTiempo_inicio(tiempo_inicio);
        horario.setStock(Integer.parseInt(stock));
        horario.setIdSala(Integer.parseInt(idSala));
        horario.setIdSede(Integer.parseInt(idSede));
        horario.setIdFuncion(Integer.parseInt(idFuncion));
        return horario;
    }
}
