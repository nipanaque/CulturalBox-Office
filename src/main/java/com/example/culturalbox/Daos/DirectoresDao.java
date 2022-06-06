package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Directores;

import java.sql.*;
import java.util.ArrayList;

public class DirectoresDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Directores> obtenerDirectores(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Directores> listaDirectores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT concat(A.nombre,\" \",A.apellido) AS Actor,A.fotografia, truncate(avg(B.puntaje),2)\n" +
                     "AS \"puntaje promedio\" FROM director A LEFT JOIN puntaje_director B ON A.idDirector = B.idDirector\n" +
                     "GROUP BY A.idDirector\n");){
            while (rs.next()){
                Directores director = new Directores();
                director.setNombre(rs.getString(1));
                director.setPuntaje(rs.getInt(3));
                listaDirectores.add(director);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDirectores;
    }
}
