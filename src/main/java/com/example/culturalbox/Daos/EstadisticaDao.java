package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Estadistica;

import java.sql.*;
import java.util.ArrayList;

public class EstadisticaDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public ArrayList<Estadistica> buscarPorFecha(String fecha){
        //Aqui usare las otras funciones para enviar un objeto a esta lista
        ArrayList<Estadistica> listaTrabajos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        listaTrabajos.add(funMejorCalif(fecha));

        return listaTrabajos;
    }

    public Estadistica funMejorCalif(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select nombre, round(sum(puntaje)/count(puntaje),8) as `punt_prom`\n" +
                "from horario h\n" +
                "\tinner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "    inner join puntaje_funcion pf on (f.idFuncion = pf.idFuncion)\n" +
                "where dia like ? \n" +
                "group by nombre\n" +
                "order by `punt_prom` desc\n" +
                "limit 1";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNomFunMejorCalif(rs.getString(1));
                estadistica.setPuntFunPromMejorCalif(rs.getDouble(2));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }
}
