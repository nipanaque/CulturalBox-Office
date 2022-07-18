package com.example.culturalbox.Servlets;

import com.example.culturalbox.Beans.Usuario;
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
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioSesion");
        int id = user.getId();
        System.out.println(id);
        request.setAttribute("listaPerfil",perfilDao.obtenerPerfil(id));
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
        HttpSession session = request.getSession();
        InputStream fotografia = fotografiaStr.getInputStream();
        PerfilDao pd = new PerfilDao();
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioSesion");
        int id = user.getId();
        boolean a1 = direccion.equals("");
        char [] ch = direccion.toCharArray();
        boolean a2 = ch[0]==' ';


        if(fotografia.available()==0){
            if(!a1 && !a2){
                pd.actualizar2(direccion,telefono,nacimiento,id);
                response.sendRedirect(request.getContextPath()+"/PerfilServlet");
            }else{
                session.setAttribute("invalid1","error");
                response.sendRedirect(request.getContextPath()+"/PerfilServlet");
            }
        }else{
            if(!a1 && !a2){
                pd.actualizar(direccion,telefono,nacimiento,fotografia,id);
                response.sendRedirect(request.getContextPath()+"/PerfilServlet");
            }else{
                session.setAttribute("invalid1","error");
                response.sendRedirect(request.getContextPath()+"/PerfilServlet");
            }
        }
    }
}
