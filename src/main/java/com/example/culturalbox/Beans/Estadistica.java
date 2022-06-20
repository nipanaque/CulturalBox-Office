package com.example.culturalbox.Beans;

import java.io.InputStream;

public class Estadistica {
    private String nombre;
    private double puntaje;
    private String fecha;
    private String genero;
    private String hora;
    private double asistencia;
    private double recaudado;
    private double maxMonto;
    private String director;
    private int idfotoEstadFuncion;
    private int id;

    public Estadistica() {
    }

    public Estadistica(String nombre) {
        this.nombre = nombre;
    }

    public Estadistica(String nombre, double puntaje) {
        this.nombre = nombre;
        this.puntaje = puntaje;
    }

    public Estadistica(String nombre, double puntaje, String fecha, String genero, String hora, double asistencia, double recaudado, double maxMonto, String director, int idfotoEstadFuncion, int id) {
        this.nombre = nombre;
        this.puntaje = puntaje;
        this.fecha = fecha;
        this.genero = genero;
        this.hora = hora;
        this.asistencia = asistencia;
        this.recaudado = recaudado;
        this.maxMonto = maxMonto;
        this.director = director;
        this.idfotoEstadFuncion = idfotoEstadFuncion;
        this.id = id;
    }

    public int getIdfotoEstadFuncion() {
        return idfotoEstadFuncion;
    }

    public void setIdfotoEstadFuncion(int idfotoEstadFuncion) {
        this.idfotoEstadFuncion = idfotoEstadFuncion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public double getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(double asistencia) {
        this.asistencia = asistencia;
    }

    public double getRecaudado() {
        return recaudado;
    }

    public void setRecaudado(double recaudado) {
        this.recaudado = recaudado;
    }

    public double getMaxMonto() {
        return maxMonto;
    }

    public void setMaxMonto(double maxMonto) {
        this.maxMonto = maxMonto;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
}

