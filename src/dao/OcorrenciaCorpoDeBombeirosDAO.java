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

/**
 *
 * @author Daiane Machado, date = 31/08/17
 */
public class OcorrenciaCorpoDeBombeirosDAO {

    public static int inserir(BaseOcorrencia ocorrenciaBombeiros){
        String sql = "INSERT INTO ocorrencias_bombeiros (id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia, logradouro) VALUES (?,?,?,?,?,?);";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, ocorrenciaBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaBombeiros.getEmissor().getId());
            ps.setInt(3, ocorrenciaBombeiros.getCep());
            ps.setString(4, ocorrenciaBombeiros.getRua());
            ps.setInt(5, ocorrenciaBombeiros.getNumeroResidencia());
            ps.setString(6, ocorrenciaBombeiros.getLogradouro());

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

    public static int alterar(BaseOcorrencia ocorrenciasBombeiros){
        Conexao conexao = new Conexao();
        try{
            String sql = "UPDATE ocorrencias_bombeiros SET id_tipo_ocorrencias_bombeiros = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ? ";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setInt(1, ocorrenciasBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciasBombeiros.getEmissor().getId());
            ps.setInt(3, ocorrenciasBombeiros.getCep());
            ps.setString(4, ocorrenciasBombeiros.getRua());
            ps.setInt(5, ocorrenciasBombeiros.getNumeroResidencia());
            ps.setString(6, ocorrenciasBombeiros.getLogradouro());
            ps.setInt(7, ocorrenciasBombeiros.getId());

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
        String sql = "SELECT COUNT (id) AS quantidade FROM ocorrencias_bombeiros";
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

    public static BaseOcorrencia buscarOcorrenciaBombeiroPorId(int codigo){
        BaseOcorrencia ocorrenciasBombeiros = null;
        String sql = "SELECT id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_bombeiros WHERE id = ?";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()){
                ocorrenciasBombeiros = new BaseOcorrencia();
                ocorrenciasBombeiros.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(rs.getInt("id_tipo_ocorrencias_bombeiros")));
                ocorrenciasBombeiros.setId(codigo);
                ocorrenciasBombeiros.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                ocorrenciasBombeiros.setCep(rs.getInt("cep"));
                ocorrenciasBombeiros.setRua(rs.getString("rua"));
                ocorrenciasBombeiros.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciasBombeiros.setLogradouro(rs.getString("logradouro"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciasBombeiros;
    }

    public List<BaseOcorrencia> retornarOcorrenciaBombeiro(){
        List<BaseOcorrencia> tabelaOcorrenciaBombeiro = new ArrayList<>();
        String sql = "SELFCT id, id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_bombeiros";
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
                tabelaOcorrenciaBombeiro.add(ocorrenciaPolicial);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            conexao.desconectar();
        }
        return tabelaOcorrenciaBombeiro;
    }

}