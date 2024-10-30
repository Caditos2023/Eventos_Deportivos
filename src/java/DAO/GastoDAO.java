/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author amali
 */

import Config.DBConnection;
import Modelo.Gastos;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class GastoDAO {
    
    private final Connection cnn;

    public GastoDAO() throws SQLException, NamingException {
        this.cnn = DBConnection.getConnection();
    }

    public void close() throws SQLException {
        if (this.cnn != null) DBConnection.closeConnection(this.cnn);
    }

    public List<Gastos> getGastos() throws SQLException, NamingException {
        String query = "{CALL VerGastosDelDia1()}"; // Llamada al procedimiento almacenado
        List<Gastos> gastos = new ArrayList<>();
        try (PreparedStatement ps = cnn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Gastos gasto = new Gastos(
                    rs.getDate("fecha"), 
                    rs.getFloat("TotalMontoPorDia")    
                );
                gastos.add(gasto);
            }
        }
        return gastos;
    }
    
    
       public List<Gastos> getMotivos(Date fecha) throws SQLException, NamingException {
    String query = "{CALL ObtenerGastosPorFecha(?)}";
    List<Gastos> gastos = new ArrayList<>();
    
    try (Connection cnn = DBConnection.getConnection();
         PreparedStatement ps = cnn.prepareStatement(query)) {
        
        ps.setDate(1, fecha);  
        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Gastos gasto = new Gastos(
                         rs.getString("motivo"),
                         rs.getFloat("monto")
                       
                );

                gastos.add(gasto);
            }
        }
    }
    return gastos;
}
    
    
}
