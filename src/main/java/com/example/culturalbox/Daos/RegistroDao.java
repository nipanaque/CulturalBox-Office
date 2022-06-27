package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Mantenimiento;
import com.example.culturalbox.Beans.Registro;
import com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;

public class RegistroDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public void crearUsuario(String codigo, String nombre, String apellido, String dni, String correo_pucp,
                             String telefono, String nacimiento, String contrasenha, String direccion) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into usuario(codigo,nombre,apellido,dni,correo_pucp,telefono,nacimiento,contrasenha,idRoles, direccion)\n" +
                "values(?,?,?,?,?,?,?,sha2(?,256),?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.setString(2, nombre);
            pstmt.setString(3, apellido);
            pstmt.setString(4, dni);
            pstmt.setString(5, correo_pucp);
            pstmt.setString(6, telefono);
            pstmt.setString(7, nacimiento);
            pstmt.setString(8, contrasenha);
            pstmt.setInt(9, 1);
            pstmt.setString(10, direccion);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Registro> obtenerUsuarios(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Registro> listaRegistro = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from usuario;");){
            while (rs.next()){
                Registro registro= new Registro();
                registro.setCodigo(rs.getString(2));
                registro.setDni(rs.getString(4));
                registro.setCorreo_pucp(rs.getString(6));
                registro.setTelefono(rs.getString(7));
                listaRegistro.add(registro);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaRegistro;
    }

    public ArrayList<Registro> obtenerRegistro(String codigo, String nombre, String apellido, String dni, String telefono, String nacimiento, String direccion) {

        ArrayList<Registro> listaRegistro = new ArrayList<>();

        Registro registro = new Registro();
        registro.setCodigo(codigo);
        registro.setNombre(nombre);
        registro.setApellido(apellido);
        registro.setDni(dni);
        registro.setTelefono(telefono);
        registro.setNacimiento(nacimiento);
        registro.setDireccion(direccion);
        listaRegistro.add(registro);

        return listaRegistro;
    }
    public ArrayList<Registro> obtenerRegistro2(String codigo, String nombre, String apellido, String dni, String telefono, String nacimiento, String direccion, String correo_pucp) {

        ArrayList<Registro> listaRegistro = new ArrayList<>();

        Registro registro = new Registro();
        registro.setCodigo(codigo);
        registro.setNombre(nombre);
        registro.setApellido(apellido);
        registro.setDni(dni);
        registro.setTelefono(telefono);
        registro.setNacimiento(nacimiento);
        registro.setDireccion(direccion);
        registro.setCorreo_pucp(correo_pucp);
        listaRegistro.add(registro);

        return listaRegistro;
    }

    public ArrayList<Registro> obtenerRegistro3(String codigo, String nombre, String apellido, String dni, String telefono, String nacimiento, String direccion, String correo_pucp, String contrasenha) {

        ArrayList<Registro> listaRegistro = new ArrayList<>();

        Registro registro = new Registro();
        registro.setCodigo(codigo);
        registro.setNombre(nombre);
        registro.setApellido(apellido);
        registro.setDni(dni);
        registro.setTelefono(telefono);
        registro.setNacimiento(nacimiento);
        registro.setDireccion(direccion);
        registro.setCorreo_pucp(correo_pucp);
        registro.setContrasenha(contrasenha);
        listaRegistro.add(registro);

        return listaRegistro;
    }
}
