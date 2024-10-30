/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;

import Modelo.Venta;
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
public class VentaDAO {
    private final Connection cnn;
    
    public VentaDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public List<Venta> getVentas() throws SQLException, NamingException {
        String query =  "{CALL VerVentasConPrecio()}";
        List<Venta> ventas = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Venta venta = new Venta(
				rs.getInt("idventa"),   
                                rs.getString("nombre"),
                                rs.getDate("fecha"),
                                rs.getFloat("precio"));

                    ventas.add(venta);
                }
            }
        }
        return ventas;
    } 



}