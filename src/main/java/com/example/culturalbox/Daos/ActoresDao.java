package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;

import java.sql.*;
import java.util.ArrayList;

public class ActoresDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Actores> obtenerActores(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Actores> listaActores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT A.idActor, concat(A.nombre,\" \",A.apellido) AS Actor,A.fotografia, truncate(avg(B.puntaje),2)\n" +
                                                "AS \"puntaje promedio\" FROM actor A LEFT JOIN puntaje_actor B ON A.idActor = B.idActor\n" +
                                                "GROUP BY A.idActor\n");){
             while (rs.next()){
                 Actores actor = new Actores();
                 actor.setId(rs.getString(1));
                 actor.setNombre(rs.getString(2));
                 actor.setPuntaje(rs.getInt(4));
                 listaActores.add(actor);
             }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaActores;
    }

    public void crearActor(String nombre, String apellido){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO actor (nombre,apellido,fotografia) VALUES (?,?,NULL)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrarActor(String actorId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE FROM actor WHERE idActor = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, actorId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
