package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;

import java.sql.*;
import java.util.ArrayList;

public class ActoresDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Actores> obtenerActores(){

        String sql="SELECT A.idActor, F.nombre FROM actor A LEFT JOIN funcion_has_actor B ON A.idActor = B.idActor LEFT JOIN funcion F ON B.idFuncion = F.idFuncion where A.idActor = ?";

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
                 String id = rs.getString(1);
                 actor.setId(rs.getString(1));
                 actor.setNombre(rs.getString(2));
                 actor.setPuntaje(rs.getInt(4));

                 try (Connection conn2 = DriverManager.getConnection(url, user, pass);
                      PreparedStatement pstmt = conn2.prepareStatement(sql);){

                     pstmt.setString(1,id);
                     try (ResultSet rs2 = pstmt.executeQuery();) {
                         while(rs2.next()){
                             String obra = rs2.getString(2);
                             actor.getObras().add(obra);
                         }
                     }
                 }
                 listaActores.add(actor);
             }

        //**Segundo



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
