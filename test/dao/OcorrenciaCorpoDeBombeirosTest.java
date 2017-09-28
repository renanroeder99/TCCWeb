package dao;

import database.Limpeza;
import model.BaseOcorrencia;
import model.BaseTipoOcorrencia;
import model.Emissor;
import org.junit.Test;
import sun.misc.BASE64Decoder;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class OcorrenciaCorpoDeBombeirosTest {
    @Test

    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseOcorrencia = new BaseTipoOcorrencia();

        baseOcorrencia.setTipo("rtjgrg");
        baseOcorrencia.setId(TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrencia));

        Emissor emissor = new Emissor();
        emissor.setNome("Daiane Machado");
        emissor.setUsuario("daianemachado");
        emissor.setEmail("daianemachado@gmail.com");
        emissor.setSenha("789654");
        emissor.setCpf("789520145654");
        emissor.setRg(Integer.parseInt("741025"));
        emissor.setEndereco("fijfijfjfi");
        emissor.setCep(74102365);
        emissor.setTelefone(Integer.parseInt("965874102"));
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia baseOcorrenciaCorpoDeBombeiros = new BaseOcorrencia();
        baseOcorrenciaCorpoDeBombeiros.setCep(789654142);
        baseOcorrenciaCorpoDeBombeiros.setNumeroResidencia(789);
        baseOcorrenciaCorpoDeBombeiros.setRua("shfefhre");
        baseOcorrenciaCorpoDeBombeiros.setBaseTipoOcorrencia(baseOcorrencia);
        baseOcorrenciaCorpoDeBombeiros.setEmissor(emissor);
        baseOcorrenciaCorpoDeBombeiros.setId(OcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrenciaCorpoDeBombeiros));
        assertEquals(1, baseOcorrenciaCorpoDeBombeiros.getId());

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseOcorrencia = new BaseTipoOcorrencia();
        baseOcorrencia.setTipo("ertsfw");
        baseOcorrencia.setId(TipoOcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrencia));

        Emissor emissor = new Emissor();
        emissor.setNome("Daiane Machado");
        emissor.setUsuario("daianemachado");
        emissor.setEmail("daianemachado@gmail.com");
        emissor.setSenha("789654");
        emissor.setCpf("789520145654");
        emissor.setRg(Integer.parseInt("741025"));
        emissor.setEndereco("fijfijfjfi");
        emissor.setCep(74102365);
        emissor.setTelefone(Integer.parseInt("965874102"));
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaCorpoDeBombeiros = new BaseOcorrencia();
        ocorrenciaCorpoDeBombeiros.setEmissor(emissor);
        ocorrenciaCorpoDeBombeiros.setBaseTipoOcorrencia(baseOcorrencia);
        ocorrenciaCorpoDeBombeiros.setCep(7896541);
        ocorrenciaCorpoDeBombeiros.setNumeroResidencia(789);
        ocorrenciaCorpoDeBombeiros.setRua("uihjjfiw");
        ocorrenciaCorpoDeBombeiros.setId(OcorrenciaCorpoDeBombeirosDAO.inserir(ocorrenciaCorpoDeBombeiros));


        BaseOcorrencia ocorrenciaCorpoDeBombeirosBuscada = OcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaBombeiroPorId(ocorrenciaCorpoDeBombeiros.getId());

        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getBaseTipoOcorrencia().getId(), ocorrenciaCorpoDeBombeiros.getBaseTipoOcorrencia().getId());

        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getId(), ocorrenciaCorpoDeBombeiros.getEmissor().getId());

        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getCep(), ocorrenciaCorpoDeBombeiros.getCep());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getNumeroResidencia(), ocorrenciaCorpoDeBombeiros.getNumeroResidencia());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getRua(), ocorrenciaCorpoDeBombeiros.getRua());
        assertNotEquals(0, emissor.getId());

    }
}

