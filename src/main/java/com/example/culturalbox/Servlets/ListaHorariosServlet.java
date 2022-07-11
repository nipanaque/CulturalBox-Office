package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Mantenimiento;
import com.example.culturalbox.Beans.Usuario;
import com.example.culturalbox.Daos.CrearFuncionDao;
import com.example.culturalbox.Daos.HorariosDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "ListaHorariosServlet", value = "/ListaHorarios")
public class ListaHorariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horariosDao = new HorariosDao();

        switch (action){
            case "listar"->{
                request.setAttribute("listahorarios",horariosDao.obtenerHorarios());
                RequestDispatcher view =request.getRequestDispatcher("ListaHorarios.jsp");
                view.forward(request,response);
            }
            case "agregarmant"->{
                String id = request.getParameter("id");
                Horarios idHorario = horariosDao.buscarPorId(id);
                ArrayList<Mantenimiento> listaManteniminetoidH = horariosDao.obtenerMatenimientoporHorario(id);
                if (idHorario != null) {
                    request.setAttribute("idHorario",idHorario);
                    request.setAttribute("listaMantenimiento",horariosDao.obtenerMantenimiento());
                    request.setAttribute("listaMantenimientoidH",listaManteniminetoidH);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaMantenimiento.jsp");
                    requestDispatcher.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios");
                }
            }
            case "editar" ->{
                String id = request.getParameter("id");
                Horarios horario = horariosDao.buscarPorIdActHorario(id);
                if (horario != null) {
                    request.setAttribute("idHorario", horario);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditarHorario.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios");
                }
            }
            case "borrar" -> {
                String id = request.getParameter("id");
                horariosDao.eliminarHorario(id);
                response.sendRedirect(request.getContextPath() + "/ListaHorarios");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HorariosDao horarios = new HorariosDao();
        HttpSession session = request.getSession();

        switch (action){
            case "guardarmant" ->{
                String idHorario= request.getParameter("idHorario");
                String idmant = request.getParameter("idMantenimiento");
                ArrayList<Mantenimiento> mantenimiento_has_horario = horarios.obtenerMantenimientoHasHorario();
                int i=0;
                for(Mantenimiento listaMant: mantenimiento_has_horario){
                    if(listaMant.getIdMantenimiento()==Integer.parseInt(idmant) && listaMant.getIdhorario()==Integer.parseInt(idHorario)){
                        i++;
                    }
                }
                if(i==0){
                    horarios.horario_has_mantenimiento(Integer.parseInt(idHorario),Integer.parseInt(idmant));
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=agregarmant&id="+idHorario);
                }else{
                    session.setAttribute("existe","error");
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=agregarmant&id="+idHorario);
                }
            }
            case "crearmant" -> {
                String id = request.getParameter("id");
                String idMant = request.getParameter("idMant");
                String Nombre = request.getParameter("Nombre");
                String Apellido = request.getParameter("Apellido");

                boolean a1 = Nombre.contains(" ");
                boolean a2 = Apellido.contains(" ");
                boolean a3 = Nombre.contains("0") || Nombre.contains("1") || Nombre.contains("2") || Nombre.contains("3") || Nombre.contains("4") || Nombre.contains("5")
                        || Nombre.contains("6") || Nombre.contains("7") || Nombre.contains("8") || Nombre.contains("9");
                boolean a4 = Apellido.contains("0") || Apellido.contains("1") || Apellido.contains("2") || Apellido.contains("3") || Apellido.contains("4") || Apellido.contains("5")
                        || Apellido.contains("6") || Apellido.contains("7") || Apellido.contains("8") || Apellido.contains("9");

                if((!a1)&&(!a2)&&(!a3)&&(!a4)){
                    ArrayList<Mantenimiento> listaMant = horarios.obtenerMantenimiento();
                    int i=0;
                    for(Mantenimiento listaMantenimiento: listaMant){
                        if(Objects.equals(listaMantenimiento.getNombre(), Nombre) && Objects.equals(listaMantenimiento.getApellido(), Apellido)){
                            i++;
                        }
                    }
                    if(i==0){
                        horarios.crear_mant(Integer.parseInt(idMant),Nombre,Apellido);
                        response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=agregarmant&id="+id);
                    }else{
                        session.setAttribute("existe1","error1");
                        response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=agregarmant&id="+id);
                    }
                }else{
                    session.setAttribute("error2","error2");
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=agregarmant&id="+id);
                }
            }
            case "actualizar" -> {
                HorariosDao horariosDao = new HorariosDao();
                ArrayList<Horarios> listaHorarios = horariosDao.obtenerHorarios();
                Horarios horario = null;

                String nombre_funcion = request.getParameter("nombre_funcion1");
                String id = request.getParameter("idhora");
                String dia = request.getParameter("dia");
                String tiempo_inicio = request.getParameter("tiempo_inicio");
                String costoStr = request.getParameter("costo");
                String idSalaStr = request.getParameter("idSala");
                String idSedeStr = request.getParameter("idSede");

                int i=0;
                try {
                    for(Horarios listahorarios: listaHorarios) {
                        if (listahorarios.getIdSede()==Integer.parseInt(idSedeStr) && listahorarios.getIdSala()==Integer.parseInt(idSalaStr) &&
                                Objects.equals(listahorarios.getDia(), dia) &&
                                Objects.equals(listahorarios.getTiempo_inicio().substring(0,5), tiempo_inicio)) {
                            i++;
                        }
                    }
                }catch (Exception e){
                    System.out.println("Cruce de horarios");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CrearHorario");
                    requestDispatcher.forward(request, response);
                }
                System.out.println("El valor de i es: " + i);
                if(i==0){
                    horario = new Horarios();
                    horario.setIdHorario(Integer.parseInt(id));
                    horario.setDia(dia);
                    horario.setTiempo_inicio(tiempo_inicio);
                    horario.setCosto(Float.parseFloat(costoStr));
                    ArrayList<Usuario> listaUsuario = horarios.buscarUsuariosCorreo(id);
                    horarios.enviarCorreo(listaUsuario,nombre_funcion,tiempo_inicio,dia);
                    horarios.actualizarHorario(horario);
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios");
                }else{
                    session.setAttribute("cruce","error");
                    response.sendRedirect(request.getContextPath() + "/ListaHorarios?a=editar&id="+id);
                }

            }
        }
    }

    public Horarios leerParametrosRequest(HttpServletRequest request) {
        String id = request.getParameter("idhora");
        String dia = request.getParameter("dia");
        String tiempo_inicio = request.getParameter("tiempo_inicio");
        String costoStr = request.getParameter("costo");


        Horarios horario = new Horarios();
        horario.setIdHorario(Integer.parseInt(id));
        horario.setDia(dia);
        horario.setTiempo_inicio(tiempo_inicio);
        horario.setCosto(Float.parseFloat(costoStr));
        return horario;

    }
}
