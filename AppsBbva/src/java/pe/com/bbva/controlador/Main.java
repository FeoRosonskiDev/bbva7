/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.bbva.controlador;

import java.sql.SQLException;
import pe.com.bbva.modelo.Conexion;

/**
 *
 * @author luchuyac
 */
public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Conexion.obtener();
    }
}
