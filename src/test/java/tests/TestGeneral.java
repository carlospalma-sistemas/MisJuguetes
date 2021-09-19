/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import logica.Juguete;
import org.testng.Assert;
import org.testng.annotations.Ignore;
import org.testng.annotations.Test;
import persistencia.ConexionBD;
import persistencia.JugueteDAO;

/**
 *
 * @author Cielo Juliana
 */
public class TestGeneral {
    
    @Ignore
    public void verificarConexion() {
        ConexionBD con = new ConexionBD();
        Assert.assertTrue(con.isConectado(), "No hay conexión creada. ");
        con.desconectar();
        Assert.assertFalse(con.isConectado(), "No se cerró conexión. ");
    }
    
    @Ignore
    public void verificarCargaJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        Assert.assertTrue(dao.consultarJuguetes().size() > 0, "No se cargaron datos de juguetes. ");
    }
    
    @Test
    public void verificarCargaTiposJuguetes() {
        JugueteDAO dao = new JugueteDAO();
        Assert.assertTrue(dao.cargarTiposJuguetes().size() > 0, "No se cargaron datos de los tipos de juguetes. ");
    }
    
    @Test
    public void verificarInsercionJuguete() {
        JugueteDAO dao = new JugueteDAO();
        Juguete j = new Juguete("Juguete de prueba", 1, "2021-01-01", 1, "Disponible");
        int id = dao.guardarNuevoJuguete(j);
        Assert.assertTrue(id > 0, "No se guardó dato de un juguete. ");
        String sql = "DELETE FROM juguetes WHERE id = " + id;
        ConexionBD con = new ConexionBD();
        int cant = con.ejecutarUpdate(sql);
        Assert.assertTrue(cant == 1, "No se logró hacer limpieza del dato de prueba de un juguete ingresado. ");
        con.desconectar();
    }
}
