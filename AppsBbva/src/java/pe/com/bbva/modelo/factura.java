/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.bbva.modelo;

import java.sql.Date;

/**
 *
 * @author luchuyac
 */
public class factura {
    
    Cliente cliente;
    Servicio servicio;
    private double montopagar;
    private Date fecha_e;
    private int estado_pago;

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public double getMontopagar() {
        return montopagar;
    }

    public void setMontopagar(double montopagar) {
        this.montopagar = montopagar;
    }

    public Date getFecha_e() {
        return fecha_e;
    }

    public void setFecha_e(Date fecha_e) {
        this.fecha_e = fecha_e;
    }

    public int getEstado_pago() {
        return estado_pago;
    }

    public void setEstado_pago(int estado_pago) {
        this.estado_pago = estado_pago;
    }

    public Date getFecha_v() {
        return fecha_v;
    }

    public void setFecha_v(Date fecha_v) {
        this.fecha_v = fecha_v;
    }
    private Date fecha_v;
    
}
