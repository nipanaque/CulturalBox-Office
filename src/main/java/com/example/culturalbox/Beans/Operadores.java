package com.example.culturalbox.Beans;

public class Operadores {
    private String nombre;
    private String apellido;
    private String correo;

    public Operadores(String nombre, String apellido, String correo) {
        this.nombre = nombre;
        this.setApellido(apellido);
        this.correo = correo;
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
}
