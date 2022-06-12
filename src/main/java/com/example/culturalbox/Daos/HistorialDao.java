package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Calificacion;
import com.example.culturalbox.Beans.Historial;

import java.sql.*;
import java.util.ArrayList;

public class HistorialDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Historial> obtenerHistorial() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Historial> listaHistorial = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT f.idFuncion, f.nombre as 'Funcion', s.nombre as 'Sede' FROM funcion f, horario h, sede s\n" +
                     "where f.idFuncion = h.idFuncion\n" +
                     "AND h.idSede = s.idSede;")) {
            while (rs.next()) {
                Historial historial = new Historial();
                historial.setNombre_funcion(rs.getString(2));
                historial.setNombre_sede(rs.getString(3));
                listaHistorial.add(historial);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaHistorial;
    }
}
