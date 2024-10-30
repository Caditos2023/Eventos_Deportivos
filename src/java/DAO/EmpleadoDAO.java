/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Config.DBConnection;
import Modelo.Empleado;
import java.sql.CallableStatement;
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
public class EmpleadoDAO {
    
    
    private final Connection cnn;
    
    public EmpleadoDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    public List<Empleado> getEmpleado_estado() throws SQLException, NamingException {
        String query =  "{CALL  vista_usuario_estado()}";
        List<Empleado> empleados = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Empleado empleado = new Empleado(
				//rs.getInt("idtanque"),
                            
                                rs.getString("nombre"),
                                rs.getString("apellido"),
                                rs.getString("direccion"),
                                rs.getString("documento"),
                             rs.getBoolean("estado")				
                    );

                    empleados.add(empleado);
                }
            }
        }
        return empleados;
    }
    
      public void guardarEmpleado(String usuario, String contrasena, String nombre, String apellido, String direccion, int iddocumentacion, String documento, boolean estado, boolean permisos) {
        String sql = "{call crear_empleado_usuario(?, ?, ?, ?, ?, ?, ?, ?, ?)}"; // Asegúrate de que los parámetros coincidan con tu procedimiento almacenado

        try (CallableStatement stmt = cnn.prepareCall(sql)) {
            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);
            stmt.setString(3, nombre);
            stmt.setString(4, apellido);
            stmt.setString(5, direccion);
            stmt.setInt(6, iddocumentacion);
            stmt.setString(7, documento);
            stmt.setBoolean(8, estado);
            stmt.setBoolean(9, permisos);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
}
