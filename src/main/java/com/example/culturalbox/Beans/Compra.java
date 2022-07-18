package com.example.culturalbox.Beans;

import java.sql.Time;

public class Compra {
    private String nombre_funcion;
    private int costo;
    private Time t_init;
    private String idCompra;
    private int nu_tickets;
    private int cruce;
    private String tiempoInicio;
    private String dia;
    private int valido;
    private String sede;
    //
    private int idHorario;

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }
    //

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

    public int getCruce() {
        return cruce;
    }

    public void setCruce(int cruce) {
        this.cruce = cruce;
    }

    public String getTiempoInicio() {
        return tiempoInicio;
    }

    public void setTiempoInicio(String tiempoInicio) {
        this.tiempoInicio = tiempoInicio;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getValido() {
        return valido;
    }

    public void setValido(int valido) {
        this.valido = valido;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }
}
