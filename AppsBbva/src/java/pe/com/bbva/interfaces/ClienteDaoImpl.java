
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
        
        String sql = "select * from clientes where DNI = ? AND CLAVE = ? ";
        
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
        cliente.setId_cliente(rs.getInt("ID_CLIENTE"));
        cliente.setNombre(rs.getString("NOMBRE"));
        cliente.setDni(rs.getString("DNI"));
        cliente.setClave(rs.getString("CLAVE"));
        cliente.setTelefono(rs.getString("TELEFONO"));
        cliente.setEstado(rs.getString("ESTADO"));
        
        return cliente;
    }

    @Override
    public boolean registrarCliente(Cliente cliente) 
    {
        boolean salida = false;
        String sql = "insert into clientes (NOMBRE,DNI, clave, TELEFONO, ESTADO) values (?,?,?,?,?)";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getDni());
            ps.setString(3, cliente.getClave());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, "A");
            
            if (ps.executeUpdate() == 1)
            {
                salida = true;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClienteDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }

    @Override
    public Integer actualizarCliente(Cliente cliente) 
    {
        Integer actualizado = 0;
        
        String sql = "update clientes set nombre = ?, dni = ?, clave = ?, telefono = ? where id_cliente = ?";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getDni());
            ps.setString(3, cliente.getClave());
            ps.setString(4, cliente.getTelefono());
            ps.setInt(5, cliente.getId_cliente());
            
            if (ps.executeUpdate() == 1)
            {
                actualizado = 1;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClienteDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actualizado;
    }
    
}
