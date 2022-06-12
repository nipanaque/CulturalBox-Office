package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Perfil;

import java.sql.*;
import java.util.ArrayList;

public class PerfilDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Perfil> obtenerPerfil() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Perfil> listaPerfil = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM cultura_box_pucp.usuario;")){
            while (rs.next()) {
                Perfil perfil = new Perfil();
                perfil.setDni(rs.getInt(5));
                perfil.setCodigo_pucp(rs.getInt(2));
                perfil.setCorreo_pucp(rs.getString(6));
                perfil.setFecha_nacimiento(rs.getString(8));
                perfil.setNumtelefono(rs.getInt(7));
                listaPerfil.add(perfil);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaPerfil;
    }

}
