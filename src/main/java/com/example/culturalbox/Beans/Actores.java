package com.example.culturalbox.Beans;

import java.util.ArrayList;

public class Actores {
    private String nombre;
    private String apellido;
    private String id;
    private int puntaje;
    private ArrayList<String> obras = new ArrayList<>();

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ArrayList<String> getObras() {
        return obras;
    }

    public void setObras(ArrayList<String> obras) {
        this.obras = obras;
    }
}