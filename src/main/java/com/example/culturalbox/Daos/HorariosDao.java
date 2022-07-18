package com.example.culturalbox.Daos;

import com.example.culturalbox.Beans.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class HorariosDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/cultura_box_pucp";

    public void crearHorario(int vigencia,float costo,String dia,String tiempo_inicio,int stock,int idSala, int idSede, int idFuncion, int entradDispon) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into horario (vigencia,costo,dia,tiempo_inicio,stock,idSala,idSede,idFuncion, entradasDispn)  VALUES (?,?,?,?,?,?,?,?,?)";

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
            pstmt.setInt(9, entradDispon);
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
             ResultSet rs = stmt.executeQuery("SELECT idHorario, s.nombre, h.idSala ,sal.SalaSede, dia, tiempo_inicio, vigencia, f.nombre,f.idFuncion, s.idSede\n" +
                     "FROM horario h, sede s, sala sal, funcion f\n" +
                     "where h.idSede=s.idSede and\n" +
                     "h.idSala=sal.idSala and\n" +
                     "h.idFuncion=f.idFuncion\n" +
                     "order by dia asc, tiempo_inicio asc, s.nombre asc;");){
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
                horarios.setIdFuncion(rs.getInt(9));
                horarios.setIdSede(rs.getInt(10));
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

    public ArrayList<Mantenimiento> obtenerMantenimientoHasHorario() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Mantenimiento> listaMantenimiento = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from horario_has_mantenimiento;;");){
            while (rs.next()){
                Mantenimiento mantenimiento= new Mantenimiento();
                mantenimiento.setIdhorario(rs.getInt(1));
                mantenimiento.setIdMantenimiento(rs.getInt(2));
                listaMantenimiento.add(mantenimiento);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaMantenimiento;
    }

    public ArrayList<Mantenimiento> obtenerMatenimientoporHorario(String id) {
        ArrayList<Mantenimiento> listaMantenimiento = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "select m.nombre, m.apellido\n" +
                "from horario_has_mantenimiento hm, mantenimiento m \n" +
                "where hm.idMantenimiento=m.idMantenimiento and hm.idHorario = ?;";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Mantenimiento mantenimiento= new Mantenimiento();
                    mantenimiento.setNombre(rs.getString(1));
                    mantenimiento.setApellido(rs.getString(2));
                    listaMantenimiento.add(mantenimiento);
                }
            }
        } catch (SQLException e) {
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

        String sql = "select h.idHorario, f.nombre, f.genero ,h.idSala, sal.SalaSede,sal.aforo, s.nombre, s.idSede ,h.dia, h.tiempo_inicio, h.costo \n" +
                "FROM horario h, sede s, sala sal, funcion f \n" +
                "where h.idSede=s.idSede and h.idSala=sal.idSala and h.idFuncion=f.idFuncion and idHorario = ? ";
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
                    horarios.setIdSede(rs.getInt(8));
                    horarios.setDia(rs.getString(9));
                    horarios.setTiempo_inicio(rs.getString(10));
                    horarios.setCosto(rs.getFloat(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return horarios;
    }

    public ArrayList<Usuario> buscarUsuariosCorreo(String idHorario){
        ArrayList<Usuario> listaUsuario = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "select distinct(c.idUsuario), u.correo_pucp\n" +
                "from compra c, usuario u \n" +
                "where c.idUsuario=u.idUsuario and \n" +
                "      idHorario=?;";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, idHorario);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Usuario usuario= new Usuario();
                    usuario.setId(rs.getInt(1));
                    usuario.setCorreo(rs.getString(2));
                    listaUsuario.add(usuario);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaUsuario;
    }

    public void enviarCorreo(ArrayList<Usuario> listaUsuario, String nombre_pelicula, String tiempo_inicio, String dia, String filename){
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
            for(Usuario listausuario: listaUsuario){
                Message email = new MimeMessage(session);
                email.setFrom(new InternetAddress("victor.calderon@pucp.edu.pe")); //sender email address here
                email.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(listausuario.getCorreo())); //Receiver email address here
                email.setSubject("Actualización de horario Cultural Box-Office PUCP"); //Email Subject and message

                // creating first MimeBodyPart object
                String id="";
                String[] nums = {"0","1","2","3","4","5","6","7","8","9"};
                for (int j = 0; j < 11; j++ ) {
                    id += nums[(int) Math.round(Math.random() * 9)];
                }
                BodyPart messageBodyPart1 = new MimeBodyPart();
                messageBodyPart1.setText("Atención, sus entradas para"+" "+nombre_pelicula+" han cambiado para el"+" "+dia+" a las"+" "+tiempo_inicio+" horas. Por favor revisar su historial de funciones para más detalles. Se adjunta también su nuevo código QR y código aleatorio para ingresar para ingresar.\n"
                +" Su código es: "+id);

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
            }

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public Horarios duracionFuncion(String id_funcion) {
        Horarios horarios = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "SELECT * FROM funcion where idFuncion=?";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id_funcion);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    horarios = new Horarios();
                    horarios.setDuracion_funcion(rs.getInt(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return horarios;
    }

    public Horarios duracionFuncion1(String nombre_funcion) {
        Horarios horarios = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "SELECT * FROM funcion where nombre=?;";
        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre_funcion);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    horarios = new Horarios();
                    horarios.setDuracion_funcion(rs.getInt(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return horarios;
    }

    public int ValidaCruce(int idsede, int idsala, String dia, String tiempo_inicio, int duracion_funcion){

        String sql2 = "select h.idHorario ,f.nombre, h.tiempo_inicio + 0 as tiempo_inicio, date_add(h.tiempo_inicio, interval f.duracion minute) + 0 as tiempo_fin, h.idSede, h.idSala, h.dia\n" +
                "from funcion f, horario h\n" +
                "where f.idFuncion = h.idFuncion \n" +
                "and idSede=? and idSala=? and dia = ? \n" +
                "and (h.tiempo_inicio between (select time(?) + 0) and (date_add(time(?), interval ? minute))\n" +
                "or (date_add(h.tiempo_inicio, interval f.duracion minute) + 0) between (select time(?) + 0) and (date_add(time(?), interval ? minute)));";

        int val = 0;

        try (Connection connection2 = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt2 = connection2.prepareStatement(sql2);) {

            pstmt2.setInt(1,idsede);
            pstmt2.setInt(2,idsala);
            pstmt2.setString(3,dia);
            pstmt2.setString(4,tiempo_inicio);
            pstmt2.setString(5,tiempo_inicio);
            pstmt2.setInt(6,duracion_funcion);
            pstmt2.setString(7,tiempo_inicio);
            pstmt2.setString(8,tiempo_inicio);
            pstmt2.setInt(9,duracion_funcion);

            try (ResultSet rs2 = pstmt2.executeQuery();) {
                while(rs2.next()) {
                    val = 1;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return val;
    }

    public ArrayList<Horarios> obtenerAforoSalas(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        ArrayList<Horarios> listaHorarios = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM sala;");){
            while (rs.next()){
                Horarios horarios= new Horarios();
                horarios.setIdSala(rs.getInt(1));
                horarios.setAforo_sala(rs.getInt(3));
                listaHorarios.add(horarios);
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHorarios;
    }

}
