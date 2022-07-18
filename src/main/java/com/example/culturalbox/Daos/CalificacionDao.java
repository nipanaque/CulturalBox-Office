package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Calificacion;
import com.example.culturalbox.Beans.Sedes;

import java.sql.*;
import java.util.ArrayList;

public class CalificacionDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Calificacion> obtenerCalificacion(String idf) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Calificacion> listaCalificacion = new ArrayList<>();
        String sql = "SELECT f.idFuncion, f.nombre, f.idDirector, fa.idActor,  CONCAT(a.nombre,' ',a.apellido) AS 'Actor',  CONCAT(d.nombre,' ',d.apellido) AS 'Director' FROM funcion f, funcion_has_actor fa, actor a, director d\n" +
                "where f.idDirector = d.idDirector\n" +
                "AND f.idFuncion = fa.idFuncion\n" +
                "AND fa.idActor = a.idActor\n" +
                "HAVING f.idFuncion = ?\n" +
                "order by idActor;";
        try (Connection connection = DriverManager.getConnection(url,user,pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1,Integer.parseInt(idf));
            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String funcion = rs.getString(2);
                    int idDirector = rs.getInt(3);
                    int idActor = rs.getInt(4);
                    String actor = rs.getString(5);
                    String director = rs.getString(6);

                    listaCalificacion.add(new Calificacion(funcion,director,actor,id,idDirector,idActor));
                }
            }


        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaCalificacion;
    }
    public void  obtenerPuntuacionFuncion(String estrellaf, String f ){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "INSERT INTO `cultura_box_pucp`.`puntaje_funcion` (`puntaje`, `idFuncion`) VALUES (?, ?);";
        try (Connection connection = DriverManager.getConnection(url,user,pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            if(Integer.parseInt(estrellaf)==-1){
                pstmt.setNull(1,Types.DECIMAL);
            }else{
                pstmt.setInt(1,Integer.parseInt(estrellaf));
            }
            pstmt.setInt(2,Integer.parseInt(f));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
    }
    public void  obtenerPuntuacionDirector(String estrellaf, String d){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "INSERT INTO `cultura_box_pucp`.`puntaje_director` (`puntaje`, `idDirector`) VALUES (?, ?);";
        try (Connection connection = DriverManager.getConnection(url,user,pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            if(Integer.parseInt(estrellaf)==-1){
                pstmt.setNull(1,Types.DECIMAL);
            }else{
                pstmt.setInt(1,Integer.parseInt(estrellaf));
            }
            pstmt.setInt(2,Integer.parseInt(d));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
    }
    public void  obtenerPuntuacionActor(String estrellaf, String a){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "INSERT INTO `cultura_box_pucp`.`puntaje_actor` (`puntaje`, `idActor`) VALUES (?, ?);";
        try (Connection connection = DriverManager.getConnection(url,user,pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            if(Integer.parseInt(estrellaf)==-1){
                pstmt.setNull(1,Types.DECIMAL);
            }else{
                pstmt.setInt(1,Integer.parseInt(estrellaf));
            }
            pstmt.setInt(2,Integer.parseInt(a));

            pstmt.executeUpdate(); //Es update porque es para insert, update y delete

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
    }
    public void cambiarCalificado(int idcompra, int idUsuario){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "UPDATE compra set calificado=1 where idCompra=? and idUsuario=?";
        try (Connection connection = DriverManager.getConnection(url,user,pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setInt(1,idcompra);

                pstmt.setInt(2,idUsuario);

            pstmt.executeUpdate(); //Es update porque es para insert, update y delete

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }

    }

}