package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Actores;
import com.example.culturalbox.Beans.Clientes;

import java.sql.*;
import java.util.ArrayList;


public class ClientesDao {


    public ArrayList<Clientes> listarClientes() {

        ArrayList<Clientes> listaClientes = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("conexion exitosa!!!!!!!!!!!!!!!!!!!!!!!1");

            Connection connection = DriverManager.getConnection(url, user, pass);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT CONCAT(u.nombre,' ',u.apellido) AS 'Cliente',\n" +
                    "       f.nombre AS 'Función',\n" +
                    "       se.nombre AS 'Sede',\n" +
                    "       h.idSala AS 'Sala'\n" +
                    "FROM funcion f, horario h, sede se, usuario u, compra c\n" +
                    "WHERE se.idSede = h.idSede\n" +
                    "  AND f.idFuncion = h.idFuncion\n" +
                    "  AND u.idUsuario = c.idUsuario\n" +
                    "  AND c.idHorario = h.idHorario\n" +
                    "ORDER BY c.idCompra;");


            while (rs.next()) {
                Clientes clientes = new Clientes();
                clientes.setNombre(rs.getString(1));
                clientes.setFuncion(rs.getString(2));
                clientes.setSede(rs.getString(3));
                clientes.setSala(rs.getInt(4));
                listaClientes.add(clientes);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("conexion NO exitosa!!!!!!!!!!!!!!!!!!!!!!!1");
        }
        return listaClientes;

    }


    public ArrayList<Clientes> filtraClientesFuncion(String idFuncion) {

        ArrayList<Clientes> listaClientes = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String sql = "SELECT CONCAT(u.nombre,' ',u.apellido) AS 'Cliente',\n" +
                    "                           f.nombre AS 'Función', \n" +
                    "                           se.nombre AS 'Sede', \n" +
                    "                           h.idSala AS 'Sala' \n" +
                    "                    FROM funcion f, horario h, sede se, usuario u, compra c\n" +
                    "\t\t\t\t\tWHERE se.idSede = h.idSede\n" +
                    "                      AND f.idFuncion = h.idFuncion \n" +
                    "                      AND u.idUsuario = c.idUsuario \n" +
                    "                      AND c.idHorario = h.idHorario \n" +
                    "                      and f.idFuncion = ? \n" +
                    "                    ORDER BY c.idCompra;";

            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, idFuncion);

                try (ResultSet rs = pstmt.executeQuery();) {

                    if (rs.next()) {
                        Clientes clientes = new Clientes();
                        clientes.setNombre(rs.getString(1));
                        clientes.setFuncion(rs.getString(2));
                        clientes.setSede(rs.getString(3));
                        clientes.setSala(rs.getInt(4));
                        listaClientes.add(clientes);
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("conexion NO exitosa!!!!!!!!!!!!!!!!!!!!!!!");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listaClientes;
    }

    public ArrayList<Clientes> filtraClientesSede(String idSede) {

        ArrayList<Clientes> listaClientes = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String sql = "SELECT CONCAT(u.nombre,' ',u.apellido) AS 'Cliente',\n" +
                    "                           f.nombre AS 'Función', \n" +
                    "                           se.nombre AS 'Sede', \n" +
                    "                           h.idSala AS 'Sala' \n" +
                    "                    FROM funcion f, horario h, sede se, usuario u, compra c\n" +
                    "\t\t\t\t\tWHERE se.idSede = h.idSede\n" +
                    "                      AND f.idFuncion = h.idFuncion \n" +
                    "                      AND u.idUsuario = c.idUsuario \n" +
                    "                      AND c.idHorario = h.idHorario \n" +
                    "                      and se.idSede = ? \n" +
                    "                    ORDER BY c.idCompra;";

            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, idSede);

                try (ResultSet rs = pstmt.executeQuery();) {

                    if (rs.next()) {
                        Clientes clientes = new Clientes();
                        clientes.setNombre(rs.getString(1));
                        clientes.setFuncion(rs.getString(2));
                        clientes.setSede(rs.getString(3));
                        clientes.setSala(rs.getInt(4));
                        listaClientes.add(clientes);
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("conexion NO exitosa!!!!!!!!!!!!!!!!!!!!!!!");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listaClientes;
    }

    public ArrayList<Clientes> filtraClientesAmbos(String idFuncion, String idSede) {

        ArrayList<Clientes> listaClientes = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String sql = "SELECT CONCAT(u.nombre,' ',u.apellido) AS 'Cliente',\n" +
                    "                           f.nombre AS 'Función', \n" +
                    "                           se.nombre AS 'Sede', \n" +
                    "                           h.idSala AS 'Sala' \n" +
                    "                    FROM funcion f, horario h, sede se, usuario u, compra c\n" +
                    "\t\t\t\t\tWHERE se.idSede = h.idSede\n" +
                    "                      AND f.idFuncion = h.idFuncion \n" +
                    "                      AND u.idUsuario = c.idUsuario \n" +
                    "                      AND c.idHorario = h.idHorario \n" +
                    "                      and f.idFuncion = ? and se.idSede = ?" +
                    "                    ORDER BY c.idCompra;";

            try (Connection connection = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, idFuncion);
                pstmt.setString(2, idSede);

                try (ResultSet rs = pstmt.executeQuery();) {

                    if (rs.next()) {
                        Clientes clientes = new Clientes();
                        clientes.setNombre(rs.getString(1));
                        clientes.setFuncion(rs.getString(2));
                        clientes.setSede(rs.getString(3));
                        clientes.setSala(rs.getInt(4));
                        listaClientes.add(clientes);
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("conexion NO exitosa!!!!!!!!!!!!!!!!!!!!!!!");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listaClientes;
    }
}
