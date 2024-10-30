/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author amali
 */
import DAO.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        // Crear una instancia de UsuarioDAO
        usuarioDAO = new UsuarioDAO();  // UsuarioDAO ya se encarga de la conexión
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String usuario = request.getParameter("username");
        String contrasena = request.getParameter("password");

        // Verificar las credenciales usando el DAO
        String resultado = usuarioDAO.validarUsuario(usuario, contrasena);

        // Redirigir según el tipo de usuario
        if ("Empleado".equals(resultado)) {
            // Redirigir a la página de empleado
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect("empleado.jsp");
        } else if ("Administrador".equals(resultado)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect("Welcome.jsp");
        } else {
            // Redirigir a la página de error o mostrar mensaje
            request.setAttribute("mensaje", resultado);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}


