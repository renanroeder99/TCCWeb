/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.BaseOcorrencia;
import model.Emissor;

/**
 *
 * @author Renan Roeder, 09-08-2017
 */
public class OcorrenciaMedicaDAO {
    public static int inserir(BaseOcorrencia ocorrenciaMedica){
        String sql = "INSERT INTO ocorrencias_medicas (id_tipo_ocorrencia_medica, id_emissor, cep, rua, numero_residencia, logradouro) VALUES(?, ?, ?, ?, ?, ?);";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, ocorrenciaMedica.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaMedica.getEmissor().getId());
            ps.setInt(3, ocorrenciaMedica.getEmissor().getCep());
            ps.setString(4, ocorrenciaMedica.getEmissor().getRua());
            ps.setInt(5, ocorrenciaMedica.getEmissor().getNumeroResidencia());
            ps.setString(6, ocorrenciaMedica.getEmissor().getLogradouro());
            
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            
            while(rs.next()){
                int codigo = rs.getInt(1);
                return codigo;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            return 0;
        }finally{
            conexao.desconectar();
        }
        return -1;
    }
    
    public static int alterar(BaseOcorrencia ocorrenciaMedica) {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE ocorrencias_medicas SET id_tipo_ocorrencia_medica = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ?;";
            
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            
            ps.setInt(1, ocorrenciaMedica.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaMedica.getEmissor().getId());
            ps.setInt(3, ocorrenciaMedica.getEmissor().getCep());
            ps.setString(4, ocorrenciaMedica.getEmissor().getRua());
            ps.setInt(5, ocorrenciaMedica.getEmissor().getNumeroResidencia());
            ps.setString(6, ocorrenciaMedica.getEmissor().getLogradouro());
            ps.setInt(7, ocorrenciaMedica.getEmissor().getId());
            int resultado = ps.executeUpdate();
            return resultado;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar();
        }
        
    }
    
    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM ocorrencias_medicas";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().prepareStatement(sql);
            stt.execute(sql);
            ResultSet resultado = stt.getResultSet();
            if (resultado.next()) {
                return resultado.getInt("quantidade");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return -1;
    }
    
    public static BaseOcorrencia buscarOcorrenciaMedicaPorID(int codigo) {
        BaseOcorrencia ocorrenciaMedica = null;
        String sql = "SELECT id_tipo_ocorrencia_medica, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_medicas WHERE id = ?";
        Conexao conexao = new Conexao();
        Emissor emissor = new Emissor();

        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                ocorrenciaMedica = new BaseOcorrencia();
                emissor.setId(codigo);
                ocorrenciaMedica.setBaseTipoOcorrencia(TipoOcorrenciaMedicaDAO.buscarOMPorID(rs.getInt("id_tipo_ocorrencia_medica")));
                emissor.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                emissor.setCep(rs.getInt("cep"));
                emissor.setRua(rs.getString("rua"));
                emissor.setNumeroResidencia(rs.getInt("numero_residencia"));
                emissor.setLogradouro(rs.getString("logradouro"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaMedica;
    }
    
}

