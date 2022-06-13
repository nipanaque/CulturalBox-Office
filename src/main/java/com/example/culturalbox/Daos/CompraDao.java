package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Compra;
import com.example.culturalbox.Beans.Menu;

import java.sql.*;
import java.util.ArrayList;

public class CompraDao {

    public ArrayList<Compra> listarCompra(){

        ArrayList<Compra> listaCompra = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url,user,pass);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from jobs" );

            while (rs.next()){
                Compra compra = new Compra();
                compra.setNombre_funcion(rs.getString(1));
                compra.setCosto(rs.getInt(2));
                listaCompra.add(compra);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaCompra;
    }
}
