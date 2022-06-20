//Este servlet unicamente renderiza imagenes

package com.example.culturalbox.Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ImgEstadServlet", value = "/ImgEstadServlet")
public class ImgEstadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        String action = request.getParameter("a") == null? "inicio" : request.getParameter("a");

        switch (action){
            case "Funciones" -> {
                String id = request.getParameter("id");
                byte [] img = null;
                ServletOutputStream sos = null;
                String sql = "select banner from funcion where idFuncion = ?;";

                try (Connection conn = DriverManager.getConnection(url, user, pass);
                     PreparedStatement pstmt = conn.prepareStatement(sql);) {

                    pstmt.setString(1,id);
                    try(ResultSet rs = pstmt.executeQuery();){
                        if(rs.next()){
                            img = rs.getBytes(1);
                        }
                        sos = response.getOutputStream();
                        sos.write(img);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }//Falta el finally para cerrar apropiadamente (preguntar)
            }
            case "Actores" -> {
                String id = request.getParameter("id");
                byte [] img2 = null;
                ServletOutputStream sos = null;
                String sql = "select fotografia from actor where idActor = ?;";

                try (Connection conn = DriverManager.getConnection(url, user, pass);
                     PreparedStatement pstmt = conn.prepareStatement(sql);) {

                    pstmt.setString(1,id);
                    try(ResultSet rs = pstmt.executeQuery();){
                        if(rs.next()){
                            img2 = rs.getBytes(1);
                        }
                        sos = response.getOutputStream();
                        sos.write(img2);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }//Falta el finally para cerrar apropiadamente (preguntar)
            }
            case "Directores" -> {
                String id = request.getParameter("id");
                byte [] img3 = null;
                ServletOutputStream sos = null;
                String sql = "select fotografia from director where idDirector = ?;";

                try (Connection conn = DriverManager.getConnection(url, user, pass);
                     PreparedStatement pstmt = conn.prepareStatement(sql);) {

                    pstmt.setString(1,id);
                    try(ResultSet rs = pstmt.executeQuery();){
                        if(rs.next()){
                            img3 = rs.getBytes(1);
                        }
                        sos = response.getOutputStream();
                        sos.write(img3);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }//Falta el finally para cerrar apropiadamente (preguntar)
            }
        }
    }
}
