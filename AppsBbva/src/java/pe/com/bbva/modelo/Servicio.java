/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.bbva.modelo;

/**
 *
 * @author luchuyac
 */
public class Servicio {
    
    private int id_servicio;
    Proveedor proveedor;
    private int e_servicio;
    TipoServicio tipo;
    private int identificador;

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public int getE_servicio() {
        return e_servicio;
    }

    public void setE_servicio(int e_servicio) {
        this.e_servicio = e_servicio;
    }

    public TipoServicio getTipo() {
        return tipo;
    }

    public void setTipo(TipoServicio tipo) {
        this.tipo = tipo;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }
   
    

    
} 