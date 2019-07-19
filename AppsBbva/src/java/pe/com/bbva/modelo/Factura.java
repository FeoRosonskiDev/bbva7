package pe.com.bbva.modelo;

import java.sql.Date;

public class Factura {
    
    private int idCliente;
    private int idServicio;
    private double montopagar;
    private String fecha_emision;
    private String fecha_vencimiento;
    private String estado_pago;
    
    public double getMontopagar() {
        return montopagar;
    }

    public void setMontopagar(double montopagar) {
        this.montopagar = montopagar;
    }

    public Date getFecha_v() {
        return fecha_v;
    }

    public void setFecha_v(Date fecha_v) {
        this.fecha_v = fecha_v;
    }
    private Date fecha_v;

    public String getFecha_emision() {
        return fecha_emision;
    }

    public void setFecha_emision(String fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public String getEstado_pago() {
        return estado_pago;
    }

    public void setEstado_pago(String estado_pago) {
        this.estado_pago = estado_pago;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
    
}
