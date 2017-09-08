/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;
import model.TipoOcorrenciaMedica;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author(Felipe de Jesus Cazagranda, date = 08-30-2017)
 */
public class TesteTipoOcorrenciaMedica {
    
    @Test
    public void testarCriacao () throws SQLException{
        Limpeza.truncateTabelas();
        TipoOcorrenciaMedica ocorrenciaMedica = new TipoOcorrenciaMedica();
        ocorrenciaMedica.setTipo("Infarto");
        ocorrenciaMedica.setDescricao("Blabla");
        
        int codigoInserido = TipoOcorrenciaMedicaDAO.inserir(ocorrenciaMedica);
        assertEquals(1, codigoInserido);
    }
    
    @Test
    public void testarBuscarTipoOcorrenciaMedicaPorID() throws SQLException{
        Limpeza.truncateTabelas();
        TipoOcorrenciaMedica ocorrenciaMedica = new TipoOcorrenciaMedica();
        ocorrenciaMedica.setTipo("Infarto");
        ocorrenciaMedica.setDescricao("Blabla");
        ocorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        
        assertEquals(1, ocorrenciaMedica.getId());
        
        TipoOcorrenciaMedica codigoInserido = TipoOcorrenciaMedicaDAO.buscarOMPorID(ocorrenciaMedica.getId());
        
        assertEquals(ocorrenciaMedica.getId(), codigoInserido.getId());
        assertEquals(ocorrenciaMedica.getTipo(), codigoInserido.getTipo());
        assertEquals(ocorrenciaMedica.getDescricao(), codigoInserido.getDescricao());
        
        
    }
    
    @Test
    public void testarAlterar() throws SQLException{
        Limpeza.truncateTabelas();
        TipoOcorrenciaMedica ocorrenciaMedica = new TipoOcorrenciaMedica();
        
        ocorrenciaMedica.setTipo("Infarto");
        ocorrenciaMedica.setDescricao("Blabla");
        ocorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        
        assertEquals(1, ocorrenciaMedica.getId());
        
        ocorrenciaMedica.setTipo("Derrame");
        ocorrenciaMedica.setDescricao("Blablabla");
        ocorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.alterar(ocorrenciaMedica));
        
        TipoOcorrenciaMedica cadastroBD = TipoOcorrenciaMedicaDAO.buscarOMPorID(ocorrenciaMedica.getId());
        
        assertEquals(cadastroBD.getId(), ocorrenciaMedica.getId());
        assertEquals(cadastroBD.getTipo(), ocorrenciaMedica.getTipo());
        assertEquals(cadastroBD.getDescricao(), ocorrenciaMedica.getDescricao());
        
        assertNotEquals(0, ocorrenciaMedica.getId());
        
    }
}
