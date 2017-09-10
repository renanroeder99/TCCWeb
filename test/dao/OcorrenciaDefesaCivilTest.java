package dao;

import database.Limpeza;
import model.Emissor;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class OcorrenciaDefesaCivilTest {
    @Test
    public void testarCriacao() throws SQLException {
        Limpeza.truncateTabelas();
        TipoOcorrenciaDefesaCivil tipoOcorrenciaDefesaCivil = new TipoOcorrenciaDefesaCivil();

        tipoOcorrenciaDefesaCivil.setTipo("Enchente");
        tipoOcorrenciaDefesaCivil.setDescricao("Enchente na rua 7 de setembro");
        tipoOcorrenciaDefesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.inserir(tipoOcorrenciaDefesaCivil));


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

        OcorrenciaDefesaCivil ocorrenciaDefesaCivil = new OcorrenciaDefesaCivil();
        ocorrenciaDefesaCivil.setCep(145444);
        ocorrenciaDefesaCivil.setNumeroResidencia(1004);
        ocorrenciaDefesaCivil.setRua("Pqp ");
        ocorrenciaDefesaCivil.setLogradouro("casa");

        ocorrenciaDefesaCivil.setTipoOcorrenciaDefesaCivil(tipoOcorrenciaDefesaCivil);
        ocorrenciaDefesaCivil.setEmissor(emissor);
        ocorrenciaDefesaCivil.setId(OcorrenciaDefesaCivilDAO.inserir(ocorrenciaDefesaCivil));
        assertEquals(1, ocorrenciaDefesaCivil.getId());

    }

}