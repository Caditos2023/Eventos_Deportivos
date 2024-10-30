package Controlador;

import DAO.CreditoDAO;
import Modelo.Credito;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HistorialCredito")
public class HistorialCreditoServlet extends HttpServlet {
   
     private CreditoDAO creditoDAO;
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idcliente"));

        try {
            
            creditoDAO = new CreditoDAO();
            
            List<Credito> listaResponsables = creditoDAO.getResponsable(idCliente);  // Llama al método con el idCliente
            request.setAttribute("listaResponsables", listaResponsables);

            RequestDispatcher dispatcher = request.getRequestDispatcher("historial_credito.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            response.getWriter().write("Error al obtener el historial de créditos.");
        }
    }

        
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        
    
}

}
