package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Operadores;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class OperadoresDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Operadores> obtenerOperadores() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Operadores> listaOperadores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT u.nombre,u.apellido, u.correo_pucp, u.idUsuario FROM usuario u WHERE u.idRoles = 2  ")) {
            while (rs.next()) {
                String nombre = rs.getString(1);
                String apellido = rs.getString(2);
                String correo = rs.getString(3);
                String id = rs.getString(4);
                listaOperadores.add(new Operadores(nombre,apellido,correo,id));
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaOperadores;
    }

    public void crearOperador(String nombre, String apellido,String correo_pucp, String contrasenha){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO usuario (nombre,apellido,correo_pucp,contrasenha,idRoles) VALUES (?,?,?,?,2)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, correo_pucp);
            pstmt.setString(4, contrasenha);
            pstmt.executeUpdate();
            System.out.print("aquie estoy");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void crearOperadorFoto(String nombre, String apellido,String correo_pucp, String contrasenha, InputStream foto){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO usuario (nombre,apellido,correo_pucp,contrasenha,idRoles,fotografia) VALUES (?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, correo_pucp);
            pstmt.setString(4, contrasenha);
            pstmt.setInt(5, 2);
            pstmt.setBlob(6,foto);
            pstmt.executeUpdate();
            System.out.print("aquie estoy");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrarOperador(String operadorId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE FROM usuario u WHERE u.idUsuario = ? AND u.idRoles = 2;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, operadorId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
