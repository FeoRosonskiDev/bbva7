package pe.com.bbva.modelo;

public class Servicios {

    private int id_servicios;
    private int tipo;
    private double monto;
    private int estado;

    public int getId_servicios() {
        return id_servicios;
    }

    public void setId_servicios(int id_servicios) {
        this.id_servicios = id_servicios;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

}
