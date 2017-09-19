/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Limpeza;
import java.sql.SQLException;
import model.Receptor;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author 98930
 */
public class TesteReceptor {

    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();
        Receptor administrador = new Receptor();
        administrador.setNome("Felipe Cazagranda");
        administrador.setLogin("FelipeCaz");
        administrador.setSenha("123123");
        administrador.setCpf("11333211254");
        administrador.setCargo("MED");
        administrador.setEndereco("Rua Alcebiades Reichert, 177");
        administrador.setTelefone(Integer.parseInt("88385618"));
        administrador.setEmail("felipecaz1113@gmail.com");
        administrador.setCep("80495574");

        int codigoInserido = ReceptorDAO.cadastrar(administrador);
        assertEquals(1, codigoInserido);
    }
    
    @Test
    public void testarBuscarReceptorPorID() throws SQLException{
        Limpeza.truncateTabelas();
        Receptor receptor = new Receptor();
        receptor.setNome("wad");
        receptor.setLogin("eeey5ty");
        receptor.setSenha("1234556789");
        receptor.setCpf("651651561");
        receptor.setCargo("eeey");
        receptor.setEndereco("Rua asfopasfjioaopias");
        receptor.setEmail("eeey@ty");
        receptor.setCep("659896");
        receptor.setTelefone(Integer.parseInt("993456564"));
        receptor.setId(ReceptorDAO.cadastrar(receptor));
        
        assertEquals(1, receptor.getId());

        Receptor codigoInserido = ReceptorDAO.buscarReceptorPorID(receptor.getId());

        assertEquals(receptor.getId(), codigoInserido.getId());
        assertEquals(receptor.getNome(), codigoInserido.getNome());
        assertEquals(receptor.getLogin(), codigoInserido.getLogin());
        assertEquals(receptor.getSenha(), codigoInserido.getSenha());
        assertEquals(receptor.getCpf(), codigoInserido.getCpf());
        assertEquals(receptor.getCargo(), codigoInserido.getCargo());
        assertEquals(receptor.getEndereco(), codigoInserido.getEndereco());
        assertEquals(receptor.getEmail(), codigoInserido.getEmail());
        assertEquals(receptor.getCep(), codigoInserido.getCep());
        assertEquals(receptor.getTelefone(), codigoInserido.getTelefone());
    }
    
    
    
    
    @Test
    public void testarAlterar() throws SQLException {
        Limpeza.truncateTabelas();
        Receptor receptor = new Receptor();
        receptor.setNome("Felipe Cazagranda");
        receptor.setLogin("FelipeCaz");
        receptor.setSenha("123123");
        receptor.setCpf("11333211254");
        receptor.setCargo("Vagabundo");
        receptor.setEndereco("Rua Alcebiades Reichert, 177");
        receptor.setTelefone(Integer.parseInt("88385618"));
        receptor.setEmail("felipecaz1113@gmail.com");
        receptor.setCep("80495574");
        receptor.setId(ReceptorDAO.cadastrar(receptor));

        assertEquals(1, receptor.getId());

        receptor.setNome("Antony Vogel");
        receptor.setLogin("xtonyx");
        receptor.setSenha("123123123");
        receptor.setCpf("15216223467");
        receptor.setCargo("Vagabundo");
        receptor.setEndereco("Rua Georg Backman, 436");
        receptor.setTelefone(Integer.parseInt("96831219"));
        receptor.setEmail("antonyhenriquevogel@gmail.com");
        receptor.setCep("66666666");
        receptor.setId(ReceptorDAO.cadastrar(receptor));

        Receptor cadastroBD = ReceptorDAO.buscarReceptorPorID(receptor.getId());
        
        assertEquals(cadastroBD.getId(), receptor.getId());
        assertEquals(cadastroBD.getNome(), receptor.getNome());
        assertEquals(cadastroBD.getLogin(), receptor.getLogin());
        assertEquals(cadastroBD.getSenha(), receptor.getSenha());
        assertEquals(cadastroBD.getCpf(), receptor.getCpf());
        assertEquals(cadastroBD.getCargo(), receptor.getCargo());
        assertEquals(cadastroBD.getEndereco(), receptor.getEndereco());
        assertEquals(cadastroBD.getTelefone(), receptor.getTelefone());
        assertEquals(cadastroBD.getEmail(), receptor.getEmail());
        assertEquals(cadastroBD.getCep(), receptor.getCep());
        assertNotEquals(0, receptor.getId());
    }
    

}
