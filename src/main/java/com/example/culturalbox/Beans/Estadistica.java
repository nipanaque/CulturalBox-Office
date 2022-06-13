package com.example.culturalbox.Beans;

public class Estadistica {
    private String nombre;
    private double puntaje;

    public Estadistica() {
    }

    public Estadistica(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
}
