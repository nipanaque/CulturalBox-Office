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
        view.forward(request,response);
        System.out.println("email");
        RestablecerDao restablecerDao = new RestablecerDao();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RestablecerDao restablecerDao = new RestablecerDao();
        System.out.println("correo");

        String email;
        String contra;
        String recontra;
        switch (action){
            case "nuevo" ->{
                email = request.getParameter("InputEmail");
                System.out.println(email);
                request.setAttribute("primer_registro", restablecerDao.obtenerCorreo(email));
                RequestDispatcher view = request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                view.forward(request,response);
            }
            case "restablecer" ->{
                email = request.getParameter("InputEmail");
                contra = request.getParameter("InputPassword");
                recontra = request.getParameter("ReInputPassword");

                if(contra == recontra){
                    request.setAttribute("primer_registro", restablecerDao.obtenerInfo(email, contra));
                    RequestDispatcher view =request.getRequestDispatcher("EstablecerNuevaCont.jsp");
                    view.forward(request,response);
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
