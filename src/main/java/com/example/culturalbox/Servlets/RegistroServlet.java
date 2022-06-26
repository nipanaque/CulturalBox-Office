package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Registro;
import com.example.culturalbox.Daos.RegistroDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

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
        String codigo;
        String nombre;
        String apellido;
        String dni;
        String correo_pucp;
        String telefono;
        String nacimiento;
        String contrasenha;
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
                request.setAttribute("primer_registro",registroDao.obtenerRegistro(codigo,nombre,apellido,dni,telefono,nacimiento,direccion));
                RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerCont.jsp");
                view.forward(request,response);
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
                request.setAttribute("segundo_registro",registroDao.obtenerRegistro2(codigo,nombre,apellido,dni,telefono,nacimiento,direccion,correo_pucp));
                RequestDispatcher view =request.getRequestDispatcher("UsuarioEstablecerContReg.jsp");
                view.forward(request,response);
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
                registroDao.crearUsuario(codigo,nombre,apellido,dni,correo_pucp,telefono,nacimiento,contrasenha,direccion);
                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            }
        }


    }
}
