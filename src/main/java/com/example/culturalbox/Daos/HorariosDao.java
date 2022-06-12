package com.example.culturalbox.Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HorariosDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public void crearHorario(int vigencia,float costo,String dia,String tiempo_inicio,int stock,int idSala, int idSede, int idFuncion) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into horario (vigencia,costo,dia,tiempo_inicio,stock,idSala,idSede,idFuncion)  VALUES (?,?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, vigencia);
            pstmt.setFloat(2, costo);
            pstmt.setString(3, dia);
            pstmt.setString(4, tiempo_inicio);
            pstmt.setInt(5, stock);
            pstmt.setInt(6, idSala);
            pstmt.setInt(7, idSede);
            pstmt.setInt(8, idFuncion);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
