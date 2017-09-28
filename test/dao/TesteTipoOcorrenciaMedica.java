/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;

import model.BaseTipoOcorrencia;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author(Felipe de Jesus Cazagranda, date = 09-14-2017)
 */
public class TesteTipoOcorrenciaMedica {
    
    @Test
    public void testarCriacao () throws SQLException{
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setTipo("Infarto");

        int codigoInserido = TipoOcorrenciaMedicaDAO.inserir(baseTipoOcorrencia);
        assertEquals(1, codigoInserido);
    }
    
    @Test
    public void testarBuscarTipoOcorrenciaMedicaPorID() throws SQLException{
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia ocorrenciaMedica = new BaseTipoOcorrencia();
        ocorrenciaMedica.setTipo("Infarto");
        ocorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        
        assertEquals(1, ocorrenciaMedica.getId());

        BaseTipoOcorrencia codigoInserido = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(ocorrenciaMedica.getId());

        assertEquals(ocorrenciaMedica.getId(), codigoInserido.getId());
        assertEquals(ocorrenciaMedica.getTipo(), codigoInserido.getTipo());

        
    }
    
    @Test
    public void testarAlterar() throws SQLException{
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();

        baseTipoOcorrencia.setTipo("Infarto");
        baseTipoOcorrencia.setId(TipoOcorrenciaMedicaDAO.inserir(baseTipoOcorrencia));
        
        assertEquals(1, baseTipoOcorrencia.getId());

        baseTipoOcorrencia.setTipo("Derrame");
        baseTipoOcorrencia.setId(TipoOcorrenciaMedicaDAO.alterar(baseTipoOcorrencia));
        
        BaseTipoOcorrencia cadastroBD = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(baseTipoOcorrencia.getId());
        
        assertEquals(cadastroBD.getId(), baseTipoOcorrencia.getId());
        assertEquals(cadastroBD.getTipo(), baseTipoOcorrencia.getTipo());

        assertNotEquals(0, baseTipoOcorrencia.getId());
        
    }
}
