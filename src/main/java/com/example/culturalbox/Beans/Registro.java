package com.example.culturalbox.Beans;

import java.io.InputStream;

public class Registro {
    private int idUsuario;
    private String codigo;
    private String nombre;
    private String apellido;
    private String dni;
    private String correo_pucp;
    private String telefono;
    private String nacimiento;
    private String contrasenha;
    private InputStream fotografia;
    private int idrol;
    private String direccion;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo_pucp() {
        return correo_pucp;
    }

    public void setCorreo_pucp(String correo_pucp) {
        this.correo_pucp = correo_pucp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getContrasenha() {
        return contrasenha;
    }

    public void setContrasenha(String contrasenha) {
        this.contrasenha = contrasenha;
    }

    public InputStream getFotografia() {
        return fotografia;
    }

    public void setFotografia(InputStream fotografia) {
        this.fotografia = fotografia;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
}
