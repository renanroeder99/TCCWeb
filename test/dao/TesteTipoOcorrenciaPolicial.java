/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;
import model.TipoOcorrenciaPolicial;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Wanderson Ferreira 30/08/2017
 */
public class TesteTipoOcorrenciaPolicial {

    @Test
    public void testarCriacao() {
        Limpeza.truncateTabelas();
        TipoOcorrenciaPolicial tipoOcorrenciaPolicial = new TipoOcorrenciaPolicial();
        tipoOcorrenciaPolicial.setTipo("latrocinio");
        tipoOcorrenciaPolicial.setDescricao("Morte cerebral");

        int codigoInserido = TipoOcorrenciaPolicialDAO.inserir(tipoOcorrenciaPolicial);
        assertEquals(1, codigoInserido);

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        TipoOcorrenciaPolicial testeTipoOcorrenciaPolicial = new TipoOcorrenciaPolicial();

        testeTipoOcorrenciaPolicial.setTipo("latrocinio");
        testeTipoOcorrenciaPolicial.setDescricao("Morte cerebral");
        testeTipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.inserir(testeTipoOcorrenciaPolicial));

        assertEquals(1, testeTipoOcorrenciaPolicial.getId());

        testeTipoOcorrenciaPolicial.setTipo("homicidio");
        testeTipoOcorrenciaPolicial.setDescricao("tameintamein");

        testeTipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.alterar(testeTipoOcorrenciaPolicial));

        TipoOcorrenciaPolicial cadastroBD = TipoOcorrenciaPolicialDAO.buscarOPPorID(testeTipoOcorrenciaPolicial.getId());

        assertEquals(cadastroBD.getId(), testeTipoOcorrenciaPolicial.getId());

        assertEquals(cadastroBD.getTipo(), testeTipoOcorrenciaPolicial.getTipo());
        assertEquals(cadastroBD.getDescricao(), testeTipoOcorrenciaPolicial.getDescricao());

        assertNotEquals(0, testeTipoOcorrenciaPolicial.getId());

    }

}