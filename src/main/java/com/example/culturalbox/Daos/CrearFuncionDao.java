package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Directores;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class CrearFuncionDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<CrearFuncion> obtenerNombres_Actores(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<CrearFuncion> listaActores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select concat(nombre,\" \", apellido) as 'Actor', idActor from actor;");){
            while (rs.next()){
                CrearFuncion crearFuncion_actor = new CrearFuncion();
                crearFuncion_actor.setNombres_Actores(rs.getString(1));
                crearFuncion_actor.setId_actores(rs.getInt(2));
                listaActores.add(crearFuncion_actor);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaActores;
    }

    public ArrayList<CrearFuncion> obtenerNombres_Directores(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<CrearFuncion> listaDirectores = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select concat(nombre,\" \", apellido) as Director, idDirector from director");){
            while (rs.next()){
                CrearFuncion crearFuncion_director= new CrearFuncion();
                crearFuncion_director.setNombres_directores(rs.getString(1));
                crearFuncion_director.setId_directores(rs.getInt(2));
                listaDirectores.add(crearFuncion_director);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDirectores;
    }

    public void crearFuncion(String nombre,String genero,int duracion,String restriccion,String descripcion, int idDirector, InputStream banner) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into funcion (nombre,genero,duracion,restriccion,banner,descripcion,idDirector)  VALUES (?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, genero);
            pstmt.setInt(3, duracion);
            pstmt.setString(4, restriccion);
            pstmt.setBlob(5,banner);
            pstmt.setString(6, descripcion);
            pstmt.setInt(7, idDirector);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void eliminarFuncion(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE FROM funcion WHERE (idFuncion = ?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, Integer.parseInt(id));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void ingresarActores(int idFuncion,int idActor) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into funcion_has_actor (idFuncion,idActor)  VALUES (?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idFuncion);
            pstmt.setInt(2, idActor);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<CrearFuncion> obtenerFunciones(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<CrearFuncion> listaFunciones = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select idFuncion, nombre, genero from funcion;");){
            while (rs.next()){
                CrearFuncion crearFuncion_nombreid= new CrearFuncion();
                crearFuncion_nombreid.setIdFuncion(rs.getInt(1));
                crearFuncion_nombreid.setNombre(rs.getString(2));
                crearFuncion_nombreid.setGenero(rs.getString(3));
                listaFunciones.add(crearFuncion_nombreid);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaFunciones;
    }

    public CrearFuncion buscarPorId(String id) {
        CrearFuncion crearFuncion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select idFuncion, nombre from funcion where idFuncion = ? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    crearFuncion = new CrearFuncion();
                    crearFuncion.setIdFuncion(rs.getInt(1));
                    crearFuncion.setNombre(rs.getString(2));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return crearFuncion;
    }

    public void funcion_has_actor(int idFuncion, int idActor) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into funcion_has_actor (idFuncion,idActor) VALUES (?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idFuncion);
            pstmt.setInt(2, idActor);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
