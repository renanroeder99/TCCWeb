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
        baseOcorrencia.setDescricao("grtgtrgrt");
        baseOcorrencia.setId(554);
        baseOcorrencia.setTipo("rtjgrg");

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
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia baseOcorrenciaCorpoDeBombeiros = new BaseOcorrencia();
        baseOcorrenciaCorpoDeBombeiros.setCep(789654142);
        baseOcorrenciaCorpoDeBombeiros.setNumeroResidencia(789);
        baseOcorrenciaCorpoDeBombeiros.setRua("shfefhre");
        baseOcorrenciaCorpoDeBombeiros.setLogradouro("erergeth");
        baseOcorrenciaCorpoDeBombeiros.setBaseTipoOcorrencia(baseOcorrencia);
        baseOcorrenciaCorpoDeBombeiros.setEmissor(emissor);
        baseOcorrenciaCorpoDeBombeiros.setId(OcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrenciaCorpoDeBombeiros));
        assertEquals(1, baseOcorrenciaCorpoDeBombeiros);

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia baseOcorrencia = new BaseTipoOcorrencia();
        baseOcorrencia.setDescricao("fhwqrf");
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
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaCorpoDeBombeiros = new BaseOcorrencia();
        ocorrenciaCorpoDeBombeiros.setEmissor(emissor);
        ocorrenciaCorpoDeBombeiros.setBaseTipoOcorrencia(baseOcorrencia);
        ocorrenciaCorpoDeBombeiros.setCep(7896541);
        ocorrenciaCorpoDeBombeiros.setNumeroResidencia(789);
        ocorrenciaCorpoDeBombeiros.setRua("uihjjfiw");
        ocorrenciaCorpoDeBombeiros.setLogradouro("rferge");
        ocorrenciaCorpoDeBombeiros.setId(OcorrenciaCorpoDeBombeirosDAO.inserir(ocorrenciaCorpoDeBombeiros));

        BaseOcorrencia ocorrenciaCorpoDeBombeirosBuscada = OcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaBombeiroPorId(ocorrenciaCorpoDeBombeiros.getId());

        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getBaseTipoOcorrencia().getTipo(), ocorrenciaCorpoDeBombeiros.getBaseTipoOcorrencia().getTipo());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getBaseTipoOcorrencia().getDescricao(), ocorrenciaCorpoDeBombeiros.getBaseTipoOcorrencia().getDescricao());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getNome(), ocorrenciaCorpoDeBombeiros.getEmissor().getNome());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getUsuario(), ocorrenciaCorpoDeBombeiros.getEmissor().getUsuario());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getEmail(), ocorrenciaCorpoDeBombeiros.getEmissor().getEmail());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getSenha(), ocorrenciaCorpoDeBombeiros.getEmissor().getSenha());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getCpf(), ocorrenciaCorpoDeBombeiros.getEmissor().getCpf());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getRg(), ocorrenciaCorpoDeBombeiros.getEmissor().getRg());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getEndereco(), ocorrenciaCorpoDeBombeiros.getEmissor().getEndereco());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getCep(), ocorrenciaCorpoDeBombeiros.getCep());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getTelefone(), ocorrenciaCorpoDeBombeiros.getEmissor().getTelefone());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getEmissor().getTrote(), ocorrenciaCorpoDeBombeiros.getEmissor().getTrote());

        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getCep(), ocorrenciaCorpoDeBombeiros.getCep());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getNumeroResidencia(), ocorrenciaCorpoDeBombeiros.getNumeroResidencia());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getRua(), ocorrenciaCorpoDeBombeiros.getRua());
        assertEquals(ocorrenciaCorpoDeBombeirosBuscada.getLogradouro(), ocorrenciaCorpoDeBombeiros.getLogradouro());
        assertNotEquals(0, emissor.getId());

    }
}

