package com.example.culturalbox.Servlets;

import com.example.culturalbox.Daos.PerfilDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "PerfImagenServlet", value = "/PerfImagenServlet")
public class PerfImagenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
        byte [] img = null;
        ServletOutputStream sos = null;
        String sqlQuery = "select fotografia from usuario where idUsuario=1;";
        try{
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                img = rs.getBytes(1);
            }
            sos = response.getOutputStream();
            sos.write(img);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
