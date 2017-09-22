/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;

import model.BaseOcorrencia;
import model.BaseTipoOcorrencia;
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

        BaseTipoOcorrencia tipoOcorrenciaPolicial = new BaseTipoOcorrencia();
        tipoOcorrenciaPolicial.setTipo("Latrocinio");
        tipoOcorrenciaPolicial.setDescricao("Morte cerebral");
        tipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.inserir(tipoOcorrenciaPolicial));
        assertEquals(1, tipoOcorrenciaPolicial.getId());

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep(89070-730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));
        assertEquals(1, emissor.getId());

        BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();
        ocorrenciaPolicial.setCep(145444);
        ocorrenciaPolicial.setNumeroResidencia(1004);
        ocorrenciaPolicial.setRua("Pqp ");

        ocorrenciaPolicial.setBaseTipoOcorrencia(tipoOcorrenciaPolicial);
        ocorrenciaPolicial.setEmissor(emissor);
        ocorrenciaPolicial.setId(OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial));

        assertEquals(1, ocorrenciaPolicial.getId());

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia tipoOcorrenciaPolicial = new BaseTipoOcorrencia();
        tipoOcorrenciaPolicial.setTipo("latrocinio");
        tipoOcorrenciaPolicial.setDescricao("Morte cerebral");
        tipoOcorrenciaPolicial.setId(TipoOcorrenciaPolicialDAO.inserir(tipoOcorrenciaPolicial));

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("12345678");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep(89070730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setTrote(0);
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();
        ocorrenciaPolicial.setEmissor(emissor);
        ocorrenciaPolicial.setBaseTipoOcorrencia(tipoOcorrenciaPolicial);
        ocorrenciaPolicial.setCep(14587444);
        ocorrenciaPolicial.setNumeroResidencia(1004);
        ocorrenciaPolicial.setRua("Pqp ");
        ocorrenciaPolicial.setId(OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial));
        assertEquals(1, ocorrenciaPolicial.getId());

        ocorrenciaPolicial.setCep(12345678);
        ocorrenciaPolicial.setNumeroResidencia(291);
        ocorrenciaPolicial.setRua("Rua das Velhas com Cabelos Laranjas");
        OcorrenciaPolicialDAO.alterar(ocorrenciaPolicial);

        BaseOcorrencia ocorrenciaPolicialBuscada = OcorrenciaPolicialDAO.buscarOcorrenciaPolicialPorID(ocorrenciaPolicial.getId());

        assertEquals(ocorrenciaPolicialBuscada.getBaseTipoOcorrencia().getId(), ocorrenciaPolicial.getBaseTipoOcorrencia().getId());
        assertEquals(ocorrenciaPolicialBuscada.getEmissor().getId(), ocorrenciaPolicial.getEmissor().getId());
        assertEquals(ocorrenciaPolicialBuscada.getCep(), ocorrenciaPolicial.getCep());
        assertEquals(ocorrenciaPolicialBuscada.getNumeroResidencia(), ocorrenciaPolicial.getNumeroResidencia());
        assertEquals(ocorrenciaPolicialBuscada.getRua(), ocorrenciaPolicial.getRua());

    }

}