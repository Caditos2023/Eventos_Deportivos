/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */
public class TipoContacto {
    private int idTipoContacto;  // Cambio a camelCase y private
    private String descripcion;

    // Constructor por defecto
    public TipoContacto() {
    }

    // Constructor con parámetros
    public TipoContacto(int idTipoContacto, String descripcion) {
        this.idTipoContacto = idTipoContacto;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getIdTipoContacto() {
        return idTipoContacto;
    }

    public void setIdTipoContacto(int idTipoContacto) {
        this.idTipoContacto = idTipoContacto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}

