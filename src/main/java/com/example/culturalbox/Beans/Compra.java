package com.example.culturalbox.Beans;

import java.sql.Time;

public class Compra {
    private String nombre_funcion;
    private int costo;
    private Time t_init;
    private String idCompra;
    private int nu_tickets;

    public Time getT_init() {
        return t_init;
    }

    public void setT_init(Time t_init) {
        this.t_init = t_init;
    }

    public String getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(String idCompra) {
        this.idCompra = idCompra;
    }

    public int getNu_tickets() {
        return nu_tickets;
    }

    public void setNu_tickets(int nu_tickets) {
        this.nu_tickets = nu_tickets;
    }

    public String getNombre_funcion() {
        return nombre_funcion;
    }

    public void setNombre_funcion(String nombre_funcion) {
        this.nombre_funcion = nombre_funcion;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }
}