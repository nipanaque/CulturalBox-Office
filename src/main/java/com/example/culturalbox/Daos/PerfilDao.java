package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Perfil;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class PerfilDao {

    public ArrayList<Perfil> obtenerPerfil(int id) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Perfil> listaPerfil = new ArrayList<>();
        String sql = "SELECT * FROM cultura_box_pucp.usuario where idUsuario= ? ;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,id);
            try (ResultSet rs = pstmt.executeQuery();) {

                    while (rs.next()) {
                        Perfil perfil = new Perfil();
                        perfil.setDni(rs.getInt(5));
                        perfil.setCodigo_pucp(rs.getInt(2));
                        perfil.setCorreo_pucp(rs.getString(6));
                        perfil.setFecha_nacimiento(rs.getString(8));
                        perfil.setNumtelefono(rs.getInt(7));
                        perfil.setDireccion(rs.getString(12));
                        perfil.setNombre_completo(rs.getString(3)+" "+rs.getString(4));
                        listaPerfil.add(perfil);
                    }

            }



        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaPerfil;
    }

    public void actualizar(String direccion, String telefono, String nacimiento,InputStream fotografia,int id) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE usuario SET direccion=?,telefono=?,nacimiento=?,fotografia=? where idUsuario=?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, direccion);
            pstmt.setString(2, telefono);
            pstmt.setString(3, nacimiento);
            pstmt.setBlob(4,fotografia);
            pstmt.setInt(5,id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void actualizar2(String direccion, String telefono, String nacimiento,int id) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE usuario SET direccion=?,telefono=?,nacimiento=? where idUsuario=?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, direccion);
            pstmt.setString(2, telefono);
            pstmt.setString(3, nacimiento);
            pstmt.setInt(4,id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}