package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Restablecer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class RestablecerDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public void cambiarcontra(String email, String contrasenha) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE usuario SET contrasenha = sha2(?,256) WHERE correo_pucp = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, contrasenha);
            pstmt.setString(2, email);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Restablecer> obtenerCorreo(String email) {

        ArrayList<Restablecer> lista = new ArrayList<>();

        Restablecer restablecer = new Restablecer();
        restablecer.setCorreo_pucp(email);

        return lista;
    }

    public ArrayList<Restablecer> obtenerInfo(String email, String contra) {

        ArrayList<Restablecer> lista = new ArrayList<>();

        Restablecer restablecer = new Restablecer();
        restablecer.setCorreo_pucp(email);
        restablecer.setContra(contra);

        return lista;
    }
}
