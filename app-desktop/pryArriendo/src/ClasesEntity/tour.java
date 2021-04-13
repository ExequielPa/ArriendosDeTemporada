/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesEntity;

import java.sql.Date;

/**
 *
 * @author Favio
 */
public class tour {
    private int id_tour;
    private String recorrido;
    private String punto_reunion;
    private Date horario_salida;
    private Date horario_llegada;
    private int valor;

    public tour() {
    }

    public tour(int id_tour, String recorrido, String punto_reunion, Date horario_salida, Date horario_llegada, int valor) {
        this.id_tour = id_tour;
        this.recorrido = recorrido;
        this.punto_reunion = punto_reunion;
        this.horario_salida = horario_salida;
        this.horario_llegada = horario_llegada;
        this.valor = valor;
    }

    public int getId_tour() {
        return id_tour;
    }

    public void setId_tour(int id_tour) {
        this.id_tour = id_tour;
    }

    public String getRecorrido() {
        return recorrido;
    }

    public void setRecorrido(String recorrido) {
        this.recorrido = recorrido;
    }

    public String getPunto_reunion() {
        return punto_reunion;
    }

    public void setPunto_reunion(String punto_reunion) {
        this.punto_reunion = punto_reunion;
    }

    public Date getHorario_salida() {
        return horario_salida;
    }

    public void setHorario_salida(Date horario_salida) {
        this.horario_salida = horario_salida;
    }

    public Date getHorario_llegada() {
        return horario_llegada;
    }

    public void setHorario_llegada(Date horario_llegada) {
        this.horario_llegada = horario_llegada;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "tour{" + "id_tour=" + id_tour + ", recorrido=" + recorrido + ", punto_reunion=" + punto_reunion + ", horario_salida=" + horario_salida + ", horario_llegada=" + horario_llegada + ", valor=" + valor + '}';
    }
    
    
    
    
}
