/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


public class ContactoCliente {
    private int idContactoCliente;
    private String detalle;
    private int idTipoContacto;
    private int idCliente;

    public ContactoCliente() {}

    public int getIdContactoCliente() {
        return idContactoCliente;
    }

    public void setIdContactoCliente(int idContactoCliente) {
        this.idContactoCliente = idContactoCliente;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getIdTipoContacto() {
        return idTipoContacto;
    }

    public void setIdTipoContacto(int idTipoContacto) {
        this.idTipoContacto = idTipoContacto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
}
