/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;


import DAO.GastoDAO;
import Modelo.Gastos;
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


@WebServlet("/SumaGastosPorDia")
public class RegistroGastoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
       

        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GastoDAO gastosDAO;
        List<Gastos> listaGastos;
        try {
            gastosDAO = new GastoDAO();
            listaGastos = gastosDAO.getGastos();
            // Verifica si la lista tiene elementos y muestra su tamaño en consola
            System.out.println(listaGastos);
            // Si la lista está vacía, puede haber un problema con la consulta a la base de datos.
            request.setAttribute("listaGastos", listaGastos); // Pasamos la lista al JSP
            request.getRequestDispatcher("registro_gastos.jsp").forward(request, response); // Redirigir al JSP
        } 
        catch (SQLException ex) {
            Logger.getLogger(RegistroGastoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (NamingException ex) {
            Logger.getLogger(RegistroGastoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}

    
