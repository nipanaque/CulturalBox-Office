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
                historial.setNum_ticket(rs.getInt(1));
                historial.setNombre_funcion(rs.getString(2));
                historial.setNombre_sede(rs.getString(3));
                listaHistorial.add(historial);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaHistorial;
    }
    public ArrayList<Historial> obtenerfuncionesvigentes() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        }
        ArrayList<Historial> listaHistorial = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT f.nombre, s.nombre, c.num_tickets FROM compra c,funcion f,horario h,sede s\n" +
                     "where c.idHorario = h.idHorario\n" +
                     "and h.idSede=s.idSede\n" +
                     "and h.idFuncion=f.idFuncion\n" +
                     "and estadoPago='1';")) {
            while (rs.next()) {
                Historial historial = new Historial();
                historial.setNombre_funcion(rs.getString(1));
                historial.setNombre_sede(rs.getString(2));
                historial.setNum_ticket(rs.getInt(3));
                listaHistorial.add(historial);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaHistorial;
    }
}
