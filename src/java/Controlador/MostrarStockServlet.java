/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import DAO.UnidadDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MostrarStock")
public class MostrarStockServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UnidadDAO unidadDAO = null;
        
        try {
            // Inicializamos el DAO
            unidadDAO = new UnidadDAO();
            
            // Obtenemos el stock de cada producto
            Map<String, Integer> stock = unidadDAO.getCantidadPorProducto();
            
            // Pasamos el mapa de stock a la JSP
            request.setAttribute("stock", stock);
            request.getRequestDispatcher("control_stock.jsp").forward(request, response);
            
        } catch (SQLException e) {
            // Manejamos las excepciones de SQL
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en la base de datos");
        } catch (NamingException ex) {
            Logger.getLogger(MostrarStockServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Aseguramos que la conexión se cierre en el bloque finally
            if (unidadDAO != null) {
                try {
                    unidadDAO.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
