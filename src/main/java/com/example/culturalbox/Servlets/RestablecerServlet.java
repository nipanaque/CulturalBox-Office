package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.RegistroDao;
import com.example.culturalbox.Daos.RestablecerDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;

@WebServlet(name = "RestablecerServlet", value = "/RestablecerContrasenhaServlet")
public class RestablecerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher view =request.getRequestDispatcher("RestablecerCont.jsp");
        request.setAttribute("invalid_correo", "null");
        view.forward(request,response);
        System.out.println("email");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RestablecerDao restablecerDao = new RestablecerDao();
        System.out.println("correo");

        String email;
        String contra;
        String recontra;
        String codigo;
        String verificador;
        switch (action) {
            case "validar" -> {
                email = request.getParameter("correo");
                System.out.println(email);
                int buscador = restablecerDao.buscarCorreo(email);
                System.out.println(buscador);
                if (buscador == 0) {
                    session.setAttribute("invalid_correo", "error");
                    response.sendRedirect(request.getContextPath() + "/RestablecerContrasenhaServlet");
                } else {
                    codigo = "";
                    String[] nums = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
                    for (int j = 0; j < 11; j++) {
                        codigo += nums[(int) Math.round(Math.random() * 9)];
                    }
                    restablecerDao.enviarCodigo(email, codigo);
                    session.setAttribute("id", codigo);
                    session.setAttribute("email", email);
                    session.setAttribute("invalid_id", "null");
                    session.setAttribute("invalid_repeat", "null");
                    session.setAttribute("invalid_pass", "null");
                    RequestDispatcher view = request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                    view.forward(request, response);
                }
            }
            case "nuevo" -> {
                email = request.getParameter("InputEmail");
                System.out.println(email);
                request.setAttribute("primer_registro", restablecerDao.obtenerCorreo(email));
                RequestDispatcher view = request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                view.forward(request, response);
            }
            case "restablecer" -> {
                email = request.getParameter("correo");
                verificador = request.getParameter("verificador");
                codigo = request.getParameter("codigo");
                contra = request.getParameter("pass");
                recontra = request.getParameter("pass2");
                if (!(verificador.equals(codigo))) {
                    session.setAttribute("invalid_id", "error");
                    RequestDispatcher view =request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                    view.forward(request,response);
                } else {
                    if (!(contra.equals(recontra))) {
                        session.setAttribute("invalid_repeat", "error");
                        RequestDispatcher view =request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                        view.forward(request,response);
                    }
                    else{
                        restablecerDao.cambiarcontra(email,contra);
                        response.sendRedirect(request.getContextPath() + "/LoginServlet");
                    }
                }
            }
            case "actualizar" ->{
                email = request.getParameter("InputEmail");
                contra = request.getParameter("InputPassword");
                restablecerDao.cambiarcontra(email,contra);
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            }
        }
    }
}
