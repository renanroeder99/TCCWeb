/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;

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
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setTipo("Infarto");
        baseTipoOcorrencia.setDescricao("Blabla");
        
        int codigoInserido = TipoOcorrenciaMedicaDAO.inserir(baseTipoOcorrencia);
        assertEquals(1, codigoInserido);
    }
    
    @Test
    public void testarBuscarTipoOcorrenciaMedicaPorID() throws SQLException{
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        ocorrenciaMedica.setTipo("Infarto");
        ocorrenciaMedica.setDescricao("Blabla");
        ocorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        
        assertEquals(1, ocorrenciaMedica.getId());

        BaseTipoOcorrencia codigoInserido = TipoOcorrenciaMedicaDAO.buscarOMPorID(baseTipoOcorrencia.getId());

        assertEquals(baseTipoOcorrencia.getId(), codigoInserido.getId());
        assertEquals(baseTipoOcorrencia.getTipo(), codigoInserido.getTipo());
        assertEquals(baseTipoOcorrencia.getDescricao(), codigoInserido.getDescricao());
        
        
    }
    
    @Test
    public void testarAlterar() throws SQLException{
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();

        baseTipoOcorrencia.setTipo("Infarto");
        baseTipoOcorrencia.setDescricao("Blabla");
        baseTipoOcorrencia.setId(TipoOcorrenciaMedicaDAO.inserir(baseTipoOcorrencia));
        
        assertEquals(1, baseTipoOcorrencia.getId());

        baseTipoOcorrencia.setTipo("Derrame");
        baseTipoOcorrencia.setDescricao("Blablabla");
        baseTipoOcorrencia.setId(TipoOcorrenciaMedicaDAO.alterar(baseTipoOcorrencia));
        
        TipoOcorrenciaMedica cadastroBD = TipoOcorrenciaMedicaDAO.buscarOMPorID(baseTipoOcorrencia.getId());
        
        assertEquals(cadastroBD.getId(), baseTipoOcorrencia.getId());
        assertEquals(cadastroBD.getTipo(), baseTipoOcorrencia.getTipo());
        assertEquals(cadastroBD.getDescricao(), baseTipoOcorrencia.getDescricao());
        
        assertNotEquals(0, baseTipoOcorrencia.getId());
        
    }
}
