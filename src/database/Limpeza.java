/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author 98930
 */
public class Limpeza {
    public static void truncateTabelas(){
        Conexao conexao = new Conexao();
        try{
            Statement st = conexao.conectar().createStatement();
            st.addBatch("SET FOREIGN_KEY_CHECKS = 0;"); 
            st.addBatch("TRUNCATE ocorrencias_medicas;");
            st.addBatch("TRUNCATE ocorrencias_bombeiros;");
            st.addBatch("TRUNCATE ocorrencias_policiais;");
            st.addBatch("TRUNCATE ocorrencias_defesa_civil;");
            st.addBatch("TRUNCATE tipo_ocorrencias_medicas;");
            st.addBatch("TRUNCATE tipo_ocorrencias_bombeiros;");
            st.addBatch("TRUNCATE tipo_ocorrencias_policiais;");
            st.addBatch("TRUNCATE tipo_ocorrencias_defesa_civil;");

            st.addBatch("TRUNCATE emissores");
            st.addBatch("TRUNCATE receptores");
            st.addBatch("SET FOREIGN_KEY_CHECKS = 1");
            st.executeBatch();
            
        }catch(SQLException ex){
            System.err.println(ex.getMessage());
        }finally{
            conexao.desconectar();
        }
    }
}
