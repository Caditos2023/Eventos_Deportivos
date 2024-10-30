/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */
public class Producto {
    private int idProducto; 
    private String descripcion;
    private int idTanque;  
    private int StockDisponible;
    private float precio_venta;
    private float cantidad;

    public Producto(int idProducto, float cantidad) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }
    

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }
    
    
    
    public Producto() {
    }

    public Producto(String descripcion, float precio_venta) {
        this.descripcion = descripcion;
        this.precio_venta = precio_venta;
    }

    public Producto(int idProducto, String descripcion, int idTanque, int StockDisponible) {
        this.idProducto = idProducto;
        this.descripcion = descripcion;
        this.idTanque = idTanque;
        this.StockDisponible = StockDisponible;
    }

    public Producto(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdTanque() {
        return idTanque;
    }

    public void setIdTanque(int idTanque) {
        this.idTanque = idTanque;
    }

    public int getStockDisponible() {
        return StockDisponible;
    }

    public void setStockDisponible(int StockDisponible) {
        this.StockDisponible = StockDisponible;
    }

    public float getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(float precio_venta) {
        this.precio_venta = precio_venta;
    }

    
    
}
