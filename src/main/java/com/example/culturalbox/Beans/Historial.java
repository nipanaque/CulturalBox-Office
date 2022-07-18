package com.example.culturalbox.Beans;

public class Historial {
    private String nombre_funcion;
    private String nombre_sede;
    private int num_ticket;
    private int idCompra;
    private String fechaHora;

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public Historial(String nombre_funcion, String nombre_sede, int num_ticket) {
        this.nombre_funcion = nombre_funcion;
        this.nombre_sede = nombre_sede;
        this.num_ticket = num_ticket;
    }


    public Historial() {

    }

    public String getNombre_funcion() {
        return nombre_funcion;
    }

    public void setNombre_funcion(String nombre_funcion) {
        this.nombre_funcion = nombre_funcion;
    }

    public String getNombre_sede() {
        return nombre_sede;
    }

    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
    }

    public int getNum_ticket() {
        return num_ticket;
    }

    public void setNum_ticket(int num_ticket) {
        this.num_ticket = num_ticket;
    }
}
