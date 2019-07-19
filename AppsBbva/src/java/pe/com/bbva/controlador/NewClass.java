/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.bbva.controlador;

import static java.lang.System.out;
import java.util.List;
import pe.com.bbva.interfaces.FacturaDaoImpl;
import pe.com.bbva.modelo.FacturasNoPagadas;

/**
 *
 * @author ASUS
 */
public class NewClass {
    public static void main(String[] args) {
        FacturaDaoImpl dao = new FacturaDaoImpl();
        
        List<FacturasNoPagadas> lista = dao.listarFacturasNoPagadas(1);
        for(FacturasNoPagadas f : lista)
        {
           System.out.println(f.getServicio());
        }

    }
}
