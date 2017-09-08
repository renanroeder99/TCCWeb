package dao;

import database.Limpeza;
import java.sql.SQLException;
import model.TipoOcorrenciaDefesaCivil;
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
        defesaCivil.setDescricao("abcabc");
        defesaCivil.setLocalizacao("abcabc");
        defesaCivil.setChamarAmbulancia(true);
        
        int codigoInserido = TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil);
        assertEquals(1, codigoInserido);
   } 
   
   @Test
   public void testarBuscarDCPorID() {
   Limpeza.truncateTabelas();
   TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();
   defesaCivil.setDescricao("edg");
   defesaCivil.setLocalizacao("weqree");
   defesaCivil.setChamarAmbulancia(true);
   defesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
   
   assertEquals(1, defesaCivil.getId());
   
   TipoOcorrenciaDefesaCivil codigoInserido = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(defesaCivil.getId());
   
   assertEquals(defesaCivil.getId(), codigoInserido.getId());
   assertEquals(defesaCivil.getLocalizacao(), codigoInserido.getLocalizacao());
   
   }
   
   @Test
   public void testarAlterar()throws SQLException{
       Limpeza.truncateTabelas();
       TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();
       
       defesaCivil.setDescricao("abcabc");
       defesaCivil.setLocalizacao("abcabc");
       defesaCivil.setChamarAmbulancia(true);
       defesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
       
       assertEquals(1, defesaCivil.getId());
       
       defesaCivil.setDescricao("adc");
       defesaCivil.setLocalizacao("adcd");
       defesaCivil.setChamarAmbulancia(false);
       defesaCivil.setId(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
               
       TipoOcorrenciaDefesaCivil cadastroBD = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(defesaCivil.getId());
       
       assertEquals(cadastroBD.getDescricao(), defesaCivil.getDescricao());
       assertEquals(cadastroBD.getLocalizacao(), defesaCivil.getLocalizacao());
       assertEquals(cadastroBD.isChamarAmbulancia(), defesaCivil.isChamarAmbulancia());
       
       assertNotEquals(0, defesaCivil.getId());
       
   }
}