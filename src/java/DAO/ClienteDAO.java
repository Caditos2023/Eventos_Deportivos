/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author amali
 */
public class ClienteDAO {
    private final Connection cnn;
    
    public ClienteDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public List<Cliente> getClientes() throws SQLException, NamingException {
        String query =  "{CALL VistaCliente()}";
        List<Cliente> clientes = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cliente cliente = new Cliente(
				rs.getInt("idcliente"),   
                                rs.getString("documento"),
                                rs.getString("detalle"),
                                rs.getString("nombre"));

                    clientes.add(cliente);
                }
            }
        }
        return clientes;
    } 
public Cliente getClienteById(int id) throws SQLException, NamingException {
    String query = "{CALL VistaClientePorId(?)}"; // Cambia 'VistaClientePorId' por el nombre correcto de tu procedimiento almacenado
    Cliente cliente = null;

    try (PreparedStatement ps = cnn.prepareStatement(query)) {
        ps.setInt(1, id); // Asigna el ID al parámetro del procedimiento
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                cliente = new Cliente(
                    rs.getInt("idcliente"),   
                    rs.getString("documento"),
                    rs.getString("detalle"),
                    rs.getString("nombre")
                );
            }
        }
    }
    return cliente;
}

public void updateCliente(Cliente cliente) throws SQLException {
    String query = "{CALL ActualizarCliente(?, ?, ?, ?)}"; // Procedimiento almacenado para actualizar

    try (PreparedStatement ps = cnn.prepareStatement(query)) {
        ps.setInt(1, cliente.getIdcliente()); // ID del cliente
        ps.setString(2, cliente.getDocumento()); // Documento
        ps.setString(3, cliente.getDetalle()); // Detalle
        ps.setString(4, cliente.getNombre()); // Nombre

        ps.executeUpdate(); // Ejecutar actualización
    }
}


}