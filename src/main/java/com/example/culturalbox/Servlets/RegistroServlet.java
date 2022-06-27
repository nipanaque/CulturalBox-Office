package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Registro;
import com.example.culturalbox.Daos.RegistroDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;

@WebServlet(name = "RegistroServlet", value = "/RegistroUsuarioServlet")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher view =request.getRequestDispatcher("UsuarioRegistro.jsp");
        view.forward(request,response);
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RegistroDao registroDao = new RegistroDao();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RegistroDao registroDao = new RegistroDao();
        ArrayList<Registro> listaUsuarios = registroDao.obtenerUsuarios();

        String codigo;
        String nombre;
        String apellido;
        String dni;
        String correo_pucp;
        String telefono;
        String nacimiento;
        String contrasenha;
        String contrasenha_confirmada;
        String direccion;

        switch (action){
            case "p_validacion" ->{
                codigo = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                dni = request.getParameter("dni");
                telefono = request.getParameter("telefono");
                nacimiento = request.getParameter("nacimiento");
                direccion = request.getParameter("direccion");

                System.out.println(codigo+" "+nombre+" "+apellido+" "+dni+" "+telefono+" "+nacimiento+" "+direccion);

                int i=0;
                for(Registro listausuarios: listaUsuarios){
                    if(Objects.equals(listausuarios.getCodigo(), codigo) || Objects.equals(listausuarios.getDni(), dni)
                        || Objects.equals(listausuarios.getTelefono(), telefono)){
                        i++;
                    }
                }
                if(i==0){
                    request.setAttribute("primer_registro",registroDao.obtenerRegistro(codigo,nombre,apellido,dni,telefono,nacimiento,direccion));
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerCont.jsp");
                    view.forward(request,response);
                }else{
                    request.setAttribute("invalid1","incorrecto");
                    response.sendRedirect(request.getContextPath() + "/RegistroUsuarioServlet");
                }
            }
            case "s_validacion" ->{
                codigo = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                dni = request.getParameter("dni");
                telefono = request.getParameter("telefono");
                nacimiento = request.getParameter("nacimiento");
                direccion = request.getParameter("direccion");
                correo_pucp = request.getParameter("correo");

                System.out.println(codigo+" "+nombre+" "+apellido+" "+dni+" "+telefono+" "+nacimiento+" "+direccion+" "+correo_pucp);

                int i=0;
                for(Registro listausuarios: listaUsuarios){
                    if(Objects.equals(listausuarios.getCorreo_pucp(), correo_pucp)){
                        i++;
                    }
                }
                if(i==0){
                    request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerContReg.jsp");
                    view.forward(request,response);
                }else{
                    request.setAttribute("invalid2","incorrecto");
                    response.sendRedirect(request.getContextPath() + "/RegistroUsuarioServlet");
                }
            }
            case "validacion" ->{
                codigo = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                dni = request.getParameter("dni");
                telefono = request.getParameter("telefono");
                nacimiento = request.getParameter("nacimiento");
                direccion = request.getParameter("direccion");
                correo_pucp = request.getParameter("correo");
                contrasenha = request.getParameter("contrasenha");
                contrasenha_confirmada = request.getParameter("contrasenha_confirmada");

                System.out.println(codigo+" "+nombre+" "+apellido+" "+dni+" "+telefono+" "+nacimiento+" "+direccion+" "+correo_pucp+" "+contrasenha);
                if(Objects.equals(contrasenha, contrasenha_confirmada)){
                    request.setAttribute("tercer_registro",registroDao.obtenerRegistro3(codigo,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp,contrasenha_confirmada));
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioContrasenhaConf.jsp");
                    view.forward(request,response);
                }else{
                    request.setAttribute("invalid3","incorrecto");
                    response.sendRedirect(request.getContextPath() + "/RegistroUsuarioServlet");
                }
            }
            case "validacion_final" ->{
                codigo = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                dni = request.getParameter("dni");
                telefono = request.getParameter("telefono");
                nacimiento = request.getParameter("nacimiento");
                direccion = request.getParameter("direccion");
                correo_pucp = request.getParameter("correo");
                contrasenha = request.getParameter("contrasenha");
                registroDao.crearUsuario(codigo,nombre,apellido,dni,correo_pucp,telefono,nacimiento,contrasenha,direccion);
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            }
        }


    }
}
