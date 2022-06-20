package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Perfil;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class PerfilDao {

    public ArrayList<Perfil> obtenerPerfil() {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Perfil> listaPerfil = new ArrayList<>();


        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM cultura_box_pucp.usuario where idUsuario=1;");) {
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


        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaPerfil;
    }

    public void actualizar(String direccion, String telefono, String nacimiento,InputStream fotografia) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE usuario SET direccion=?,telefono=?,nacimiento=?,fotografia=? where idUsuario=1";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, direccion);
            pstmt.setString(2, telefono);
            pstmt.setString(3, nacimiento);
            pstmt.setBlob(4,fotografia);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void actualizar2(String direccion, String telefono, String nacimiento) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE usuario SET direccion=?,telefono=?,nacimiento=? where idUsuario=1";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, direccion);
            pstmt.setString(2, telefono);
            pstmt.setString(3, nacimiento);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}