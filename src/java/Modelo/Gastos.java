/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author amali
 */

public class Gastos {
    private int idGastos;
    private String motivo;
    private float monto;
    private Date fecha;
    private int idEmpleado;
    private float TotalMontoPorDia;

    public Gastos(Date fecha, float TotalMontoPorDia) {
        this.fecha = fecha;
        this.TotalMontoPorDia = TotalMontoPorDia;
    }

    public float getTotalMontoPorDia() {
        return TotalMontoPorDia;
    }

    public void setTotalMontoPorDia(float TotalMontoPorDia) {
        this.TotalMontoPorDia = TotalMontoPorDia;
    }

    
   
   

    public Gastos() {}

    public int getIdGastos() {
        return idGastos;
    }

    public Gastos(String motivo, float monto) {
        this.motivo = motivo;
        this.monto = monto;
    }

    public void setIdGastos(int idGastos) {
        this.idGastos = idGastos;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }

   

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
}
