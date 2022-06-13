package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Calificacion;
import com.example.culturalbox.Beans.Sedes;

import java.sql.*;
import java.util.ArrayList;

public class CalificacionDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";
    public ArrayList<Calificacion> obtenerCalificacion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        ArrayList<Calificacion> listaCalificacion = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT f.idFuncion, f.nombre, f.idDirector, fa.idActor,  CONCAT(a.nombre,' ',a.apellido) AS 'Actor',  CONCAT(d.nombre,' ',d.apellido) AS 'Director' FROM funcion f, funcion_has_actor fa, actor a, director d\n" +
                     "where f.idDirector = d.idDirector\n" +
                     "AND f.idFuncion = fa.idFuncion\n" +
                     "AND fa.idActor = a.idActor\n" +
                     "HAVING f.idFuncion = '1'\n" +
                     "order by idFuncion;")) {
            while (rs.next()) {
                Calificacion calificacion = new Calificacion();
                calificacion.setNombreFuncion(rs.getString(2));
                calificacion.setNombreDirector(rs.getString(6));
                calificacion.setNombreActor(rs.getString(5));
                listaCalificacion.add(calificacion);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaCalificacion;
    }
    public void crearFuncion(int puntajeFuncion,int puntajeDirector, int puntajeActor) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into funcion (nombre,genero,duracion,restriccion,descripcion,idDirector)  VALUES (?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, genero);
            pstmt.setInt(3, duracion);
            pstmt.setString(4, restriccion);
            pstmt.setString(5, descripcion);
            pstmt.setInt(6, idDirector);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
