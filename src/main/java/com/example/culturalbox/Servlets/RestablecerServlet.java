package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Registro;
import com.example.culturalbox.Daos.RegistroDao;
import com.example.culturalbox.Daos.RestablecerDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RestablecerServlet", value = "/RestablecerContrasenhaServlet")
public class RestablecerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher view =request.getRequestDispatcher("RestablecerCont.jsp");
        view.forward(request,response);
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RegistroDao registroDao = new RegistroDao();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        RestablecerDao restablecerDao = new RestablecerDao();

        String email;
        String contra;
        String recontra;
        switch (action){
            case "nuevo"->{
                email = request.getParameter("InputEmail");

                request.setAttribute("primer_registro", restablecerDao.obtenerCorreo(email));
                RequestDispatcher view =request.getRequestDispatcher("RestablecerCont.jsp");
                view.forward(request,response);
            }
            case "restablecer"->{
                email = request.getParameter("InputEmail");
                contra = request.getParameter("InputPassword");
                recontra = request.getParameter("InputPassword");

                if(contra == recontra){
                    request.setAttribute("primer_registro", restablecerDao.obtenerInfo(email, contra));
                    RequestDispatcher view =request.getRequestDispatcher("RestablecerCont.jsp");
                    view.forward(request,response);
                }
            }
            case "actualizar"->{
                email = request.getParameter("InputEmail");
                contra = request.getParameter("InputPassword");
                restablecerDao.cambiarcontra(email,contra);
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            }
        }
    }
}
