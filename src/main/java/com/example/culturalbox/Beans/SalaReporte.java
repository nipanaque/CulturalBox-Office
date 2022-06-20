package com.example.culturalbox.Beans;

public class SalaReporte {
    private int idSala;
    private int SalaSede;
    private int idSede;
    private String dia;

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getSalaSede() {
        return SalaSede;
    }

    public void setSalaSede(int salaSede) {
        SalaSede = salaSede;
    }
}
