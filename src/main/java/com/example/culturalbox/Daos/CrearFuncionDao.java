package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Directores;

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
             ResultSet rs = stmt.executeQuery("select concat(nombre,\" \", apellido) as Actor from actor;");){
            while (rs.next()){
                CrearFuncion crearFuncion_actor = new CrearFuncion();
                crearFuncion_actor.setNombres_Actores(rs.getString(1));
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
             ResultSet rs = stmt.executeQuery("select concat(nombre,\" \", apellido) as Director from director;");){
            while (rs.next()){
                CrearFuncion crearFuncion_director= new CrearFuncion();
                crearFuncion_director.setNombres_directores(rs.getString(1));
                listaDirectores.add(crearFuncion_director);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaDirectores;
    }
}
