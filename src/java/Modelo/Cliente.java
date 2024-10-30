/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


public class Cliente {
    private int idcliente;
    private String nombre;
    private String documento;
    private int limiteCrediticio;
    private int tolerancia;
    private int idDocumentacion;
    private String detalle;

    public Cliente(int aInt, String string, String string1) {}


    public Cliente() {
    }

    public Cliente(int idcliente, String nombre, String documento, String detalle) {
        this.idcliente = idcliente;
        this.nombre = nombre;
        this.documento = documento;
        this.detalle = detalle;
        
        
    }

    
    
    public Cliente(int idcliente, String nombre, String documento, int limiteCrediticio, int tolerancia, int idDocumentacion, String detalle) {
        this.idcliente = idcliente;
        this.nombre = nombre;
        this.documento = documento;
        this.limiteCrediticio = limiteCrediticio;
        this.tolerancia = tolerancia;
        this.idDocumentacion = idDocumentacion;
        this.detalle = detalle;
    }
    

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

   

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public int getLimiteCrediticio() {
        return limiteCrediticio;
    }

    public void setLimiteCrediticio(int limiteCrediticio) {
        this.limiteCrediticio = limiteCrediticio;
    }

    public int getTolerancia() {
        return tolerancia;
    }

    public void setTolerancia(int tolerancia) {
        this.tolerancia = tolerancia;
    }

    public int getIdDocumentacion() {
        return idDocumentacion;
    }

    public void setIdDocumentacion(int idDocumentacion) {
        this.idDocumentacion = idDocumentacion;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    
}
