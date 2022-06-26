package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Horarios;
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
        String sql = "select sal.idSala , sal.SalaSede, sal.idSede, h.dia \n" +
                "                from sala sal, horario h\n" +
                "                where h.idSala=sal.idSala and h.dia like ? and sal.idSede=? group by sal.SalaSede ";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + Fecha + "%");
            pstmt.setString(2,idSede);

            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()) {
                    SalaReporte salaReporte = new SalaReporte();
                    salaReporte.setIdSala(rs.getInt(1));
                    salaReporte.setSalaSede(rs.getInt(2));
                    salaReporte.setIdSede(rs.getInt(3));
                    salaReporte.setDia(rs.getString(4));
                    listasalas.add(salaReporte);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listasalas;
    }

    public ArrayList<Horarios> obtenerReporte(String dia, int idSede, int idSala){
        ArrayList<Horarios> listahorario = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "select costo, stock, f.nombre as 'Nombre Película', \n" +
                "f.genero, f.duracion, count(c.idHorario) as 'Tickets vendidos', \n" +
                "count(c.idHorario)*costo as 'recaudación (soles)'\n" +
                "from horario h, funcion f, compra c \n" +
                "where h.idFuncion = f.idFuncion\n" +
                "\t  and c.idHorario = h.idHorario\n" +
                "\t  and h.dia = ? \n" +
                "      and idSede = ? \n" +
                "      and h.idSala = ? \n" +
                "group by h.idHorario";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,dia);
            pstmt.setString(2, String.valueOf(idSede));
            pstmt.setString(3, String.valueOf(idSala));

            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()) {
                    Horarios horario = new Horarios();
                    horario.setCosto(rs.getFloat(1));
                    horario.setStock(rs.getInt(2));
                    horario.setNombre_funcion(rs.getString(3));
                    horario.setGenero_funcion(rs.getString(4));
                    horario.setDuracion(rs.getInt(5));
                    horario.setTickets_vendidos(rs.getInt(6));
                    horario.setRecaudacion(rs.getFloat(7));
                    listahorario.add(horario);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listahorario;
    }

}
