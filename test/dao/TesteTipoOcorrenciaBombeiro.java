package dao;

import database.Limpeza;
import model.TipoOcorrenciaCorpoDeBombeiros;
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
        TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros = new TipoOcorrenciaCorpoDeBombeiros();
        corpoDeBombeiros.setTipo("tdxtrtrtrf");
        corpoDeBombeiros.setDescricao("por ai");

        int codigoInserido = TipoOcorrenciaCorpoDeBombeirosDAO.chamadoBombeiros(corpoDeBombeiros);
        assertEquals(1, codigoInserido);

    }

    @Test
    public void testarBuscarCBPorPorID() {
        Limpeza.truncateTabelas();
        TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros = new TipoOcorrenciaCorpoDeBombeiros();
        corpoDeBombeiros.setTipo("wad");
        corpoDeBombeiros.setDescricao("eeey5ty");
        corpoDeBombeiros.setId(TipoOcorrenciaCorpoDeBombeirosDAO.chamadoBombeiros(corpoDeBombeiros));
        
        assertEquals(1, corpoDeBombeiros.getId());

        TipoOcorrenciaCorpoDeBombeiros codigoInserido = TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(corpoDeBombeiros.getId());

        assertEquals(corpoDeBombeiros.getId(), codigoInserido.getId());
        assertEquals(corpoDeBombeiros.getTipo(), codigoInserido.getTipo());
    }

    @Test
    public void testarAlterar() {
        Limpeza.truncateTabelas();
        TipoOcorrenciaCorpoDeBombeiros corpoDeBombeiros = new TipoOcorrenciaCorpoDeBombeiros();

        corpoDeBombeiros.setTipo("abc");
        corpoDeBombeiros.setDescricao("por aqui");
        corpoDeBombeiros.setId(TipoOcorrenciaCorpoDeBombeirosDAO.chamadoBombeiros(corpoDeBombeiros));

        assertEquals(1, corpoDeBombeiros.getId());
        
        corpoDeBombeiros.setTipo("diferente");
        corpoDeBombeiros.setDescricao("tambem");
        corpoDeBombeiros.setId(TipoOcorrenciaCorpoDeBombeirosDAO.chamadoBombeiros(corpoDeBombeiros));

        TipoOcorrenciaCorpoDeBombeiros cadastroBD = TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(corpoDeBombeiros.getId());

        assertEquals(cadastroBD.getId(), corpoDeBombeiros.getId());
        assertEquals(cadastroBD.getTipo(), corpoDeBombeiros.getTipo());
        assertEquals(cadastroBD.getDescricao(), corpoDeBombeiros.getDescricao());

        assertNotEquals(0, corpoDeBombeiros.getId());

    }
}
