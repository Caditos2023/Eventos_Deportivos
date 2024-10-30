/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author amali
 */


import DAO.GastoDAO;
import Modelo.Gastos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;



@WebServlet("/HistorialGastos")
public class HistorialGastoServlet extends HttpServlet {
    
   private GastoDAO gastosDAO;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         String fechaString = request.getParameter("fecha");
        Date fecha = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Formato de fecha esperado
        try {
            // Convertimos el String a java.sql.Date
            java.util.Date utilDate = sdf.parse(fechaString); // Convierte a java.util.Date
            fecha = new Date(utilDate.getTime()); // Convierte a java.sql.Date
        } catch (ParseException e) {
            e.printStackTrace();
            response.getWriter().write("Error al parsear la fecha.");
            return; // Salimos del método si hay un error
        }

        try {
            gastosDAO = new GastoDAO();
            List<Gastos> listaMotivos = gastosDAO.getMotivos(fecha);  // Llama al método con la fecha
            request.setAttribute("listaMotivos", listaMotivos);

            RequestDispatcher dispatcher = request.getRequestDispatcher("historial_gastos.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            response.getWriter().write("Error al obtener el historial de gastos.");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
