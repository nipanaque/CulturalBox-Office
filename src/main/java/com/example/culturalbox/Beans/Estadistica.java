package com.example.culturalbox.Beans;

public class Estadistica {
    private String nomFunMejorCalif;
    private double puntFunPromMejorCalif;

    public Estadistica() {
    }

    public Estadistica(String nomFunMejorCalif, double puntFunPromMejorCalif) {
        this.nomFunMejorCalif = nomFunMejorCalif;
        this.puntFunPromMejorCalif = puntFunPromMejorCalif;
    }

    public String getNomFunMejorCalif() {
        return nomFunMejorCalif;
    }

    public void setNomFunMejorCalif(String nomFunMejorCalif) {
        this.nomFunMejorCalif = nomFunMejorCalif;
    }

    public double getPuntFunPromMejorCalif() {
        return puntFunPromMejorCalif;
    }

    public void setPuntFunPromMejorCalif(double puntFunPromMejorCalif) {
        this.puntFunPromMejorCalif = puntFunPromMejorCalif;
    }
}
