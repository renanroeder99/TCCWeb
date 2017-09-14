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
import model.Emissor;

/**
 *
 * @author(Felipe de Jesus Cazagranda, date = 09-30-2017)
 *
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
            ps.setInt(3, ocorrenciaMedica.getCep());
            ps.setString(4, ocorrenciaMedica.getRua());
            ps.setInt(5, ocorrenciaMedica.getNumeroResidencia());
            ps.setString(6, ocorrenciaMedica.getLogradouro());
            ps.setInt(7, ocorrenciaMedica.getId());
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
                ocorrenciaMedica.setId(codigo);
                ocorrenciaMedica.setBaseTipoOcorrencia(TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(rs.getInt("id_tipo_ocorrencia_medica")));
                ocorrenciaMedica.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciaMedica.setCep(rs.getInt("cep"));
                ocorrenciaMedica.setRua(rs.getString("rua"));
                ocorrenciaMedica.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciaMedica.setLogradouro(rs.getString("logradouro"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaMedica;
    }

    public List<BaseOcorrencia> retornarOcorrenciaMedica(){
        List<BaseOcorrencia> tabelaOcorrenciaMedica = new ArrayList<>();
        String sql = "SELFCT id, id_tipo_ocorrencias_medicas, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_medicas";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
            stt.execute(sql);
            ResultSet rs = stt.getResultSet();
            while (rs.next()){
                BaseOcorrencia ocorrenciaMedica = new BaseOcorrencia();
                ocorrenciaMedica.setId(rs.getInt("id"));
                ocorrenciaMedica.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(rs.getInt("id_tipo_ocorrencias_medicas")));
                //Tipo de ocorrencia
                ocorrenciaMedica.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciaMedica.setCep(rs.getInt("cep"));
                ocorrenciaMedica.setRua(rs.getString("rua"));
                ocorrenciaMedica.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciaMedica.setLogradouro(rs.getString("logradouro"));
                tabelaOcorrenciaMedica.add(ocorrenciaMedica);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            conexao.desconectar();
        }
        return tabelaOcorrenciaMedica;
    }
}

