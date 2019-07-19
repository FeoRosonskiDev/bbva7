package pe.com.bbva.interfaces;

import java.util.List;
import pe.com.bbva.modelo.FacturasNoPagadas;

public interface DaoFactura {
    
    public List<FacturasNoPagadas> listarFacturasNoPagadas(int idCliente);
    
}
