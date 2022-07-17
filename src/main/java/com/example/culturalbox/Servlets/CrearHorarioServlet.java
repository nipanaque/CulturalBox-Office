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
        HttpSession session = request.getSession();

        switch (action){
            case "guardar" -> {
                //break;
                String vigenciaStr = request.getParameter("vigencia");
                String costoStr = request.getParameter("costo");
                String dia = request.getParameter("dia");
                String tiempo_inicio = request.getParameter("tiempo_inicio");
                String stockStr = request.getParameter("stock");
                String entradDispnStr = stockStr;
                String idSalaStr = request.getParameter("sala");
                String idSedeStr = request.getParameter("sede");
                String idFuncionStr = request.getParameter("funcion");
                Horarios horarioDuracion = horariosDao.duracionFuncion(idFuncionStr);

                if(idSedeStr.equals("1")){
                    switch (idSalaStr) {
                        case "1" -> idSalaStr = String.valueOf(1);
                        case "2" -> idSalaStr = String.valueOf(2);
                        case "3" -> idSalaStr = String.valueOf(5);
                        case "4" -> idSalaStr = String.valueOf(6);
                    }
                }else{
                    switch (idSalaStr){
                        case "1" -> idSalaStr = String.valueOf(3);
                        case "2" -> idSalaStr = String.valueOf(4);
                        case "3" -> idSalaStr = String.valueOf(7);
                        case "4" -> idSalaStr = String.valueOf(8);
                    }
                }

                int vigencia = Integer.parseInt(vigenciaStr);
                float costo = Float.parseFloat(costoStr);
                int stock = Integer.parseInt(stockStr);
                int entradDispn = Integer.parseInt(entradDispnStr);
                int idSala = Integer.parseInt(idSalaStr);
                int idSede = Integer.parseInt(idSedeStr);
                int idFuncion = Integer.parseInt(idFuncionStr);
                int validacion = horariosDao.ValidaCruce(idSede,idSala,dia,tiempo_inicio,horarioDuracion.getDuracion_funcion());
                ArrayList<Horarios> AforoSalas = horariosDao.obtenerAforoSalas();

                int i=0;
                int j=0;
                int k=0;
                try {
                    for (Horarios listahorarios : listaHorarios) {
                        if (listahorarios.getIdSede() == idSede && listahorarios.getIdSala() == idSala &&
                                Objects.equals(listahorarios.getDia(), dia) &&
                                Objects.equals(listahorarios.getTiempo_inicio().substring(0, 5), tiempo_inicio)) {
                            i++;
                        }
                    }
                    for(Horarios listaAforoSalas: AforoSalas){
                        if(listaAforoSalas.getIdSala()==idSala){
                            if(stock>listaAforoSalas.getAforo_sala()){
                                k++;
                            }
                        }
                    }
                    if(validacion==1){
                        i++;
                    }
                    if(costo>20){
                        j=1;
                    }
                } catch (Exception e){
                    System.out.println("Cruce de horarios");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearHorario");
                    requestDispatcher.forward(request, response);
                }

                System.out.println("El valor de i es: " + i);

                if(i==0 && j==0 && k==0) {
                    try {
                        horariosDao.crearHorario(vigencia, costo, dia, tiempo_inicio, stock, idSala, idSede, idFuncion, entradDispn);
                        response.sendRedirect(request.getContextPath() + "/ListaHorarios");

                    } catch (NumberFormatException e) {
                        System.out.println("error al parsear");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearHorario");
                        requestDispatcher.forward(request, response);
                    }
                }else if(i>0){
                    session.setAttribute("cruce","error");
                    response.sendRedirect(request.getContextPath() + "/CrearHorario");
                }else if(j>0){
                    session.setAttribute("costo","error");
                    response.sendRedirect(request.getContextPath() + "/CrearHorario");
                }else if(k>0){
                    session.setAttribute("aforo","error");
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