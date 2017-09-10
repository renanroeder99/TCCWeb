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
 * @author Renan Roeder, 09-08-2017
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

        TipoOcorrenciaMedica tipoOcorrenciaMedica = new TipoOcorrenciaMedica();
        tipoOcorrenciaMedica.setTipo("avc");
        tipoOcorrenciaMedica.setDescricao("Morte cerebral");
        tipoOcorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(tipoOcorrenciaMedica));

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

        OcorrenciaMedica ocorrenciaMedica = new OcorrenciaMedica();
        ocorrenciaMedica.setCep(145444);
        ocorrenciaMedica.setNumeroResidencia(1004);
        ocorrenciaMedica.setRua("Pqp ");
        ocorrenciaMedica.setLogradouro("casa");

        ocorrenciaMedica.setTipoOcorrenciaMedica(tipoOcorrenciaMedica);
        ocorrenciaMedica.setEmissor(emissor);
        ocorrenciaMedica.setId(OcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        assertEquals(1, ocorrenciaMedica.getId());

    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        TipoOcorrenciaMedica tipoOcorrenciaMedica = new TipoOcorrenciaMedica();
        tipoOcorrenciaMedica.setTipo("latrocinio");
        tipoOcorrenciaMedica.setDescricao("Morte cerebral");
        tipoOcorrenciaMedica.setId(TipoOcorrenciaMedicaDAO.inserir(tipoOcorrenciaMedica));

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

        OcorrenciaMedica ocorrenciaMedica = new OcorrenciaMedica();
        ocorrenciaMedica.setEmissor(emissor);
        ocorrenciaMedica.setTipoOcorrenciaMedica(tipoOcorrenciaMedica);
        ocorrenciaMedica.setCep(145444);
        ocorrenciaMedica.setNumeroResidencia(1004);
        ocorrenciaMedica.setRua("Pqp ");
        ocorrenciaMedica.setLogradouro("casa");
        ocorrenciaMedica.setId(OcorrenciaMedicaDAO.inserir(ocorrenciaMedica));
        assertEquals(1, ocorrenciaMedica.getId());

        ocorrenciaMedica.setCep(12345678);
        ocorrenciaMedica.setNumeroResidencia(291);
        ocorrenciaMedica.setRua("Rua das Velhas com Cabelos Laranjas");
        ocorrenciaMedica.setLogradouro("");
        OcorrenciaMedicaDAO.alterar(ocorrenciaMedica);

        OcorrenciaMedica ocorrenciaMedicaBuscada = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(ocorrenciaMedica.getId());

        assertEquals(ocorrenciaMedicaBuscada.getTipoOcorrenciaMedica().getTipo(), ocorrenciaMedica.getTipoOcorrenciaMedica().getTipo());
        assertEquals(ocorrenciaMedicaBuscada.getTipoOcorrenciaMedica().getDescricao(), ocorrenciaMedica.getTipoOcorrenciaMedica().getDescricao());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getNome(), ocorrenciaMedica.getEmissor().getNome());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getUsuario(), ocorrenciaMedica.getEmissor().getUsuario());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getEmail(), ocorrenciaMedica.getEmissor().getEmail());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getSenha(), ocorrenciaMedica.getEmissor().getSenha());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getCpf(), ocorrenciaMedica.getEmissor().getCpf());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getRg(), ocorrenciaMedica.getEmissor().getRg());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getEndereco(), ocorrenciaMedica.getEmissor().getEndereco());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getCep(), ocorrenciaMedica.getEmissor().getCep());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getTelefone(), ocorrenciaMedica.getEmissor().getTelefone());
        assertEquals(ocorrenciaMedicaBuscada.getEmissor().getTrote(), ocorrenciaMedica.getEmissor().getTrote());

        assertEquals(ocorrenciaMedicaBuscada.getCep(), ocorrenciaMedica.getCep());
        assertEquals(ocorrenciaMedicaBuscada.getNumeroResidencia(), ocorrenciaMedica.getNumeroResidencia());
        assertEquals(ocorrenciaMedicaBuscada.getRua(), ocorrenciaMedica.getRua());
        assertEquals(ocorrenciaMedicaBuscada.getLogradouro(), ocorrenciaMedica.getLogradouro());
        assertNotEquals(0, emissor.getId());

    }

}
