/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author amali
 */
public class Credito {

    private int idcredito;
    private int idCliente;
    private String responsable;
    private int idDocumentacion;
    private String documento_responsable;
    private int galonesStock;
    private float despacho;
    private float precioGalon;
    private int idProducto;
    private String nombre;
    private int tolerancia;
    private Date fecha;
    
    public Credito(int idCliente, String nombre, int tolerancia) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.tolerancia = tolerancia;
    }

    public Credito(String responsable, String documento_responsable, float despacho, Date fecha) {
        this.responsable = responsable;
        this.documento_responsable = documento_responsable;
        this.despacho = despacho;
        this.fecha = fecha;
    }

    public Credito(int idcredito, int idCliente, String responsable, int idDocumentacion, String documento_responsable, int galonesStock, float despacho, float precioGalon, int idProducto, String nombre, int tolerancia, Date fecha) {
        this.idcredito = idcredito;
        this.idCliente = idCliente;
        this.responsable = responsable;
        this.idDocumentacion = idDocumentacion;
        this.documento_responsable = documento_responsable;
        this.galonesStock = galonesStock;
        this.despacho = despacho;
        this.precioGalon = precioGalon;
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.tolerancia = tolerancia;
        this.fecha = fecha;
    }

    public String getDocumento_responsable() {
        return documento_responsable;
    }

    public void setDocumento_responsable(String documento_responsable) {
        this.documento_responsable = documento_responsable;
    }

    

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTolerancia() {
        return tolerancia;
    }

    public void setTolerancia(int tolerancia) {
        this.tolerancia = tolerancia;
    }

    public int getIdcredito() {
        return idcredito;
    }

    public void setIdcredito(int idcredito) {
        this.idcredito = idcredito;
    }
    
    
  

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public int getIdDocumentacion() {
        return idDocumentacion;
    }

    public void setIdDocumentacion(int idDocumentacion) {
        this.idDocumentacion = idDocumentacion;
    }

  

    public int getGalonesStock() {
        return galonesStock;
    }

    public void setGalonesStock(int galonesStock) {
        this.galonesStock = galonesStock;
    }

    public float getDespacho() {
        return despacho;
    }

    public void setDespacho(float despacho) {
        this.despacho = despacho;
    }

   

    public float getPrecioGalon() {
        return precioGalon;
    }

    public void setPrecioGalon(float precioGalon) {
        this.precioGalon = precioGalon;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    
    @Override
    public String toString() {
        return "Credito{" +
                "idCredito=" + idcredito +
                ", idCliente=" + idCliente +
                ", responsable='" + responsable + '\'' +
                ", idDocumentacion=" + idDocumentacion +
                ", documentoResponsable='" + documento_responsable + '\'' +
                ", galonesStock=" + galonesStock +
                ", despacho=" + despacho +
                ", precioGalon=" + precioGalon +
                ", idProducto=" + idProducto +
                '}';
    }
}
