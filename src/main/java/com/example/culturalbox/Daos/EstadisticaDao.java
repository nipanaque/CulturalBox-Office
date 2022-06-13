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
        ArrayList<Estadistica> listaEstadisticas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        listaEstadisticas.add(funMejorCalif(fecha));
        listaEstadisticas.add(funMasVista(fecha));
        listaEstadisticas.add(funMenosVista(fecha));
        listaEstadisticas.add(generoMasPopular(fecha));
        listaEstadisticas.add(actorMejorCalif(fecha));
        listaEstadisticas.add(directorMejorCalif(fecha));

        return listaEstadisticas;
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
                estadistica.setNombre(rs.getString(1));
                estadistica.setPuntaje(rs.getDouble(2));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public Estadistica funMasVista(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select f.nombre, stock, idCompra, h.idHorario, round((count(h.idhorario)/stock)*100,8) as `asistencia %` \n" +
                "from usuario u\n" +
                "\tinner join compra c on (u.idUsuario = c.idUsuario)\n" +
                "    inner join horario h on (c.idHorario = h.idHorario)\n" +
                "    inner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "where dia like ?\n" +
                "group by h.idHorario\n" +
                "order by `asistencia %` desc\n" +
                "limit 1";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNombre(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public Estadistica funMenosVista(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select f.nombre, stock, idCompra, h.idHorario, round((count(h.idhorario)/stock)*100,2) as `asistencia %` \n" +
                "from usuario u\n" +
                "\tinner join compra c on (u.idUsuario = c.idUsuario)\n" +
                "    inner join horario h on (c.idHorario = h.idHorario)\n" +
                "    inner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "where dia like ?\n" +
                "group by h.idHorario\n" +
                "order by `asistencia %` asc\n" +
                "limit 1";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNombre(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public Estadistica generoMasPopular(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select genero, idCompra, h.idHorario, count(genero) as `conteo`\n" +
                "from usuario u\n" +
                "\tinner join compra c on (u.idUsuario = c.idUsuario)\n" +
                "    inner join horario h on (c.idHorario = h.idHorario)\n" +
                "    inner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "where dia like ?\n" +
                "group by genero\n" +
                "order by `conteo` desc\n" +
                "limit 1";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNombre(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public Estadistica actorMejorCalif(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select concat(a.nombre,' ',a.apellido) as `actor`, round(sum(puntaje)/count(puntaje),8) as `punt_prom`\n" +
                "from horario h\n" +
                "\tinner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "    inner join funcion_has_actor fh on (f.idFuncion = fh.idFuncion)\n" +
                "    inner join actor a on (fh.idActor = a.idActor)\n" +
                "    inner join puntaje_actor pa on (a.idActor = pa.idActor)\n" +
                "where dia like ?\n" +
                "group by a.nombre\n" +
                "order by `punt_prom` desc\n" +
                "limit 1";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNombre(rs.getString(1));
                estadistica.setPuntaje(rs.getDouble(2));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public Estadistica directorMejorCalif(String fecha) {  //Formato fecha ejm: 2022-06
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select concat(d.nombre,' ',d.apellido) as `direc`, round(sum(puntaje)/count(puntaje),1) as `punt_prom`\n" +
                "from horario h\n" +
                "\tinner join funcion f on (h.idFuncion = f.idFuncion)  \n" +
                "    inner join director d on (f.idDirector = d.idDirector)\n" +
                "    inner join puntaje_director pd on (d.idDirector = pd.idDirector)\n" +
                "where dia like ?\n" +
                "group by d.nombre\n" +
                "order by `punt_prom` desc\n" +
                "limit 1;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha + "-%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();  //Para saltarme el null
                estadistica.setNombre(rs.getString(1));
                estadistica.setPuntaje(rs.getDouble(2));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }
}
