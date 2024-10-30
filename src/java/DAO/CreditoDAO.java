/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;
import Modelo.Credito;
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
public class CreditoDAO {
    

   
    
    private final Connection cnn;
    
    public CreditoDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
   
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public List<Credito> getCreditos() throws SQLException, NamingException {
        String query =  "{CALL VerClientesConToleranciaCeroOMayor1()}";
        List<Credito> creditos = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Credito credito = new Credito(
				 rs.getInt("idCliente"),
                                rs.getString("nombre"),
                                 rs.getInt("tolerancia"));

                    creditos.add(credito);
                }
            }
        }
        return creditos;
    } 
    
    
    public List<Credito> getResponsable(int idCliente) throws SQLException, NamingException {
    String query = "{CALL VerHistorialCreditoPorCliente(?)}";
    List<Credito> creditos = new ArrayList<>();
    
    try (Connection cnn = DBConnection.getConnection();
         PreparedStatement ps = cnn.prepareStatement(query)) {
        
        ps.setInt(1, idCliente);  // Asigna el valor de idCliente al parámetro del procedimiento almacenado
        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Credito credito = new Credito(
                        rs.getString("responsable"),
                        rs.getString("documento_responsable"),
                        rs.getFloat("despacho"),
                        rs.getDate("fecha")
                );

                creditos.add(credito);
            }
        }
    }
    return creditos;
}


    
}
