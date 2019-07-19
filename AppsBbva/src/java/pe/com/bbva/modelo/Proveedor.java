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
public class Proveedor {
    
    private int id_proveedor;
    private int razon;
    Servicio ser;
    
    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public int getRazon() {
        return razon;
    }

    public void setRazon(int razon) {
        this.razon = razon;
    }

    public Servicio getSer() {
        return ser;
    }

    public void setSer(Servicio ser) {
        this.ser = ser;
    }
    
}
