package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Mantenimiento;
import com.example.culturalbox.Beans.Sedes;

import java.sql.*;
import java.util.ArrayList;

public class MantenimientoDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Mantenimiento> obtenerMantenimiento() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Mantenimiento> listaMantenimiento = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select concat(nombre,\" \", apellido) as 'Nombre' from mantenimiento;")) {
             while (rs.next()) {
                 String nombre = rs.getString(1);
                 listaMantenimiento.add(new Mantenimiento(nombre));
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaMantenimiento;

    }
}
