package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.Directores;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class DirectoresDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Directores> obtenerDirectores(){
        String sql="SELECT A.idDirector, B.nombre FROM director A LEFT JOIN funcion B ON A.idDirector = B.idDirector where A.idDirector =?";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Directores> listaDirectores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT A.idDirector, concat(A.nombre,\" \",A.apellido) AS Actor,A.fotografia, truncate(avg(B.puntaje),2)\n" +
                     "AS \"puntaje promedio\" FROM director A LEFT JOIN puntaje_director B ON A.idDirector = B.idDirector\n" +
                     "GROUP BY A.idDirector\n");){
            while (rs.next()){
                Directores director = new Directores();
                String id = rs.getString(1);
                director.setId(rs.getString(1));
                director.setNombre(rs.getString(2));
                director.setPuntaje(rs.getInt(4));

                try (Connection conn2 = DriverManager.getConnection(url, user, pass);
                     PreparedStatement pstmt = conn2.prepareStatement(sql);){

                    pstmt.setString(1,id);
                    try (ResultSet rs2 = pstmt.executeQuery();) {
                        while(rs2.next()){
                            String obra = rs2.getString(2);
                            director.getObras().add(obra);
                        }
                    }
                }

                listaDirectores.add(director);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDirectores;
    }

    public ArrayList<Directores> obtenerNombreDirectores(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Directores> listaDirectores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM director;");){
            while (rs.next()){
                Directores director = new Directores();
                director.setId(rs.getString(1));
                director.setNombre(rs.getString(2));
                director.setApellido(rs.getString(3));
                listaDirectores.add(director);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDirectores;
    }

    public void crearDirector(String nombre, String apellido, InputStream foto){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO director (nombre,apellido,fotografia) VALUES (?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setBlob(3,foto);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrarDirector(String directorId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE FROM director WHERE idDirector = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, directorId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
