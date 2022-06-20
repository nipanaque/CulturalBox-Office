package com.example.culturalbox.Beans;

public class Operadores {
    private String id;
    private String nombre;
    private String apellido;
    private String correo;

    public Operadores(String nombre, String apellido, String correo, String id) {
        this.nombre = nombre;
        this.setApellido(apellido);
        this.correo = correo;
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
