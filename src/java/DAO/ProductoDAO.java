/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author amali
 */
public class ProductoDAO {
     private final Connection cnn;
    
    public ProductoDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public Map<String, Integer> getPrecioPorProducto() throws SQLException {
        String query = "{CALL VerPrecioPorProducto()}";
        Map<String, Integer> cantidadPorProducto = new HashMap<>();

        try (PreparedStatement ps = cnn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int idProducto = rs.getInt("idproducto");
                float cantidad = rs.getFloat("precio_venta");

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

    
    public boolean editarPrecioVenta(int idProducto, double precio_venta) {
        String sql = "{CALL editarprecio_Venta(?, ?)}";
        
        try (PreparedStatement stmt = cnn.prepareStatement(sql)) {
            stmt.setInt(1, idProducto);
            stmt.setDouble(2, precio_venta);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Devuelve verdadero si la actualización fue exitosa
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
