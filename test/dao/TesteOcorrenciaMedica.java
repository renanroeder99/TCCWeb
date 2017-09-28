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
 * @author(Felipe de Jesus Cazagranda, date = 09-14-2017)
 *
 */
public class TesteOcorrenciaMedica {
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();

        BaseTipoOcorrencia tipoOcorrenciaMedica = new BaseTipoOcorrencia();
        tipoOcorrenciaMedica.setTipo("avc");
        tipoOcorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(tipoOcorrenciaMedica));
        assertEquals(1, tipoOcorrenciaMedica.getId());

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep(89070730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaMedica = new BaseOcorrencia();
        ocorrenciaMedica.setCep(145444);
        ocorrenciaMedica.setNumeroResidencia(1004);
        ocorrenciaMedica.setRua("Pqp ");

        ocorrenciaMedica.setBaseTipoOcorrencia(tipoOcorrenciaMedica);
        ocorrenciaMedica.setEmissor(emissor);
        ocorrenciaMedica.setId(OcorrenciaMedicaDAO.inserir(ocorrenciaMedica));

        assertEquals(1, ocorrenciaMedica.getId());

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia tipoOcorrenciaMedica = new BaseTipoOcorrencia();
        tipoOcorrenciaMedica.setTipo("latrocinio");
        tipoOcorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(tipoOcorrenciaMedica));

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep(89070730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaMedica = new BaseOcorrencia();
        ocorrenciaMedica.setEmissor(emissor);
        ocorrenciaMedica.setBaseTipoOcorrencia(tipoOcorrenciaMedica);
        ocorrenciaMedica.setCep(145444);
        ocorrenciaMedica.setNumeroResidencia(1004);
        ocorrenciaMedica.setRua("Pqp ");
        ocorrenciaMedica.setId(OcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        assertEquals(1, ocorrenciaMedica.getId());

        ocorrenciaMedica.setCep(12345678);
        ocorrenciaMedica.setNumeroResidencia(291);
        ocorrenciaMedica.setRua("Rua das Velhas com Cabelos Laranjas");
        OcorrenciaMedicaDAO.alterar(ocorrenciaMedica);

        BaseOcorrencia ocorrenciaMedicaBuscada = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(ocorrenciaMedica.getId());

        assertEquals(ocorrenciaMedicaBuscada.getBaseTipoOcorrencia().getId(), ocorrenciaMedica.getBaseTipoOcorrencia().getId());

        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getId(), ocorrenciaMedica.getEmissor().getId());

        assertEquals(ocorrenciaMedicaBuscada.getCep(), ocorrenciaMedica.getCep());
        assertEquals(ocorrenciaMedicaBuscada.getNumeroResidencia(), ocorrenciaMedica.getNumeroResidencia());
        assertEquals(ocorrenciaMedicaBuscada.getRua(), ocorrenciaMedica.getRua());
    }
}