package com.example.culturalbox.Beans;

public class Calificacion {
    private String nombreFuncion;
    private String nombreDirector;
    private String nombreActor;
    private int puntajeFuncion;
    private int puntajeDirector;
    private int puntajeActor;

    public Calificacion(String nombreFuncion, String nombreDirector, String nombreActor, int puntajeFuncion, int puntajeDirector, int puntajeActor) {
        this.nombreFuncion = nombreFuncion;
        this.nombreDirector = nombreDirector;
        this.nombreActor = nombreActor;
        this.puntajeFuncion = puntajeFuncion;
        this.puntajeDirector = puntajeDirector;
        this.puntajeActor = puntajeActor;
    }

    public Calificacion() {

    }

    public String getNombreFuncion() {
        return nombreFuncion;
    }

    public void setNombreFuncion(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public String getNombreActor() {
        return nombreActor;
    }

    public void setNombreActor(String nombreActor) {
        this.nombreActor = nombreActor;
    }

    public int getPuntajeFuncion() {
        return puntajeFuncion;
    }

    public void setPuntajeFuncion(int puntajeFuncion) {
        this.puntajeFuncion = puntajeFuncion;
    }

    public int getPuntajeDirector() {
        return puntajeDirector;
    }

    public void setPuntajeDirector(int puntajeDirector) {
        this.puntajeDirector = puntajeDirector;
    }

    public int getPuntajeActor() {
        return puntajeActor;
    }

    public void setPuntajeActor(int puntajeActor) {
        this.puntajeActor = puntajeActor;
    }
}
