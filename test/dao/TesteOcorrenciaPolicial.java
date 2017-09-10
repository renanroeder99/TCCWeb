/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;
import model.Emissor;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Wanderson Ferreira 
 */
public class TesteOcorrenciaPolicial {

    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();

        TipoOcorrenciaPolicial tipoOcorrenciaPolicial = new TipoOcorrenciaPolicial();
        tipoOcorrenciaPolicial.setTipo("latrocinio");
        tipoOcorrenciaPolicial.setDescricao("Morte cerebral");
        tipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.inserir(tipoOcorrenciaPolicial));

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep("89070-730");
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));

        OcorrenciaPolicial ocorrenciaPolicial = new OcorrenciaPolicial();
        ocorrenciaPolicial.setCep(145444);
        ocorrenciaPolicial.setNumeroResidencia(1004);
        ocorrenciaPolicial.setRua("Pqp ");
        ocorrenciaPolicial.setLogradouro("casa");

        ocorrenciaPolicial.setTipoOcorrenciaPolicial(tipoOcorrenciaPolicial);
        ocorrenciaPolicial.setEmissor(emissor);
        ocorrenciaPolicial.setId(OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial));
        assertEquals(1, ocorrenciaPolicial.getId());

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        TipoOcorrenciaPolicial tipoOcorrenciaPolicial = new TipoOcorrenciaPolicial();
        tipoOcorrenciaPolicial.setTipo("latrocinio");
        tipoOcorrenciaPolicial.setDescricao("Morte cerebral");
        tipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.inserir(tipoOcorrenciaPolicial));

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep("89070-730");
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));

        OcorrenciaPolicial ocorrenciaPolicial = new OcorrenciaPolicial();
        ocorrenciaPolicial.setEmissor(emissor);
        ocorrenciaPolicial.setTipoOcorrenciaPolicial(tipoOcorrenciaPolicial);
        ocorrenciaPolicial.setCep(145444);
        ocorrenciaPolicial.setNumeroResidencia(1004);
        ocorrenciaPolicial.setRua("Pqp ");
        ocorrenciaPolicial.setLogradouro("casa");
        ocorrenciaPolicial.setId(OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial));
        assertEquals(1, ocorrenciaPolicial.getId());

        ocorrenciaPolicial.setCep(12345678);
        ocorrenciaPolicial.setNumeroResidencia(291);
        ocorrenciaPolicial.setRua("Rua das Velhas com Cabelos Laranjas");
        ocorrenciaPolicial.setLogradouro("");
        OcorrenciaPolicialDAO.alterar(ocorrenciaPolicial);

        OcorrenciaPolicial ocorrenciaPolicialBuscada = OcorrenciaPolicialDAO.buscarOcorrenciaPolicialPorID(ocorrenciaPolicial.getId());

        assertEquals(ocorrenciaPolicialBuscada.getTipoOcorrenciaPolicial().getTipo(), ocorrenciaPolicial.getTipoOcorrenciaPolicial().getTipo());
        assertEquals(ocorrenciaPolicialBuscada.getTipoOcorrenciaPolicial().getDescricao(), ocorrenciaPolicial.getTipoOcorrenciaPolicial().getDescricao());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getNome(), ocorrenciaPolicial.getEmissor().getNome());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getUsuario(), ocorrenciaPolicial.getEmissor().getUsuario());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getEmail(), ocorrenciaPolicial.getEmissor().getEmail());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getSenha(), ocorrenciaPolicial.getEmissor().getSenha());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getCpf(), ocorrenciaPolicial.getEmissor().getCpf());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getRg(), ocorrenciaPolicial.getEmissor().getRg());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getEndereco(), ocorrenciaPolicial.getEmissor().getEndereco());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getCep(), ocorrenciaPolicial.getEmissor().getCep());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getTelefone(), ocorrenciaPolicial.getEmissor().getTelefone());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getTrote(), ocorrenciaPolicial.getEmissor().getTrote());

        assertEquals(ocorrenciaPolicialBuscada.getCep(), ocorrenciaPolicial.getCep());
        assertEquals(ocorrenciaPolicialBuscada.getNumeroResidencia(), ocorrenciaPolicial.getNumeroResidencia());
        assertEquals(ocorrenciaPolicialBuscada.getRua(), ocorrenciaPolicial.getRua());
        assertEquals(ocorrenciaPolicialBuscada.getLogradouro(), ocorrenciaPolicial.getLogradouro());
        assertNotEquals(0, emissor.getId());

    }

}