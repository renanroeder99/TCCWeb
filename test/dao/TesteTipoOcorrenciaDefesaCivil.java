package dao;

import database.Limpeza;
import java.sql.SQLException;

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
        TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();
        BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
        baseTipoOcorrencia.setDescricao("abcabc");
        baseTipoOcorrencia.setLocalizacao("abcabc");
        defesaCivil.setChamarAmbulancia(true);
        
        int codigoInserido = TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(baseTipoOcorrencia);
        assertEquals(1, codigoInserido);
   } 
   
   @Test
   public void testarBuscarDCPorID() {
   Limpeza.truncateTabelas();
   TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();
       BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();

       baseTipoOcorrencia.setDescricao("edg");
       baseTipoOcorrencia.setLocalizacao("weqree");
   defesaCivil.setChamarAmbulancia(true);
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(baseTipoOcorrencia));
   
   assertEquals(1, baseTipoOcorrencia.getId());

       BaseTipoOcorrencia codigoInserido = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(baseTipoOcorrencia.getId());
   
   assertEquals(baseTipoOcorrencia.getId(), codigoInserido.getId());
   assertEquals(baseTipoOcorrencia.getLocalizacao(), codigoInserido.getLocalizacao());
   
   }
   
   @Test
   public void testarAlterar()throws SQLException{
       Limpeza.truncateTabelas();
       BaseTipoOcorrencia baseTipoOcorrencia = new BaseTipoOcorrencia();
       TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();

       baseTipoOcorrencia.setDescricao("abcabc");
       baseTipoOcorrencia.setLocalizacao("abcabc");
       defesaCivil.setChamarAmbulancia(true);
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(baseTipoOcorrencia));
       
       assertEquals(1, baseTipoOcorrencia.getId());

       baseTipoOcorrencia.setDescricao("adc");
       baseTipoOcorrencia.setLocalizacao("adcd");
       defesaCivil.setChamarAmbulancia(false);
       baseTipoOcorrencia.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(baseTipoOcorrencia));
               
       TipoOcorrenciaDefesaCivil cadastroBD = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(baseTipoOcorrencia.getId());
       
       assertEquals(cadastroBD.getDescricao(), baseTipoOcorrencia.getDescricao());
       assertEquals(cadastroBD.getLocalizacao(), baseTipoOcorrencia.getLocalizacao());
       assertEquals(cadastroBD.isChamarAmbulancia(), defesaCivil.isChamarAmbulancia());
       
       assertNotEquals(0, baseTipoOcorrencia.getId());
       
   }
}