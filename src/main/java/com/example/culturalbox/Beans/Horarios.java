package com.example.culturalbox.Beans;

import java.sql.Time;

public class Horarios {
    private int idHorario;
    private int vigencia;
    private float costo;
    private String dia;
    private String tiempo_inicio;
    private int stock;
    private int idSala;
    private int idSede;
    private int idFuncion;
    private int duracion;
    private int tickets_vendidos;
    private float recaudacion;

    //
    private Time t_init;

    public Time getT_init() {
        return t_init;
    }

    public void setT_init(Time t_init) {
        this.t_init = t_init;
    }

    //

    public float getRecaudacion() {
        return recaudacion;
    }

    public void setRecaudacion(float recaudacion) {
        this.recaudacion = recaudacion;
    }

    public int getTickets_vendidos() {
        return tickets_vendidos;
    }

    public void setTickets_vendidos(int tickets_vendidos) {
        this.tickets_vendidos = tickets_vendidos;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    private String nombre_sede;
    private int SalaSede;
    private String nombre_funcion;
    private String descripcion_funcion;
    private String genero_funcion;
    private int horario_aforo;

    public int getHorario_aforo() {
        return horario_aforo;
    }

    public void setHorario_aforo(int horario_aforo) {
        this.horario_aforo = horario_aforo;
    }

    public String getGenero_funcion() {
        return genero_funcion;
    }

    public void setGenero_funcion(String genero_funcion) {
        this.genero_funcion = genero_funcion;
    }

    public String getDescripcion_funcion() {
        return descripcion_funcion;
    }

    public void setDescripcion_funcion(String descripcion_funcion) {
        this.descripcion_funcion = descripcion_funcion;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public String getNombre_sede() {
        return nombre_sede;
    }

    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
    }

    public int getSalaSede() {
        return SalaSede;
    }

    public void setSalaSede(int salaSede) {
        SalaSede = salaSede;
    }

    public String getNombre_funcion() {
        return nombre_funcion;
    }

    public void setNombre_funcion(String nombre_funcion) {
        this.nombre_funcion = nombre_funcion;
    }

    public int getVigencia() {
        return vigencia;
    }

    public void setVigencia(int vigencia) {
        this.vigencia = vigencia;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getTiempo_inicio() {
        return tiempo_inicio;
    }

    public void setTiempo_inicio(String tiempo_inicio) {
        this.tiempo_inicio = tiempo_inicio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
    }
}
