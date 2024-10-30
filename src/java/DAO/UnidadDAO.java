/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;
import Modelo.Producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author amali
 */

public class UnidadDAO {
    private final Connection cnn;
    
    public UnidadDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public List<Producto> getUnidades() throws SQLException, NamingException {
        String query =  "{CALL ObtenerDescripcionYPrecio()}";
        List<Producto> productos = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Producto producto = new Producto(
				  
                             rs.getString("descripcion"),
                             rs.getFloat("precio_venta")) ;

                    productos.add(producto);
                }
            }
        }
        return productos;
    } 

    
    public Map<String, Integer> getCantidadPorProducto() throws SQLException {
        String query = "{CALL VerCantidadPorProducto()}";
        Map<String, Integer> cantidadPorProducto = new HashMap<>();

        try (PreparedStatement ps = cnn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int idProducto = rs.getInt("idproducto");
                float cantidad = rs.getFloat("cantidad");

                // Asignar los productos a etiquetas específicas (Regular, Premium, Diesel)
                String productoTipo;
                switch (idProducto) {
                    case 1: productoTipo = "REGULAR"; break;
                    case 2: productoTipo = "PREMIUM"; break;
                    case 3: productoTipo = "DIESEL"; break;
                    default: productoTipo = "OTRO"; break;
                }
                cantidadPorProducto.put(productoTipo, (int)cantidad);
            }
        }
        return cantidadPorProducto;
    }

  
}