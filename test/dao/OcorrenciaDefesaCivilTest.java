package dao;

import database.Limpeza;
import model.BaseOcorrencia;
import model.BaseTipoOcorrencia;
import model.Emissor;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class OcorrenciaDefesaCivilTest {
    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();
        BaseTipoOcorrencia tipoOcorrenciaDefesaCivil = new BaseTipoOcorrencia();

        tipoOcorrenciaDefesaCivil.setTipo("Enchente");
        tipoOcorrenciaDefesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.inserir(tipoOcorrenciaDefesaCivil));


        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep("89070730");
        emissor.setTelefone("97396393");
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaDefesaCivil = new BaseOcorrencia();
        ocorrenciaDefesaCivil.setCep("145444");
        ocorrenciaDefesaCivil.setNumeroResidencia(1004);
        ocorrenciaDefesaCivil.setRua("Pqp ");

        ocorrenciaDefesaCivil.setBaseTipoOcorrencia(tipoOcorrenciaDefesaCivil);
        ocorrenciaDefesaCivil.setEmissor(emissor);
        ocorrenciaDefesaCivil.setId(OcorrenciaDefesaCivilDAO.inserir(ocorrenciaDefesaCivil));
        assertEquals(1, ocorrenciaDefesaCivil.getId());

    }
    @Test
    public void testarAlterar() throws SQLException{
        Limpeza.truncateTabelas();

        BaseTipoOcorrencia tipoOcorrenciaDefesaCivil = new BaseTipoOcorrencia();

        tipoOcorrenciaDefesaCivil.setTipo("Enchente");
        tipoOcorrenciaDefesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.inserir(tipoOcorrenciaDefesaCivil));

        Emissor emissor = new Emissor();
        emissor.setNome("Renan Roeder");
        emissor.setUsuario("renanroeder");
        emissor.setEmail("renanroeder@hotmail.com");
        emissor.setSenha("123456789");
        emissor.setCpf("11227235984");
        emissor.setRg(Integer.parseInt("5884763"));
        emissor.setEndereco("Avenida Brasil do Ipiranga");
        emissor.setCep("89070730");
        emissor.setTelefone("97396393");
        emissor.setId(EmissorDAO.cadastrar(emissor));

        BaseOcorrencia ocorrenciaDefesaCivil = new BaseOcorrencia();
        ocorrenciaDefesaCivil.setEmissor(emissor);
        ocorrenciaDefesaCivil.setBaseTipoOcorrencia(tipoOcorrenciaDefesaCivil);
        ocorrenciaDefesaCivil.setCep("44545555");
        ocorrenciaDefesaCivil.setNumeroResidencia(1004);
        ocorrenciaDefesaCivil.setRua("Pqp ");
        ocorrenciaDefesaCivil.setId(OcorrenciaDefesaCivilDAO.inserir(ocorrenciaDefesaCivil));
        assertEquals(1, ocorrenciaDefesaCivil.getId());

        ocorrenciaDefesaCivil.setCep("44444444");
        ocorrenciaDefesaCivil.setNumeroResidencia(104);
        ocorrenciaDefesaCivil.setRua("Pzxd");
        OcorrenciaDefesaCivilDAO.alterar(ocorrenciaDefesaCivil);

        BaseOcorrencia ocorrenciaDefesaCivilBuscada = OcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivilPorId(ocorrenciaDefesaCivil.getId());

        assertEquals(ocorrenciaDefesaCivilBuscada.getBaseTipoOcorrencia().getId(), ocorrenciaDefesaCivil.getBaseTipoOcorrencia().getId());

        assertEquals(ocorrenciaDefesaCivilBuscada.getEmissor().getId(), ocorrenciaDefesaCivil.getEmissor().getId());

        assertEquals(ocorrenciaDefesaCivilBuscada.getCep(), ocorrenciaDefesaCivil.getCep());
        assertEquals(ocorrenciaDefesaCivilBuscada.getNumeroResidencia(), ocorrenciaDefesaCivil.getNumeroResidencia());
        assertEquals(ocorrenciaDefesaCivilBuscada.getRua(), ocorrenciaDefesaCivil.getRua());



    }


}