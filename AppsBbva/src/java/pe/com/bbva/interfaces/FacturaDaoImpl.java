package pe.com.bbva.interfaces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.com.bbva.modelo.Conexion;
import pe.com.bbva.modelo.FacturasNoPagadas;

public class FacturaDaoImpl implements DaoFactura {

    private Connection cn;
    private PreparedStatement ps;
    
    @Override
    public List<FacturasNoPagadas> listarFacturasNoPagadas(int idCliente) 
    {
        List<FacturasNoPagadas> facturas = new ArrayList<>();

        String sql = "select C.NOMBRE, TS.DESCRIPCION, F.MONTOPAGO, F.FECHAEMISION, F.FECHAVECIMIENTO, F.ESTADOFACTURA, P.RAZONSOCIAL, S.IDENTIFICADOR from factura F \n"
                + "inner join clientes C on F.IDCLIENTE = C.IDCLIENTE \n"
                + "INNER JOIN SERVICIO S ON S.IDSERVICIO = F.IDSERVICIO \n"
                + "INNER JOIN TIPOSERVICIO TS ON TS.IDTIPOSERVICIO = S.IDTIPOSERVICIO \n"
                + "INNER JOIN proveedor P ON P.IDPROVEEDOR = S.IDPROVEEDOR WHERE C.IDCLIENTE = ? AND F.ESTADOFACTURA = 'D'";
        
        try {
            cn = Conexion.obtener();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                FacturasNoPagadas f = new FacturasNoPagadas();
                f.setNombreCliente(rs.getString("nombre"));
                f.setServicio(rs.getString("descripcion"));
                f.setMontoPago(rs.getDouble("montopago"));
                f.setFechaEmision(rs.getString("fechaemision"));
                f.setFechaVencimiento(rs.getString("fechavecimiento"));
                f.setEstadoFactura(rs.getString("estadofactura"));
                f.setProveedor(rs.getString("razonsocial"));
                f.setIdentificador(rs.getString("identificador"));
                
                facturas.add(f);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FacturaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return facturas;
    }
}
