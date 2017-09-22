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
import java.util.ArrayList;
import java.util.List;

import model.BaseOcorrencia;
import sun.misc.BASE64Encoder;

import javax.swing.plaf.nimbus.State;

/**
 *
 * @author Wanderson Ferreira
 */
public class OcorrenciaPolicialDAO {
    
    public static int inserir(BaseOcorrencia ocorrenciaPolicial) {
        String sql = "INSERT INTO ocorrencias_policiais (id_tipo_ocorrencias_policiais, id_emissor, cep, rua, numero_residencia, logradouro) VALUES (?,?,?,?,?,?)";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, ocorrenciaPolicial.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaPolicial.getEmissor().getId());
            ps.setInt(3, ocorrenciaPolicial.getCep());
            ps.setString(4, ocorrenciaPolicial.getRua());
            ps.setInt(5, ocorrenciaPolicial.getNumeroResidencia());
            ps.setString(6, ocorrenciaPolicial.getEmissor().getLogradouro());
            
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            
            while (rs.next()) {
                int codigo = rs.getInt(1);
                return codigo;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            conexao.desconectar();
        }
        return -1;
        
    }
    
    public static int alterar(BaseOcorrencia ocorrenciaPolicial) {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE ocorrencias_policiais SET id_tipo_ocorrencias_policiais = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ?  ";
            
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            
            ps.setInt(1, ocorrenciaPolicial.getBaseTipoOcorrencia().getId());
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
    
    public static BaseOcorrencia buscarOcorrenciaPolicialPorID(int codigo) {
        BaseOcorrencia ocorrenciaPolicial = null;

        String sql = "SELECT id_tipo_ocorrencias_policiais, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_policiais WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                ocorrenciaPolicial = new BaseOcorrencia();
                ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(rs.getInt("id_tipo_ocorrencias_policiais")));
                ocorrenciaPolicial.setId(codigo);
                ocorrenciaPolicial.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
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

    public static ArrayList<BaseOcorrencia> retornarOcorrenciaPolicial(){
        ArrayList<BaseOcorrencia> tabelaOcorrenciaPolicial = new ArrayList<>();
        String sql = "SELECT id, id_tipo_ocorrencias_policiais, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_policiais";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
            stt.execute(sql);
            ResultSet rs = stt.getResultSet();
            while (rs.next()){
                BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();
                ocorrenciaPolicial.setId(rs.getInt("id"));
                ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(rs.getInt("id_tipo_ocorrencias_policiais")));
                //Tipo de ocorrencia
                ocorrenciaPolicial.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciaPolicial.setCep(rs.getInt("cep"));
                ocorrenciaPolicial.setRua(rs.getString("rua"));
                ocorrenciaPolicial.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciaPolicial.setLogradouro(rs.getString("logradouro"));
                tabelaOcorrenciaPolicial.add(ocorrenciaPolicial);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            conexao.desconectar();
        }
        return tabelaOcorrenciaPolicial;
    }

    public static void excluirPolicial(int id) {
        String sql = "DELETE FROM ocorrencia_policiais WHERE id = ?";
        try {
            PreparedStatement ps = Conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void alterarTrote(int id, boolean trote) {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE ocorrencias_policiais SET trote = ? WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.setBoolean(2, trote);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}