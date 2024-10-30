/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author amali
 */


public class ContactoEmpleado {
    private int idContactoEmpleado;
    private String detalle;
    private int idTipoContacto;
    private int idEmpleado;

    public ContactoEmpleado() {}

    public int getIdContactoEmpleado() {
        return idContactoEmpleado;
    }

    public void setIdContactoEmpleado(int idContactoEmpleado) {
        this.idContactoEmpleado = idContactoEmpleado;
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

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
}

