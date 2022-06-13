package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Menu;

import java.sql.*;
import java.util.ArrayList;

public class MenuDao {

    public ArrayList<Menu> listarMenu(){

        ArrayList<Menu> listaMenu = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url,user,pass);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from jobs" );

            while (rs.next()){
                Menu menu = new Menu();
                menu.setNombre_funcion(rs.getString(1));
                menu.setGenero(rs.getString(2));
                menu.setDuracion(rs.getString(3));
                menu.setRestriccion(rs.getString(4));
                menu.setDescripcion(rs.getString(5));
                listaMenu.add(menu);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaMenu;
    }

    public ArrayList<Horarios> listarHorarios(String nombre_funcion) {

        ArrayList<Horarios> listaHorarios = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select h.tiempo_inicio, f.duracion, h.stock, h.costo  from funcion f\n" +
                "left join horario h on f.idFuncion=h.idFuncion\n" +
                "where f.nombre = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre_funcion);

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Horarios horarios = new Horarios();
                    horarios.setTiempo_inicio(rs.getString(1));
                    horarios.setDuracion(Integer.parseInt(rs.getString(2)));
                    horarios.setStock(rs.getInt(3));
                    horarios.setCosto(rs.getFloat(4));
                    listaHorarios.add(horarios);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHorarios;
    }

    public void crearCompra1(int idCompra, int idHorario, int idUsuario) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO compra (idCompra,Qr,idHorario,idUsuario,num_tickets) VALUES (?,NULL,?,?,0)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idCompra);
            pstmt.setInt(2, idHorario);
            pstmt.setInt(3, idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
