package dao;

import database.Limpeza;
import java.sql.SQLException;

import model.BaseOcorrencia;
import model.BaseTipoOcorrencia;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author 98930
 */
public class TesteTipoOcorrenciaDefesaCivil {
    
    @Test
   public void testarCriacao(){
        Limpeza.truncateTabelas();
        BaseOcorrencia defesaCivil = new BaseOcorrencia();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setDescricao("abcabc");
        defesaCivil.setRua("abcabc");

        int codigoInserido = TipoOcorrenciaDefesaCivilDAO.inserir(baseTipoOcorrencia);
        assertEquals(1, codigoInserido);
   } 
   
   @Test
   public void testarBuscarDCPorID() {
   Limpeza.truncateTabelas();
   BaseOcorrencia defesaCivil = new BaseOcorrencia();
       BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();

       baseTipoOcorrencia.setDescricao("edg");
       defesaCivil.setRua("weqree");
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.inserir(baseTipoOcorrencia));
   
       assertEquals(1, baseTipoOcorrencia.getId());

       BaseTipoOcorrencia codigoInserido = TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(baseTipoOcorrencia.getId());
   
   assertEquals(baseTipoOcorrencia.getId(), codigoInserido.getId());

   }
   
   @Test
   public void testarAlterar()throws SQLException{
       Limpeza.truncateTabelas();
       BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
       BaseOcorrencia defesaCivil = new BaseOcorrencia();

       baseTipoOcorrencia.setDescricao("abcabc");
       defesaCivil.setRua("abcabc");
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.inserir(baseTipoOcorrencia));
       
       assertEquals(1, baseTipoOcorrencia.getId());

       baseTipoOcorrencia.setDescricao("adc");
       defesaCivil.setRua("asfojasiohsao");
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.inserir(baseTipoOcorrencia));
               
       BaseTipoOcorrencia cadastroBD = TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(baseTipoOcorrencia.getId());
       
       assertEquals(cadastroBD.getDescricao(), baseTipoOcorrencia.getDescricao());

       
       assertNotEquals(0, baseTipoOcorrencia.getId());
       
   }
}