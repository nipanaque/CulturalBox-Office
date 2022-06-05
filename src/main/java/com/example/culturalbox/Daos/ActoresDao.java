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
             ResultSet rs = stmt.executeQuery("SELECT concat(A.nombre,\" \",A.apellido) AS Actor,A.fotografia, truncate(avg(B.puntaje),2)\n" +
                                                "AS \"puntaje promedio\" FROM actor A LEFT JOIN puntaje_actor B ON A.idActor = B.idActor\n" +
                                                "GROUP BY A.idActor\n");){
             while (rs.next()){
                 Actores actor = new Actores();
                 actor.setNombre(rs.getString(1));
                 actor.setPuntaje(rs.getInt(3));
                 listaActores.add(actor);
             }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaActores;
    }
}
