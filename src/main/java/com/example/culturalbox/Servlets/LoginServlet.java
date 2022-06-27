package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Usuario;
import com.example.culturalbox.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indicador = request.getParameter("a")==null ? "correcto" : request.getParameter("a");
        RequestDispatcher requestDispatcher;
        switch (indicador){
            case "error":
               indicador = "error";
               break;
            case "correcto":
                indicador = "correcto";
                break;
        }
        request.setAttribute("indicador",indicador);
        requestDispatcher = request.getRequestDispatcher("Login.jsp");
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDao loginDao = new LoginDao();
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        Usuario usuario = loginDao.validar(correo, pass);

        if(usuario !=null){
            HttpSession session = request.getSession();
            session.setAttribute("usuarioSesion",usuario);
            response.sendRedirect(request.getContextPath()+"/MenuServlet");
        }else{

            response.sendRedirect(request.getContextPath()+"/LoginServlet?a=error");
        }

    }
}
