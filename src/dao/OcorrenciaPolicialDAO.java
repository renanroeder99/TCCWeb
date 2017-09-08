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
import model.Emissor;
import model.OcorrenciaPolicial;
import model.TipoOcorrenciaPolicial;

/**
 *
 * @author Wanderson Ferreira
 */
public class OcorrenciaPolicialDAO {
    
    public static int inserir(OcorrenciaPolicial ocorrenciaPolicial) {
        String sql = "INSERT INTO ocorrencias_policiais (id_tipo_ocorrencias_policiais, id_emissor, cep, rua, numero_residencia, logradouro) VALUES (?,?,?,?,?,?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, ocorrenciaPolicial.getTipoOcorrenciaPolicial().getId());
            ps.setInt(2, ocorrenciaPolicial.getEmissor().getId());
            ps.setInt(3, ocorrenciaPolicial.getCep());
            ps.setString(4, ocorrenciaPolicial.getRua());
            ps.setInt(5, ocorrenciaPolicial.getNumeroResidencia());
            ps.setString(6, ocorrenciaPolicial.getLogradouro());
            
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            
            while (rs.next()) {
                int codigo = rs.getInt(1);
                return codigo;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return -1;
        
    }
    
    public static int alterar(OcorrenciaPolicial ocorrenciaPolicial) {
        Conexao conexao = new Conexao();
        
        try {
            String sql = "UPDATE ocorrencias_policiais SET id_tipo_ocorrencias_policiais = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ?  ";
            
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            
            ps.setInt(1, ocorrenciaPolicial.getTipoOcorrenciaPolicial().getId());
            ps.setInt(2, ocorrenciaPolicial.getEmissor().getId());
            ps.setInt(3, ocorrenciaPolicial.getCep());
            ps.setString(4, ocorrenciaPolicial.getRua());
            ps.setInt(5, ocorrenciaPolicial.getNumeroResidencia());
            ps.setString(6, ocorrenciaPolicial.getLogradouro());
            ps.setInt(7, ocorrenciaPolicial.getId());
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
        String sql = "SELECT COUNT (id) AS quantidade FROM ocorrencias_policiais";
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
    
    public static OcorrenciaPolicial buscarOcorrenciaPolicialPorID(int codigo) {
        OcorrenciaPolicial ocorrenciaPolicial = null;
        String sql = "SELECT id_tipo_ocorrencias_policiais, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_policiais WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                ocorrenciaPolicial = new OcorrenciaPolicial();
                ocorrenciaPolicial.setId(codigo);
                ocorrenciaPolicial.setTipoOcorrenciaPolicial(TipoOcorrenciaPolicialDAO.buscarOPPorID(rs.getInt("id_tipo_ocorrencias_policiais")));
                ocorrenciaPolicial.setEmissor(EmissorDAO.buscarUsuarioPorID(rs.getInt("id_emissor")));
                ocorrenciaPolicial.setCep(rs.getInt("cep"));
                ocorrenciaPolicial.setRua(rs.getString("rua"));
                ocorrenciaPolicial.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciaPolicial.setLogradouro(rs.getString("logradouro"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaPolicial;
    }
    
}