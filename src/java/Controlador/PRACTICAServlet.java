package Controlador;

import Config.DBConnection;
import DAO.PRACTICADAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/clienteController")
public class PRACTICAServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    String nombre = request.getParameter("nombre");
    int limite_crediticio = 0;
    int tolerancia = 0;
    int idcliente = -1;

    try {
        limite_crediticio = Integer.parseInt(request.getParameter("limite_crediticio"));
        tolerancia = Integer.parseInt(request.getParameter("tolerancia"));

        if ("editar".equals(action) || "eliminar".equals(action)) {
            idcliente = Integer.parseInt(request.getParameter("idcliente"));
        }

        try (Connection connection = DBConnection.getConnection()) {
            PRACTICADAO practicaDAO = new PRACTICADAO(connection);

            switch (action) {
                case "guardar":
                    practicaDAO.guardarCliente(nombre, limite_crediticio, tolerancia);
                    break;
                case "editar":
                    practicaDAO.editarCliente(idcliente, nombre, limite_crediticio, tolerancia);
                    break;
                case "eliminar":
                    practicaDAO.eliminarCliente(idcliente);
                    break;
            }

            response.sendRedirect("PRACTICA.jsp");
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format.");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred: " + e.getMessage());
    }
}
}
