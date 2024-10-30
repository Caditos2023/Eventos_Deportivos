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
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UsuarioDAO {
    
    
    
    private Connection conexion;

    public UsuarioDAO() {
        // Usamos la clase Conexion para obtener la conexión
        this.conexion = DBConnection.getConnection();
    }

    // Método para llamar al procedimiento almacenado y verificar usuario y contraseña
    public String validarUsuario(String usuario, String contrasena) {
        String resultado = null;
        String sql = "{CALL validar_usuario(?, ?)}";  // Llamado al procedimiento almacenado
        try (CallableStatement cs = conexion.prepareCall(sql)) {
            cs.setString(1, usuario);       // Parámetro usuario
            cs.setString(2, contrasena);    // Parámetro contraseña
            
            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    String mensaje = rs.getString("Mensaje");  // Recibir el mensaje desde el proc almacenado
                    
                    if (mensaje.equals("Empleado - Ventana de empleado")) {
                        resultado = "Empleado";
                    } else if (mensaje.equals("Administrador - Ventana de administrador")) {
                        resultado = "Administrador";
                    } else if (mensaje.equals("Cuenta inactiva")) {
                        resultado = "Cuenta inactiva";
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultado = "Error en la base de datos";
        }
        return resultado;
    }
    
    
  
    
}

        
    
    
    





