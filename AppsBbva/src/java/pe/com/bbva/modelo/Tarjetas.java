package pe.com.bbva.modelo;

/**
 *
 * @author luchuyac
 */
public class Tarjetas {
    
     private int id_tarjetas;
     private int tipo;
     private int estado;
     private int numero;
     
     
    public int getId_cuentas() {
        return id_tarjetas;
    }

    public void setId_cuentas(int id_cuentas) {
        this.id_tarjetas = id_cuentas;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
}
