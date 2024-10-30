/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;
   

import DAO.CreditoDAO;
import Modelo.Credito;
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


@WebServlet("/ActualizarCredito")
public class ActualizarCreditoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
       

        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CreditoDAO creditosDAO;
        List<Credito> listaCreditos;
        try {
            creditosDAO = new CreditoDAO();
            listaCreditos = creditosDAO.getCreditos();
            // Verifica si la lista tiene elementos y muestra su tamaño en consola
            System.out.println(listaCreditos);
            // Si la lista está vacía, puede haber un problema con la consulta a la base de datos.
            request.setAttribute("listaCreditos", listaCreditos); // Pasamos la lista al JSP
            request.getRequestDispatcher("actualizar_credito.jsp").forward(request, response); // Redirigir al JSP
        } 
        catch (SQLException ex) {
            Logger.getLogger(ActualizarCreditoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (NamingException ex) {
            Logger.getLogger(ActualizarCreditoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
