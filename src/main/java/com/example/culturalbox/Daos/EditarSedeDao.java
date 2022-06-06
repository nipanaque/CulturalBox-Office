package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Aforo;


import java.sql.*;
import java.util.ArrayList;

public class EditarSedeDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Aforo> obtenerAforo() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Aforo> listaAforos = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT A.idSala, A.aforo  FROM sede S, sala A \n" +
                     "where S.idSede = A.idSede \n" +
                     "\tAND S.idSede =1\n")) {
            while (rs.next()) {
                Aforo aforo = new Aforo();
                int a = rs.getInt(2);
                aforo.setAforos(a);
                listaAforos.add(aforo);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }

        return listaAforos;
    }
}