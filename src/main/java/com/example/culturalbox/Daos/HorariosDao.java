package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.CrearFuncion;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Mantenimiento;

import java.sql.*;
import java.util.ArrayList;

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

    public ArrayList<Horarios> obtenerHorarios(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Horarios> listaHorarios = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT idHorario, s.nombre, h.idSala ,sal.SalaSede, dia, tiempo_inicio, vigencia, f.nombre\n" +
                     "                     FROM horario h, sede s, sala sal, funcion f\n" +
                     "                     where h.idSede=s.idSede and\n" +
                     "                       h.idSala=sal.idSala and\n" +
                     "                           h.idFuncion=f.idFuncion;");){
            while (rs.next()){
                Horarios horarios= new Horarios();
                horarios.setIdHorario(rs.getInt(1));
                horarios.setNombre_sede(rs.getString(2));
                horarios.setIdSala(rs.getInt(3));
                horarios.setSalaSede(rs.getInt(4));
                horarios.setDia(rs.getString(5));
                horarios.setTiempo_inicio(rs.getString(6));
                horarios.setVigencia(rs.getInt(7));
                horarios.setNombre_funcion(rs.getString(8));
                listaHorarios.add(horarios);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaHorarios;
    }

    public void horario_has_mantenimiento(int idHorario, int idMantenimiento) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "insert into horario_has_mantenimiento (idHorario, idMantenimiento) VALUES (?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idHorario);
            pstmt.setInt(2, idMantenimiento);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Mantenimiento> obtenerMantenimiento() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Mantenimiento> listaMantenimiento = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from mantenimiento;");){
            while (rs.next()){
                Mantenimiento mantenimiento= new Mantenimiento();
                mantenimiento.setIdMantenimiento(rs.getInt(1));
                mantenimiento.setNombre(rs.getString(2));
                mantenimiento.setApellido(rs.getString(3));
                listaMantenimiento.add(mantenimiento);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaMantenimiento;
    }

    public void crear_mant(int idMantenimiento, String Nombre, String Apellido) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "INSERT INTO mantenimiento (idMantenimiento, nombre, apellido) VALUES (?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idMantenimiento);
            pstmt.setString(2,Nombre);
            pstmt.setString(3, Apellido);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Horarios buscarPorId(String id) {
        Horarios horarios = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select idHorario, idSala from horario where idHorario = ? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    horarios = new Horarios();
                    horarios.setIdHorario(rs.getInt(1));
                    horarios.setIdSala(rs.getInt(2));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return horarios;
    }

    public ArrayList<Horarios> obtenerHorarios_Menu(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Horarios> listaHorarios = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT idHorario, s.nombre, f.nombre, h.stock, h.costo ,dia, tiempo_inicio, f.descripcion, f.genero, h.idSala ,sal.SalaSede, sal.aforo, f.banner\n" +
                     "FROM horario h, sede s, sala sal, funcion f \n" +
                     "where h.idSede=s.idSede and\n" +
                     "\t  h.idSala=sal.idSala and\n" +
                     "      h.idFuncion=f.idFuncion;");){
            while (rs.next()){
                Horarios horarios= new Horarios();
                horarios.setIdHorario(rs.getInt(1));
                horarios.setNombre_sede(rs.getString(2));
                horarios.setNombre_funcion(rs.getString(3));
                horarios.setStock(rs.getInt(4));
                horarios.setCosto(rs.getFloat(5));
                horarios.setDia(rs.getString(6));
                horarios.setTiempo_inicio(rs.getString(7));
                horarios.setDescripcion_funcion(rs.getString(8));
                horarios.setGenero_funcion(rs.getString(9));
                horarios.setIdSala(rs.getInt(10));
                horarios.setSalaSede(rs.getInt(11));
                horarios.setHorario_aforo(rs.getInt(12));
                listaHorarios.add(horarios);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHorarios;
    }

    public void actualizarHorario(Horarios horario) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "update horario set tiempo_inicio = ?, dia= ? ,costo = ? where idHorario  = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, horario.getTiempo_inicio());
            pstmt.setString(2, horario.getDia());
            pstmt.setFloat(3, horario.getCosto());
            pstmt.setInt(4,horario.getIdHorario());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarHorario(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE horario SET vigencia = ? WHERE (idHorario = ?);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, 0);
            pstmt.setInt(2, Integer.parseInt(id));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Horarios buscarPorIdActHorario(String id) {
        Horarios horarios = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select h.idHorario, f.nombre, f.genero ,h.idSala, sal.SalaSede,sal.aforo, s.nombre ,h.dia, h.tiempo_inicio, h.costo FROM horario h, sede s, sala sal, funcion f where h.idSede=s.idSede and h.idSala=sal.idSala and h.idFuncion=f.idFuncion and idHorario = ? ";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    horarios = new Horarios();
                    horarios.setIdHorario(rs.getInt(1));
                    horarios.setNombre_funcion(rs.getString(2));
                    horarios.setGenero_funcion(rs.getString(3));
                    horarios.setIdSala(rs.getInt(4));
                    horarios.setSalaSede(rs.getInt(5));
                    horarios.setHorario_aforo(rs.getInt(6));
                    horarios.setNombre_sede(rs.getString(7));
                    horarios.setDia(rs.getString(8));
                    horarios.setTiempo_inicio(rs.getString(9));
                    horarios.setCosto(rs.getFloat(10));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return horarios;
    }

}
