package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.PerfilDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
@MultipartConfig
@WebServlet(name = "PerfilServlet", value = "/PerfilServlet")
public class PerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PerfilDao perfilDao = new PerfilDao();
        request.setAttribute("listaPerfil",perfilDao.obtenerPerfil());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Perfil.jsp");
        requestDispatcher.forward(request,response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String direccion = (String) request.getParameter("direccion");
        String nacimiento = (String) request.getParameter("nacimiento");
        String telefono =  (String)request.getParameter("telefono");
        Part fotografiaStr = request.getPart("f_subir");
        InputStream fotografia = fotografiaStr.getInputStream();
        PerfilDao pd = new PerfilDao();
        if(fotografia.available()==0){
            pd.actualizar2(direccion,telefono,nacimiento);
        }else{
            pd.actualizar(direccion,telefono,nacimiento,fotografia);
        }
        response.sendRedirect(request.getContextPath()+"/PerfilServlet");

    }
}
