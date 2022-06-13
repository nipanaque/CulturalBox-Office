package com.example.culturalbox.Beans;

import java.util.ArrayList;

public class Directores {
    private String id;
    private String nombre;
    private int puntaje;
    private ArrayList<String> obras = new ArrayList<>();

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
