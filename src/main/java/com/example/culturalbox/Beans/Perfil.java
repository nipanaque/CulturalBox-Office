package com.example.culturalbox.Beans;

import javax.swing.*;
import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;

public class Perfil {
    private String nombre_completo;
    private int dni;
    private int codigo_pucp;
    private String correo_pucp;
    private String fecha_nacimiento;
    private String direccion;
    private int numtelefono;
    private InputStream foto;

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCodigo_pucp() {
        return codigo_pucp;
    }

    public void setCodigo_pucp(int codigo_pucp) {
        this.codigo_pucp = codigo_pucp;
    }

    public String getCorreo_pucp() {
        return correo_pucp;
    }

    public void setCorreo_pucp(String correo_pucp) {
        this.correo_pucp = correo_pucp;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNumtelefono() {
        return numtelefono;
    }

    public void setNumtelefono(int numtelefono) {
        this.numtelefono = numtelefono;
    }
}
