/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */
public class Tanque {
    private int idTanque;
    private int capacidad;
    private float numeracionA;
    private float numeracionB;
    private String descripcion;

    public Tanque() {}

    public Tanque( String descripcion, float numeracionA, float numeracionB) {
        this.descripcion = descripcion;        
        this.numeracionA = numeracionA;
        this.numeracionB = numeracionB;
        
    }

    public Tanque(String descripcion) {
        this.descripcion = descripcion;
    }

    

    public int getIdTanque() {
        return idTanque;
    }

    public void setIdTanque(int idTanque) {
        this.idTanque = idTanque;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public float getNumeracionA() {
        return numeracionA;
    }

    public void setNumeracionA(float numeracionA) {
        this.numeracionA = numeracionA;
    }

    public float getNumeracionB() {
        return numeracionB;
    }

    public void setNumeracionB(float numeracionB) {
        this.numeracionB = numeracionB;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
}
