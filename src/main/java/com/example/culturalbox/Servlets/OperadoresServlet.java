package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Operadores;
import com.example.culturalbox.Daos.OperadoresDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Objects;

@MultipartConfig
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
        HttpSession session = request.getSession();

        switch (action) {
            case "agregar" -> {
                String nombre = request.getParameter("nombre").toLowerCase();
                String apellido = request.getParameter("apellido").toLowerCase();
                String correo_pucp = request.getParameter("correo").toLowerCase();
                String contrasenha = request.getParameter("contrasenha").toLowerCase();
                String contrasenha1 = request.getParameter("contrasenha1").toLowerCase();
                Part fotoStr = request.getPart("foto");
                if(fotoStr==null){
                    String nombreFormato = primeraMayus(nombre);
                    String apellidoFormato = primeraMayus(apellido);

                    System.out.print(nombreFormato+" "+apellidoFormato+" "+correo_pucp+" "+contrasenha1+" "+contrasenha1+" "+fotoStr);

                    ArrayList<Operadores> listaOperadores = operadoresDao.obtenerOperadores();
                    int i=0;
                    int j=0;
                    if(contrasenha1.equals(contrasenha)){
                        j=1;
                    }
                    for(Operadores listaoperadores: listaOperadores){
                        if(Objects.equals(listaoperadores.getCorreo(), correo_pucp)){
                            i++;
                        }
                    }
                    if(j==1){
                        if(i==0){
                            operadoresDao.crearOperador(nombreFormato, apellidoFormato, correo_pucp, contrasenha);
                            response.sendRedirect(request.getContextPath() + "/operadores");
                        }else{
                            session.setAttribute("invalid1","error");
                            RequestDispatcher view =request.getRequestDispatcher("AgregarOperador.jsp");
                            view.forward(request,response);
                        }
                    }else{
                        session.setAttribute("invalid2","error");
                        RequestDispatcher view =request.getRequestDispatcher("AgregarOperador.jsp");
                        view.forward(request,response);
                    }
                }else{
                    InputStream foto = fotoStr.getInputStream();

                    String nombreFormato = primeraMayus(nombre);
                    String apellidoFormato = primeraMayus(apellido);

                    System.out.print(nombreFormato+" "+apellidoFormato+" "+correo_pucp+" "+contrasenha1+" "+contrasenha1+" "+fotoStr);

                    ArrayList<Operadores> listaOperadores = operadoresDao.obtenerOperadores();
                    int i=0;
                    int j=0;
                    if(contrasenha1.equals(contrasenha)){
                        j=1;
                    }
                    for(Operadores listaoperadores: listaOperadores){
                        if(Objects.equals(listaoperadores.getCorreo(), correo_pucp)){
                            i++;
                        }
                    }
                    if(j==1){
                        if(i==0){
                            operadoresDao.crearOperadorFoto(nombreFormato, apellidoFormato, correo_pucp, contrasenha,foto);
                            response.sendRedirect(request.getContextPath() + "/operadores");
                        }else{
                            session.setAttribute("invalid1","error");
                            RequestDispatcher view =request.getRequestDispatcher("AgregarOperador.jsp");
                            view.forward(request,response);
                        }
                    }else{
                        session.setAttribute("invalid2","error");
                        RequestDispatcher view =request.getRequestDispatcher("AgregarOperador.jsp");
                        view.forward(request,response);
                    }
                }

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
