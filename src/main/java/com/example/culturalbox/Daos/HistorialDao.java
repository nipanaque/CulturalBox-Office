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
             ResultSet rs = stmt.executeQuery(" SELECT f.idFuncion, f.nombre as 'Funcion', s.nombre as 'Sede' FROM compra c,funcion f,horario h,sede s\n" +
                     "                     where c.idHorario = h.idHorario\n" +
                     "                     and h.idSede=s.idSede\n" +
                     "                     and h.idFuncion=f.idFuncion\n" +
                     "                    and c.estado=1 and c.idUsuario=1 and h.vigencia = 0;")) {
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
             ResultSet rs = stmt.executeQuery("SELECT f.nombre, s.nombre, c.numtickets,c.idCompra FROM compra c,funcion f,horario h,sede s\n" +
                     "                     where c.idHorario = h.idHorario\n" +
                     "                     and h.idSede=s.idSede\n" +
                     "                     and h.idFuncion=f.idFuncion\n" +
                     "                    and c.estado=1 and c.idUsuario=1 and h.vigencia = 1;")) {
            while (rs.next()) {
                Historial historial = new Historial();
                historial.setNombre_funcion(rs.getString(1));
                historial.setNombre_sede(rs.getString(2));
                historial.setNum_ticket(rs.getInt(3));
                historial.setIdCompra(rs.getInt(4));
                listaHistorial.add(historial);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaHistorial;
    }
    public void cancelar(int idCompra){
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "DELETE FROM compra where idCompra=? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idCompra);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    }

