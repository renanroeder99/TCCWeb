package dao;

import database.Limpeza;
import model.BaseTipoOcorrencia;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Daiane Machado, date = 08/29/17
 */
public class TesteTipoOcorrenciaBombeiro {

    @Test
    public void testarCriacao() {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setTipo("tdxtrtrtrf");
        baseTipoOcorrencia.setDescricao("por ai");

        int codigoInserido = TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseTipoOcorrencia);
        assertEquals(1, codigoInserido);

    }

    @Test
    public void testarBuscarCBPorPorID() {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setTipo("wad");
        baseTipoOcorrencia.setDescricao("eeey5ty");
        baseTipoOcorrencia.setId(TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseTipoOcorrencia));
        
        assertEquals(1, baseTipoOcorrencia.getId());

        BaseTipoOcorrencia codigoInserido = TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(baseTipoOcorrencia.getId());

        assertEquals(baseTipoOcorrencia.getId(), codigoInserido.getId());
        assertEquals(baseTipoOcorrencia.getTipo(), codigoInserido.getTipo());
    }

    @Test
    public void testarAlterar() {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();

        baseTipoOcorrencia.setTipo("abc");
        baseTipoOcorrencia.setDescricao("por aqui");
        baseTipoOcorrencia.setId(TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseTipoOcorrencia));

        assertEquals(1, baseTipoOcorrencia.getId());

        baseTipoOcorrencia.setTipo("diferente");
        baseTipoOcorrencia.setDescricao("tambem");
        baseTipoOcorrencia.setId(TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseTipoOcorrencia));

        BaseTipoOcorrencia cadastroBD = TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(baseTipoOcorrencia.getId());

        assertEquals(cadastroBD.getId(), baseTipoOcorrencia.getId());
        assertEquals(cadastroBD.getTipo(), baseTipoOcorrencia.getTipo());
        assertEquals(cadastroBD.getDescricao(), baseTipoOcorrencia.getDescricao());

        assertNotEquals(0, baseTipoOcorrencia.getId());

    }
}
