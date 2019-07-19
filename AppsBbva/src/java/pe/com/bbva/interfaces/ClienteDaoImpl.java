
package pe.com.bbva.interfaces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.com.bbva.modelo.Cliente;
import pe.com.bbva.modelo.Conexion;

public class ClienteDaoImpl implements DAOcliente{
    
    private Connection cn;
    private PreparedStatement ps;

    @Override
    public Cliente validarCliente(Cliente cliente)  {
        
        Cliente cl = null;
        
        String sql = "select * clientes where DNI = ? AND CLAVE = ?";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cliente.getDni());
            ps.setString(2, cliente.getClave());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                cl = cargarDatos(rs);
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClienteDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cl;
    }
    
    private Cliente cargarDatos(ResultSet rs) throws SQLException
    {
        Cliente cliente = new Cliente();
        cliente.setId_cliente(rs.getInt("ID"));
        cliente.setNombre(rs.getString("NOMBRE"));
        cliente.setDni(rs.getString("DNI"));
        cliente.setClave(rs.getString("CLAVE"));
        cliente.setTelefono(rs.getString("TELEFONO"));
        cliente.setEstado(rs.getString("ESTADO"));
        
        return cliente;
    }
    
}
