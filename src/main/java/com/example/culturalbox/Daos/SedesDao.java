package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Sedes;

import java.sql.*;
import java.util.ArrayList;

public class SedesDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Sedes> obtenerSedes() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Sedes> listaSedes = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT S.*, count(A.idSala ) AS \"Cantidad Salas\" FROM sede S, sala A where S.idSede = \n" +
                     "A.idSede GROUP BY S.idSede")) {
            while (rs.next()) {
                Sedes sede = new Sedes();
                sede.setNombre(rs.getString(2));
                sede.setAforo(rs.getInt(4));
                sede.setUbicacion(rs.getString(6));
                sede.setCantidadSalas(rs.getInt(7));
                listaSedes.add(sede);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaSedes;

    }

    public ArrayList<Sedes> obtenerSedeCantidad() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Sedes> listaSedes_Cantidad = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT nombre, count(A.idSala ) AS \"Cantidad Salas\" FROM sede S, sala A where S.idSede = \n" +
                     "A.idSede GROUP BY S.idSede")) {
            while (rs.next()) {
                Sedes sede = new Sedes();
                sede.setNombre(rs.getString(1));
                sede.setCantidadSalas(rs.getInt(2));
                listaSedes_Cantidad.add(sede);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaSedes_Cantidad;

    }
}
