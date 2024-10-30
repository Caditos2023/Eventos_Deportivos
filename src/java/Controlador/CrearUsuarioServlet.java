package Controlador;

import DAO.EmpleadoDAO;
import Modelo.Empleado;
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

@WebServlet("/CrearUsuarios")
public class CrearUsuarioServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpleadoDAO empleadosDAO;
        List<Empleado> listaEmpleados;
        
        // Obtén la acción del formulario, si existe
        String action = request.getParameter("action");
        
        try {
            empleadosDAO = new EmpleadoDAO();
            
            // Si la acción es guardar, procesa el formulario
            if ("guardar".equals(action)) {
                String usuario = request.getParameter("username");
                String contrasena = request.getParameter("password");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                int iddocumentacion = Integer.parseInt("tipoDocumento");
                String documento = request.getParameter("documento");
                boolean estado = request.getParameter("estado").equals("1"); // Convertir a boolean
                boolean permisos = request.getParameter("permiso").equals("1"); // Convertir a boolean
                
                // Llama al DAO para guardar el nuevo usuario
                empleadosDAO.guardarEmpleado(usuario, contrasena, nombre, apellido, direccion, iddocumentacion, documento, estado, permisos);
            }
            
            // Carga la lista de empleados para mostrar en la tabla
            listaEmpleados = empleadosDAO.getEmpleado_estado();
            request.setAttribute("listaEmpleados", listaEmpleados); // Pasamos la lista al JSP
            request.getRequestDispatcher("crear_usuarios.jsp").forward(request, response); // Redirigir al JSP
            
        } catch (SQLException ex) {
            Logger.getLogger(CrearUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CrearUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
