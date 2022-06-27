package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Usuario;

import java.sql.*;

public class LoginDao {
    public Usuario validar(String correo,String password){
        Usuario usuario = null;
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "Select * from usuario where correo_pucp =? and contrasenha=sha2(?,256)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1,correo);
            pstmt.setString(2,password);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    usuario = new Usuario();
                    usuario.setId(rs.getString(1));
                    usuario.setCorreo(rs.getString(6));
                    usuario.setRol(rs.getInt(11));
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
      return usuario;
    }
}
