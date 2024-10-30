/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import DAO.VentaDAO;
import Modelo.Venta;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author amali
 */



@WebServlet("/HistorialVentas")
public class HistorialVentasServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
       

        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VentaDAO ventasDAO;
        List<Venta> listaVentas;
        try {
            ventasDAO = new VentaDAO();
            listaVentas = ventasDAO.getVentas();
            // Verifica si la lista tiene elementos y muestra su tamaño en consola
            System.out.println(listaVentas);
            // Si la lista está vacía, puede haber un problema con la consulta a la base de datos.
            request.setAttribute("listaVentas", listaVentas); // Pasamos la lista al JSP
            request.getRequestDispatcher("histo_ventas.jsp").forward(request, response); // Redirigir al JSP
        } 
        catch (SQLException ex) {
            Logger.getLogger(HistorialVentasServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (NamingException ex) {
            Logger.getLogger(HistorialVentasServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
  
