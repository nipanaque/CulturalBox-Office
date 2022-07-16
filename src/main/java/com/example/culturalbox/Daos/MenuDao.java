package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.Compra;
import com.example.culturalbox.Beans.Horarios;
import com.example.culturalbox.Beans.Menu;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MenuDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp?serverTimezone=America/Lima";

    public MenuDao() { /* compiled code */ }

    public java.util.ArrayList<com.example.culturalbox.Beans.Menu> obtenerListaMenu() {
        ArrayList<Menu> listaMenu = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select distinct(f.nombre),f.descripcion,f.genero,f.restriccion, concat(d.nombre, ' ',d.apellido) as `Director`, f.idFuncion from funcion f\n" +
                     "inner join director d on f.idDirector = d.idDirector\n" +
                     "inner join horario h on f.idFuncion = h.idFuncion\n" +
                     "where h.vigencia = 1\n" +
                     "limit 0,6;");) {

            while (rs.next()) {
                Menu menu = new Menu();
                menu.setNombre_funcion((rs.getString(1)));
                menu.setDescripcion(rs.getString(2));
                menu.setGenero(rs.getString(3));
                menu.setRestriccion(rs.getString(4));
                menu.setDirector(rs.getString(5));
                menu.setIdFuncion(rs.getInt(6));
                listaMenu.add(menu);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaMenu;}

    public java.util.ArrayList<com.example.culturalbox.Beans.Horarios> listarHorarios(java.lang.String nombre_funcion) {

        ArrayList<Horarios> listaHorarios= new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select h.tiempo_inicio, f.duracion, h.stock, h.costo, h.idHorario, s.nombre from funcion f\n" +
                "left join horario h on f.idFuncion=h.idFuncion\n" +
                "inner join sede s on h.idSede = s.idSede\n" +
                "where f.nombre = ? AND h.vigencia=1";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre_funcion);

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Horarios horarios = new Horarios();
                    horarios.setT_init(rs.getTime(1));
                    horarios.setDuracion(rs.getInt(2));
                    horarios.setStock(rs.getInt(3));
                    horarios.setCosto(rs.getInt(4));
                    horarios.setIdHorario(rs.getInt(5));
                    horarios.setNombre_sede(rs.getString(6));
                    listaHorarios.add(horarios);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaHorarios;

    }

    public void crearCompra1(int idHorario, int idUsuario) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into compra (Qr, idHorario, idUsuario, numtickets, estado) VALUES (NULL, ?, ?, 0, 0)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idHorario);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public java.util.ArrayList<com.example.culturalbox.Beans.Compra> buscarComprasNopagadas(int idUsuario) {
        ArrayList<Compra> comprasNopagadas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select f.nombre,h.tiempo_inicio, h.costo, c.idCompra, c.numtickets, h.idHorario from  compra c\n" +
                "left join horario h on h.idHorario = c.idHorario\n" +
                "left join funcion f on f.idFuncion = h.idFuncion\n" +
                "where c.idUsuario = ? and c.estado = 0";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, String.valueOf(idUsuario));

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Compra compra = new Compra();
                    compra.setNombre_funcion(rs.getString(1));
                    compra.setT_init(rs.getTime(2));
                    compra.setCosto(rs.getInt(3));
                    compra.setIdCompra(rs.getString(4));
                    compra.setNu_tickets(rs.getInt(5));
                    compra.setIdHorario(rs.getInt(6));
                    comprasNopagadas.add(compra);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return comprasNopagadas;
    }

    public void borrarCompraNopagada(java.lang.String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "delete from compra where idCompra = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void setNuerotickets(java.lang.String id, int num) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compra SET compra.numtickets = ? where compra.idCompra = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1,num);
            pstmt.setString(2, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public String obtenerCorreo(int idUsuario) {
        String correo = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select u.correo_pucp from usuario u where idUsuario = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    correo = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return correo;
    }

    public void enviarFactura(String correoCliente, String filename) {
        //Turn off Two Factor Authentication
        //Turn off less secure app
        final String sender = "victor.calderon@pucp.edu.pe"; // The sender email
        final String urpass = "Frodo2009"; //keep it secure
        Properties set = new Properties();
        //Set values to the property
        set.put("mail.smtp.starttls.enable", "true");
        set.put("mail.smtp.auth", "true");
        set.put("mail.smtp.host", "smtp.gmail.com");
        set.put("mail.smtp.port", "587");
        set.put("mail.smtp.ssl.trust","*");
        Session session = Session.getInstance(set,new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, urpass);
            }});

        try {
            //email extends Java's Message Class, check out javax.mail.Message class to read more
            Message email = new MimeMessage(session);
            email.setFrom(new InternetAddress("victor.calderon@pucp.edu.pe")); //sender email address here
            email.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(correoCliente)); //Receiver email address here
            email.setSubject("Entradas Cultural Box-Office PUCP"); //Email Subject and message

            // creating first MimeBodyPart object
            BodyPart messageBodyPart1 = new MimeBodyPart();
            messageBodyPart1.setText("¡Felicitaciones! La compra de sus entradas en la web de Cultural Office PUCP ha sido exitosa. Utilice el código QR adjunto a este" +
                    "email para ingresar a la sala el día de su función. Además, puede ver sus entradas en historial a través de nuestra web. Muchas gracias y disfrute su función. ");

            //Archivo Adjunto
            // creating second MimeBodyPart object
            BodyPart messageBodyPart2 = new MimeBodyPart();
            DataSource source = new FileDataSource(filename);
            messageBodyPart2.setDataHandler(new DataHandler(source));
            messageBodyPart2.setFileName(filename);

            // creating MultiPart object
            Multipart multipartObject = new MimeMultipart();
            multipartObject.addBodyPart(messageBodyPart1);
            multipartObject.addBodyPart(messageBodyPart2);

            // set body of the email.
            email.setContent(multipartObject);

            Transport.send(email);
            System.out.println("Your email has successfully been sent!");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarEstadocompra (String idCompra) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compra SET compra.estado = 1 where compra.idCompra = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, idCompra);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void updateStockhorario (int idHorario, int numtickets) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "update horario set stock = stock-? where idHorario =?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, numtickets);
            pstmt.setInt(2, idHorario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
