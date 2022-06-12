package com.example.culturalbox.Beans;

public class Calificacion {
    private String nombreFuncion;
    private String nombreDirector;
    private String nombreActor;


    public Calificacion(String nombreFuncion, String nombreDirector, String nombreActor) {
        this.nombreFuncion = nombreFuncion;
        this.nombreDirector = nombreDirector;
        this.nombreActor = nombreActor;
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
}
