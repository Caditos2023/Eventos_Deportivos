/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author amali
 */


import DAO.SurtidorDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Modelo.Tanque;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;



@WebServlet("/NumeracionSurtidor")
public class NumeracionSurtidor extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SurtidorDAO tanqueDAO;
        List<Tanque> listaTanques;
        try {
            tanqueDAO = new SurtidorDAO();
            listaTanques = tanqueDAO.getTanques();
            
            
            System.out.println(listaTanques);
            
            request.setAttribute("listaTanques", listaTanques); // Pasamos la lista al JSP
            
            request.getRequestDispatcher("numeracion_surtidor.jsp").forward(request, response); // Redirigir al JSP
            
        } catch (SQLException ex) {
            Logger.getLogger(NumeracionSurtidor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(NumeracionSurtidor.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
