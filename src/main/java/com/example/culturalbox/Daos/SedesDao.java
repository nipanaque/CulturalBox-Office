package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Aforo;
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
                sede.setId(rs.getString(1));
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

    public Sedes  encontrarSede(String id) {
        Sedes sede = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT S.idSede,S.nombre, S.ubicacion, S.aforo, DATEDIFF(now(),S.actualiza) AS \"dias de diferencia\" FROM sede S where idSede = ?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    sede = new Sedes();
                    sede.setId(rs.getString(1));
                    sede.setNombre(rs.getString(2));
                    sede.setUbicacion(rs.getString(3));
                    sede.setAforo(rs.getInt(4));
                    sede.setUltimaActualizacion(rs.getString(5));
                }

            } catch (SQLException e) {
                System.out.println("No se pudo realizar la busqueda");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sede;
    }

    public ArrayList<Sedes> obtenerSedeCantidad(){
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

    public ArrayList<Aforo> obtenerAforos(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT A.idSala, A.aforo  FROM sede S, sala A where S.idSede = A.idSede AND S.idSede =?";
        ArrayList<Aforo> listaAforos = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);)
            {
                pstmt.setString(1, id);

                try (ResultSet rs = pstmt.executeQuery();){
                    while (rs.next()) {
                        Aforo aforo = new Aforo();
                        int a = rs.getInt(2);
                        aforo.setAforos(a);
                        listaAforos.add(aforo);
                    }
                }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }

        return listaAforos;
    }

    public void actualizar(ArrayList<Aforo> listaAforos, Sedes sede){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE sala set aforo=? where SalaSede=? and idSede=?";

        for(int i=0; i<listaAforos.size(); i++) {
            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {
                int a = i+1;
                pstmt.setInt(1, listaAforos.get(i).getAforos());
                pstmt.setInt(2, a);
                pstmt.setString(3, sede.getId());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        String sql2 = "UPDATE sede set aforo=? where idSede=?";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt2 = connection.prepareStatement(sql2);){
            pstmt2.setInt(1,sede.getAforo());
            pstmt2.setString(2,sede.getId());
            pstmt2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sql3 = "UPDATE sede set actualiza=now() where idSede=?";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt3 = connection.prepareStatement(sql3);){
            pstmt3.setString(1,sede.getId());
            pstmt3.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
