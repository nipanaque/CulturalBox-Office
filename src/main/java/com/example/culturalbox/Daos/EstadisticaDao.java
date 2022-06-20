package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Estadistica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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

        String sql = "select nombre, round(sum(puntaje)/count(puntaje),8) as `punt_prom`, f.idFuncion\n" +
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
                estadistica.setId(rs.getInt(3));
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

        String sql = "select f.nombre, stock, idCompra, h.idHorario, round((count(h.idhorario)/stock)*100,8) as `asistencia %`, f.idFuncion \n" +
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
                estadistica.setId(rs.getInt(6));
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

        String sql = "select f.nombre, stock, idCompra, h.idHorario, round((count(h.idhorario)/stock)*100,2) as `asistencia %`, f.idFuncion \n" +
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
                estadistica.setId(rs.getInt(6));
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

        String sql = "select concat(a.nombre,' ',a.apellido) as `actor`, round(sum(puntaje)/count(puntaje),8) as `punt_prom`, a.idActor\n" +
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
                estadistica.setId(rs.getInt(3));
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

        String sql = "select concat(d.nombre,' ',d.apellido) as `direc`, round(sum(puntaje)/count(puntaje),1) as `punt_prom`, d.idDirector\n" +
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
                estadistica.setId(rs.getInt(3));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }




    public ArrayList<Estadistica> listarFunciones(){
        ArrayList<Estadistica> listaFunciones = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(url,user,pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre from funcion");){

            while (rs.next()){
                Estadistica estad = new Estadistica();
                estad.setNombre(rs.getString(1));
                listaFunciones.add(estad);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaFunciones;
    }

    public Estadistica estadEspeciOne(String genero, String nomFuncion, String fecha, String hora) {
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select f.nombre, dia, tiempo_inicio, genero, round(sum(puntaje)/count(puntaje),1) as `punt_prom`,\n" +
                "\tround((count(h.idhorario)/stock)*100,2) as `asistencia %`, count(u.idUsuario)*costo as `monto recaudado S/`,\n" +
                "    stock*costo as `max monto S/`, concat(d.nombre,' ',d.apellido) as `director`, d.idDirector, f.idFuncion\n" +
                "from usuario u\n" +
                "\tinner join compra c on (u.idUsuario = c.idUsuario)\n" +
                "    inner join horario h on (c.idHorario = h.idHorario)\n" +
                "    inner join funcion f on (h.idFuncion = f.idFuncion)\n" +
                "    inner join puntaje_funcion pf on (f.idFuncion = pf.idFuncion)\n" +
                "    inner join director d on (f.idDirector = d.idDirector)\n" +
                "where dia = ? and lower(genero) = ? and lower(f.nombre) like ?\n" +
                "\tand tiempo_inicio = ?;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,fecha);
            pstmt.setString(2,genero);
            pstmt.setString(3,"%" + nomFuncion + "%");
            pstmt.setString(4,hora + ":00");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();
                estadistica.setNombre(rs.getString(1));
                estadistica.setFecha(rs.getString(2));
                estadistica.setHora(rs.getString(3));
                estadistica.setGenero(rs.getString(4));
                estadistica.setPuntaje(rs.getDouble(5));
                estadistica.setAsistencia(rs.getDouble(6));
                estadistica.setRecaudado(rs.getDouble(7));
                estadistica.setMaxMonto(rs.getDouble(8));
                estadistica.setDirector(rs.getString(9));
                estadistica.setId(rs.getInt(10));
                estadistica.setIdfotoEstadFuncion(rs.getInt(11));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public ArrayList<Estadistica> estadEspeciTwo(String genero, String nomFuncion, String fecha, String hora) {
        ArrayList<Estadistica> listaEspeci = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        listaEspeci.add(estadEspeciOne(genero,nomFuncion,fecha,hora));

        String sql = "select concat(a.nombre,' ',a.apellido) as `actores`\n" +
                "from funcion f\n" +
                "    inner join funcion_has_actor fh on (f.idFuncion = fh.idFuncion)\n" +
                "    inner join actor a on (fh.idActor = a.idActor)\n" +
                " where lower(f.nombre) like ?";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + nomFuncion + "%");
            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()){
                    Estadistica estadistica = new Estadistica();
                    estadistica.setNombre(rs.getString(1));
                    listaEspeci.add(estadistica);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaEspeci;
    }




    public Estadistica buscarActorOne(String nombre, String apellido) {
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select concat(nombre,' ',apellido) as `actor`, round(sum(puntaje)/count(puntaje),1) as `punt_prom`,fotografia, a.idActor\n" +
                "from actor a\n" +
                "    inner join puntaje_actor pa on (a.idActor = pa.idActor)\n" +
                "where lower(nombre) like ? and lower(apellido) like ?\n" +
                "group by nombre;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + nombre + "%");
            pstmt.setString(2,"%" + apellido + "%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();
                estadistica.setNombre(rs.getString(1));
                estadistica.setPuntaje(rs.getDouble(2));
                estadistica.setId(rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public ArrayList<Estadistica> buscarActorTwo(String nombre, String apellido) {
        ArrayList<Estadistica> listaActoresTwo = new ArrayList<>();
        listaActoresTwo.add(buscarActorOne(nombre,apellido));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select f.nombre from funcion f\n" +
                "    inner join funcion_has_actor fh on (f.idFuncion = fh.idFuncion)\n" +
                "    inner join actor a on (fh.idActor = a.idActor)\n" +
                "where lower(a.nombre) like ? and lower(a.apellido) like ?";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + nombre + "%");
            pstmt.setString(2,"%" + apellido + "%");
            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()){
                    Estadistica estadistica = new Estadistica();
                    estadistica.setNombre(rs.getString(1));
                    listaActoresTwo.add(estadistica);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaActoresTwo;
    }

    public Estadistica buscarDirectorOne(String nombre, String apellido) {
        Estadistica estadistica = new Estadistica();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select concat(nombre,' ',apellido) as 'Nombre', round(sum(p.puntaje)/count(p.puntaje),1) as 'puntaje', fotografia, d.idDirector\n" +
                "from director d, puntaje_director p\n" +
                "where d.idDirector = p.idDirector and lower(nombre) like ? and lower(apellido) like ?;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + nombre + "%");
            pstmt.setString(2,"%" + apellido + "%");
            try(ResultSet rs = pstmt.executeQuery();){
                rs.next();
                estadistica.setNombre(rs.getString(1));
                estadistica.setPuntaje(rs.getDouble(2));
                estadistica.setId(rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return estadistica;
    }

    public ArrayList<Estadistica> buscarDirectorTwo(String nombre, String apellido) {
        ArrayList<Estadistica> listaDirectoresTwo = new ArrayList<>();
        listaDirectoresTwo.add(buscarDirectorOne(nombre,apellido));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select f.nombre as 'Funciones dirigidas' from director d, funcion f\n" +
                "where d.idDirector = f.idDirector and lower(d.nombre) like ? and lower(d.apellido) like ?;";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1,"%" + nombre + "%");
            pstmt.setString(2,"%" + apellido + "%");
            try(ResultSet rs = pstmt.executeQuery();){
                while (rs.next()){
                    Estadistica estadistica = new Estadistica();
                    estadistica.setNombre(rs.getString(1));
                    listaDirectoresTwo.add(estadistica);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaDirectoresTwo;
    }

}