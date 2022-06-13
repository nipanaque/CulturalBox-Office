package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.SalaReporte;

import java.sql.*;
import java.util.ArrayList;

public class SalaReporteDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<SalaReporte> reporteFechaSede(String Fecha, String idSede){
        ArrayList<SalaReporte> listasalas = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "select sal.idSala , sal.SalaSede from sala sal, horario h where h.idSala=sal.idSala and h.dia like ? and sal.idSede=? ";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + Fecha + "%");
            pstmt.setString(2,idSede);

            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()) {
                    SalaReporte salaReporte = new SalaReporte();
                    salaReporte.setSalaSede(rs.getInt(1));
                    listasalas.add(salaReporte);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listasalas;
    }

}
