/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;



import DAO.ProductoDAO;
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

@WebServlet("/RegistroVentaGalones")
public class RegistroVentaGalServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        ProductoDAO productoDAO = null;
        
        try {
            // Inicializamos el DAO
            productoDAO = new ProductoDAO();
            
            // Obtenemos el stock de cada producto
            Map<String, Integer> precio = productoDAO.getPrecioPorProducto();
            
            // Pasamos el mapa de stock a la JSP
            request.setAttribute("precio", precio);
            request.getRequestDispatcher("registro_venta_galones.jsp").forward(request, response);
            
        } catch (SQLException e) {
            // Manejamos las excepciones de SQL
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en la base de datos");
        } catch (NamingException ex) {
            Logger.getLogger(MostrarStockServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Aseguramos que la conexión se cierre en el bloque finally
            if (productoDAO != null) {
                try {
                    productoDAO.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
    int idVenta = Integer.parseInt(request.getParameter("ticketNumber"));
        // Otros parámetros de la venta (como descripción, precios, etc.)
        //-guardarVentaEnBaseDeDatos(idVenta, otrosDatos);
        response.sendRedirect("registro_venta_soles.jsp");
        
    
}

}
