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

    public String primeraMayus(String nombre) {
        char[] arr = nombre.toCharArray();
        arr[0] = Character.toUpperCase(arr[0]);
        return new String(arr);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RegistroDao registroDao = new RegistroDao();
        HttpSession session = request.getSession();
        ArrayList<Registro> listaUsuarios = registroDao.obtenerUsuarios();

        String codigo;
        String nombre;
        String apellido;
        String dni;
        String correo_pucp;
        String correo_pucp1;
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

                String nombreFormato = primeraMayus(nombre);
                String apellidoFormato = primeraMayus(apellido);

                System.out.println(codigo+" "+nombreFormato+" "+apellidoFormato+" "+dni+" "+telefono+" "+nacimiento+" "+direccion);

                int i=0;
                for(Registro listausuarios: listaUsuarios){
                    if(Objects.equals(listausuarios.getCodigo(), codigo) || Objects.equals(listausuarios.getDni(), dni)
                            || Objects.equals(listausuarios.getTelefono(), telefono)){
                        i++;
                    }
                }
                if(i==0){
                    request.setAttribute("primer_registro",registroDao.obtenerRegistro(codigo,nombreFormato,apellidoFormato,dni,telefono,nacimiento,direccion));
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerCont.jsp");
                    view.forward(request,response);
                }else{
                    session.setAttribute("invalid1","error");
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
                correo_pucp1 = request.getParameter("correo1");

                System.out.println(codigo+" "+nombre+" "+apellido+" "+dni+" "+telefono+" "+nacimiento+" "+direccion+" "+correo_pucp);
                int i=0;
                if(Objects.equals(correo_pucp1, correo_pucp)){
                    for(Registro listausuarios: listaUsuarios){
                        if(Objects.equals(listausuarios.getCorreo_pucp(), correo_pucp)){
                            i++;
                        }
                    }
                }else{
                    i=2;
                }
                if(i==0){
                    String id="";
                    String[] nums = {"0","1","2","3","4","5","6","7","8","9"};
                    for (int j = 0; j < 11; j++ ) {
                        id += nums[(int) Math.round(Math.random() * 9)];
                    }
                    registroDao.enviarCodigo(correo_pucp,id);
                    request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                    request.setAttribute("id",id);
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioCorreoVal.jsp");
                    view.forward(request,response);
                }else if(i==1){
                    request.setAttribute("primer_registro",registroDao.obtenerRegistro(codigo,nombre,apellido,dni,telefono,nacimiento,direccion));
                    session.setAttribute("invalid2","error");
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerCont.jsp");
                    view.forward(request,response);
                }else{
                    request.setAttribute("primer_registro",registroDao.obtenerRegistro(codigo,nombre,apellido,dni,telefono,nacimiento,direccion));
                    session.setAttribute("invalid_correo","error");
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerCont.jsp");
                    view.forward(request,response);
                }
            }
            case "codigo_validacion" ->{
                String codigo_pucp = request.getParameter("codigo");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                dni = request.getParameter("dni");
                telefono = request.getParameter("telefono");
                nacimiento = request.getParameter("nacimiento");
                direccion = request.getParameter("direccion");
                correo_pucp = request.getParameter("correo");
                String id = request.getParameter("id");
                String id_conf = request.getParameter("id_validacion");
                int i=0;
                if(Objects.equals(id, id_conf)){
                    i=1;
                }
                if(i==1){
                    request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo_pucp,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerContReg.jsp");
                    view.forward(request,response);
                }else{
                    request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo_pucp,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                    request.setAttribute("id",id);
                    session.setAttribute("invalid_id","error");
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioCorreoVal.jsp");
                    view.forward(request,response);
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
                    request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                    session.setAttribute("invalid3","error");
                    RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerContReg.jsp");
                    view.forward(request,response);
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
