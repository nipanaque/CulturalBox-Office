package com.example.culturalbox.Beans;

import java.util.ArrayList;

public class Sedes {
    private String id;
    private String nombre;
    private int aforo;
    private String ubicacion;
    private String ultimaActualizacion;
    private int cantidadSalas;
    private ArrayList<Integer> listaforos = new ArrayList<>();

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getUltimaActualizacion() {
        return ultimaActualizacion;
    }

    public void setUltimaActualizacion(String ultimaActualizacion) {
        this.ultimaActualizacion = ultimaActualizacion;
    }

    public int getCantidadSalas() {
        return cantidadSalas;
    }

    public void setCantidadSalas(int cantidadSalas) {
        this.cantidadSalas = cantidadSalas;
    }

    public ArrayList<Integer> getListaforos() {
        return listaforos;
    }

    public void setListaforos(ArrayList<Integer> listaforos) {
        this.listaforos = listaforos;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
