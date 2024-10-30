/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author amali
 */



import DAO.ClienteDAO;
import Modelo.Cliente;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;



@WebServlet("/ListadoClientes")
public class ListadoClientesServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
       

        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClienteDAO clientesDAO;
        List<Cliente> listaClientes;
        try {
            clientesDAO = new ClienteDAO();
            listaClientes = clientesDAO.getClientes();
            // Verifica si la lista tiene elementos y muestra su tamaño en consola
            System.out.println(listaClientes);
            // Si la lista está vacía, puede haber un problema con la consulta a la base de datos.
            request.setAttribute("listaClientes", listaClientes); // Pasamos la lista al JSP
            request.getRequestDispatcher("listado_clientes.jsp").forward(request, response); // Redirigir al JSP
        } 
        catch (SQLException ex) {
            Logger.getLogger(ListadoClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (NamingException ex) {
            Logger.getLogger(ListadoClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
