/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */
public class DetalleTransaccional {
    private int idDetalleTransaccional;
    private String detalle;
    private int idVenta;

    public DetalleTransaccional() {}

    public int getIdDetalleTransaccional() {
        return idDetalleTransaccional;
    }

    public void setIdDetalleTransaccional(int idDetalleTransaccional) {
        this.idDetalleTransaccional = idDetalleTransaccional;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
}

