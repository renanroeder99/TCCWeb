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
   defesaCivil.setCodigo(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
   
   assertEquals(1, defesaCivil.getCodigo());
   
   TipoOcorrenciaDefesaCivil codigoInserido = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(defesaCivil.getCodigo());
   
   assertEquals(defesaCivil.getCodigo(), codigoInserido.getCodigo());
   assertEquals(defesaCivil.getLocalizacao(), codigoInserido.getLocalizacao());
   
   }
   
   @Test
   public void testarAlterar()throws SQLException{
       Limpeza.truncateTabelas();
       TipoOcorrenciaDefesaCivil defesaCivil = new TipoOcorrenciaDefesaCivil();
       
       defesaCivil.setDescricao("abcabc");
       defesaCivil.setLocalizacao("abcabc");
       defesaCivil.setChamarAmbulancia(true);
       defesaCivil.setCodigo(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
       
       assertEquals(1, defesaCivil.getCodigo());
       
       defesaCivil.setDescricao("adc");
       defesaCivil.setLocalizacao("adcd");
       defesaCivil.setChamarAmbulancia(false);
       defesaCivil.setCodigo(TipoOcorrenciaDefesaCivilDAO.chamarDefesaCivil(defesaCivil));
               
       TipoOcorrenciaDefesaCivil cadastroBD = TipoOcorrenciaDefesaCivilDAO.buscarDCPorId(defesaCivil.getCodigo());
       
       assertEquals(cadastroBD.getDescricao(), defesaCivil.getDescricao());
       assertEquals(cadastroBD.getLocalizacao(), defesaCivil.getLocalizacao());
       assertEquals(cadastroBD.isChamarAmbulancia(), defesaCivil.isChamarAmbulancia());
       
       assertNotEquals(0, defesaCivil.getCodigo());
       
   }
}