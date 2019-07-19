package pe.com.bbva.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.com.bbva.interfaces.ClienteDaoImpl;
import pe.com.bbva.modelo.Cliente;

@WebServlet(name = "validarInicio", urlPatterns = {"/validarInicio"})
public class validarInicio extends HttpServlet {

    private ClienteDaoImpl clienteDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        
        clienteDao = new ClienteDaoImpl();
        
        Cliente cliente = new Cliente();
        cliente.setDni(usuario);
        cliente.setClave(pass);
        
        Cliente logueado = null;
        
        if (clienteDao.validarCliente(cliente) != null)
        {
            logueado = clienteDao.validarCliente(cliente);
            request.getSession().setAttribute("usuarioLogueado", logueado);
            //redirigir a menu principal
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }

}
