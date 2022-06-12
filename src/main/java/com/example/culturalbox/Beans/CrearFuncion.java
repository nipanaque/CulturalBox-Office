package com.example.culturalbox.Beans;

public class CrearFuncion {
    private String Nombres_directores;
    private String Nombres_Actores;

    private int id_directores;
    private int id_actores;

    private int idFuncion;
    private String nombre;
    private String genero;
    private int duracion;
    private String restriccion;
    private String descripcion;
    private int idDirector;

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
    }

    public int getId_directores() {
        return id_directores;
    }

    public void setId_directores(int id_directores) {
        this.id_directores = id_directores;
    }

    public int getId_actores() {
        return id_actores;
    }

    public void setId_actores(int id_actores) {
        this.id_actores = id_actores;
    }

    public String getNombres_directores() {
        return Nombres_directores;
    }

    public void setNombres_directores(String nombres_directores) {
        Nombres_directores = nombres_directores;
    }

    public String getNombres_Actores() {
        return Nombres_Actores;
    }

    public void setNombres_Actores(String nombres_Actores) {
        Nombres_Actores = nombres_Actores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getRestriccion() {
        return restriccion;
    }

    public void setRestriccion(String restriccion) {
        this.restriccion = restriccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdDirector() {
        return idDirector;
    }

    public void setIdDirector(int idDirector) {
        this.idDirector = idDirector;
    }
}
