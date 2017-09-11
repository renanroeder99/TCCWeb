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

import model.BaseEmissor;
import model.BaseOcorrencia;

/**
 *
 * @author Renan Roeder 09/09/2017
 */
public class OcorrenciaCorpoDeBombeirosDAO {

    public static int inserir(BaseOcorrencia ocorrenciaBombeiros){
        String sql = "INSERT INTO ocorrencias_bombeiros (id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia, logradouro) VALUES (?,?,?,?,?,?);";
        BaseEmissor baseEmissor = new BaseEmissor();
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, ocorrenciaBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, baseEmissor.getEmissor().getId());
            ps.setInt(3, baseEmissor.getCep());
            ps.setString(4, baseEmissor.getRua());
            ps.setInt(5, baseEmissor.getNumeroResidencia());
            ps.setString(6, baseEmissor.getLogradouro());

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
        BaseEmissor baseEmissor = new BaseEmissor();
        try{
            String sql = "UPDATE ocorrencias_bombeiros SET id_tipo_ocorrencias_bombeiros = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ? ";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setInt(1, ocorrenciasBombeiros.getBaseTipoOcorrencia().getId());
            ps.setInt(2, baseEmissor.getEmissor().getId());
            ps.setInt(3, baseEmissor.getCep());
            ps.setString(4, baseEmissor.getRua());
            ps.setInt(5, baseEmissor.getNumeroResidencia());
            ps.setString(6, baseEmissor.getLogradouro());
            ps.setInt(7, baseEmissor.getId());

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
        BaseOcorrencia ocorrenciaBombeiro = null;
        BaseEmissor baseEmissor = new BaseEmissor();
        String sql = "SELECT id_tipo_ocorrencias_bombeiros, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_bombeiros WHERE id = ?";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()){
                ocorrenciaBombeiro = new BaseOcorrencia();
                baseEmissor.setId(codigo);
                ocorrenciaBombeiro.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(rs.getInt("id_tipo_ocorrencias_bombeiros")));
                baseEmissor.setEmissor(EmissorDAO.buscarEmissorPorID(rs.getInt("id_emissor")));
                baseEmissor.setCep(rs.getInt("cep"));
                baseEmissor.setRua(rs.getString("rua"));
                baseEmissor.setNumeroResidencia(rs.getInt("numero_residencia"));
                baseEmissor.setLogradouro(rs.getString("logradouro"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaBombeiro;
    }


}