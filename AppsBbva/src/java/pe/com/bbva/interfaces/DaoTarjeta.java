package pe.com.bbva.interfaces;

public interface DaoTarjeta {
    
    public double restarSaldo(int idTarjeta, int idFactura);
    
    public double averiguarMonto(int idFactura);
    
    public double averiguarSaldo(int idTarjeta);
}
