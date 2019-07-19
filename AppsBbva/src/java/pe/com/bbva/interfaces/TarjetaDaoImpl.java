package pe.com.bbva.interfaces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.com.bbva.modelo.Conexion;

public class TarjetaDaoImpl implements DaoTarjeta{
    
    private Connection cn;
    private PreparedStatement ps;

    @Override
    public double restarSaldo(int idTarjeta, int idFactura)
    {
        double monto = averiguarMonto(idFactura);
        double saldo = averiguarSaldo(idTarjeta);
        double resto = saldo - monto;
        
        String sql = "update tarjeta set saldo = ? where idTarjeta = ?";
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setDouble(1, resto);
            ps.setInt(2, idTarjeta);
            if(ps.executeUpdate() == 1)
            {
                return resto;
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(TarjetaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resto;
    }

    @Override
    public double averiguarMonto(int idFactura) 
    {
        double monto = 0;
        String sql = "select montopago from factura where idFactura = ?";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idFactura);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                monto = rs.getDouble("montopago");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(TarjetaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monto;
    }

    @Override
    public double averiguarSaldo(int idTarjeta) 
    {
        double saldo = 0;
        String sql = "select saldo from tarjeta where idTarjeta = ?";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idTarjeta);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                saldo = rs.getDouble("saldo");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(TarjetaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saldo;
    }
    
}
