package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Operadores;

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
             ResultSet rs = stmt.executeQuery("SELECT CONCAT(u.nombre,' ',u.apellido) AS 'Operador', u.correo_pucp AS 'Correo' FROM usuario u WHERE u.idUsuario = 2 ")) {
            while (rs.next()) {
                String nombre = rs.getString(1);
                String correo = rs.getString(2);
                listaOperadores.add(new Operadores(nombre,correo));
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaOperadores;
    }

}
