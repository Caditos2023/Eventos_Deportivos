/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */
public class TipoVenta {
    private int idTipoVenta;  // Cambio a camelCase y private
    private String descripcion;

    // Constructor por defecto
    public TipoVenta() {
    }

    // Constructor con parámetros
    public TipoVenta(int idTipoVenta, String descripcion) {
        this.idTipoVenta = idTipoVenta;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getIdTipoVenta() {
        return idTipoVenta;
    }

    public void setIdTipoVenta(int idTipoVenta) {
        this.idTipoVenta = idTipoVenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
