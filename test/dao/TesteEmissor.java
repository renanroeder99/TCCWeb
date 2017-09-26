package dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import database.Limpeza;
import java.sql.SQLException;
import model.Emissor;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author 98930
 */
public class TesteEmissor {

    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();
        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep(89070-730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        int codigoInserido = EmissorDAO.cadastrar(emissor);
        assertEquals(1, codigoInserido);
    }

    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884999"));
        emissor.setEndereco("Avenida Ipiranga do Brasil");
        emissor.setCep(89070730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setId(EmissorDAO.cadastrar(emissor));

        assertEquals(1, emissor.getId());

        emissor.setNome("Wanderson");
        emissor.setEmail("wands@hotmail.com");
        emissor.setSenha("12345679");
        emissor.setCpf("1122723594");
        emissor.setRg(Integer.parseInt("884"));
        emissor.setEndereco("Avenidas");
        emissor.setCep(80707301);
        emissor.setTelefone(Integer.parseInt("97916393"));
        emissor.setId(EmissorDAO.alterar(emissor));

        Emissor cadastroBD = EmissorDAO.buscarEmissorPorID(emissor.getId());

        assertEquals(cadastroBD.getId(), emissor.getId());
        assertEquals(cadastroBD.getNome(), emissor.getNome());
        assertEquals(cadastroBD.getEmail(), emissor.getEmail());
        assertEquals(cadastroBD.getConfirmarEmail(), emissor.getConfirmarEmail());
        assertEquals(cadastroBD.getSenha(), emissor.getSenha());
        assertEquals(cadastroBD.getCpf(), emissor.getCpf());
        assertEquals(cadastroBD.getRg(), emissor.getRg());
        assertEquals(cadastroBD.getEndereco(), emissor.getEndereco());
        assertEquals(cadastroBD.getCep(), emissor.getCep());
        assertEquals(cadastroBD.getTelefone(), emissor.getTelefone());
        assertNotEquals(0, emissor.getId());

    }

    @Test
    public void testarExcluir() throws SQLException {
        Limpeza.truncateTabelas();
        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884"));
        emissor.setEndereco("Avenida");
        emissor.setCep(89070730);
        emissor.setTelefone(Integer.parseInt("97396393"));
        emissor.setId(EmissorDAO.cadastrar(emissor));
        EmissorDAO.excluir(emissor.getId());
        assertNull(EmissorDAO.buscarEmissorPorID(emissor.getId()));

    }

}
