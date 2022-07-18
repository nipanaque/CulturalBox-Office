package com.example.culturalbox.Beans;

public class Calificacion {
    private String nombreFuncion;
    private String nombreDirector;
    private String nombreActor;
    private int puntajeFuncion;
    private int puntajeDirector;
    private int puntajeActor;
    private int idFuncion;
    private int idDirector;
    private int idActor;
    int puntaje;

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

    public Calificacion(int idActor, String nombreActor, int puntaje) {
        this.idActor = idActor;
        this.nombreActor = nombreActor;
        this.puntaje = puntaje;
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

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
    }

    public int getIdDirector() {
        return idDirector;
    }

    public void setIdDirector(int idDirector) {
        this.idDirector = idDirector;
    }

    public int getIdActor() {
        return idActor;
    }

    public void setIdActor(int idActor) {
        this.idActor = idActor;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
}