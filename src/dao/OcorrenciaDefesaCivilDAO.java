/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Conexao;
import model.BaseOcorrencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *blablabla
 * @author Wanderson Ferreira 08/09/2017
 */
public class OcorrenciaDefesaCivilDAO {

    public static int inserir(BaseOcorrencia ocorrenciaDefesaCivil){
        String sql = "INSERT INTO ocorrencias_defesa_civil (id_tipo_ocorrencias_defesa_civil, id_emissor, cep, rua, numero_residencia, logradouro) VALUES (?,?,?,?,?,?);";

        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, ocorrenciaDefesaCivil.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaDefesaCivil.getEmissor().getId());
            ps.setInt(3, ocorrenciaDefesaCivil.getCep());
            ps.setString(4, ocorrenciaDefesaCivil.getRua());
            ps.setInt(5, ocorrenciaDefesaCivil.getNumeroResidencia());
            ps.setString(6, ocorrenciaDefesaCivil.getLogradouro());

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

    public static int alterar(BaseOcorrencia ocorrenciaDefesaCivil){
        Conexao conexao = new Conexao();

        try{
            String sql = "UPDATE ocorrencias_defesa_civil SET id_tipo_ocorrencias_defesa_civil = ?, id_emissor = ?, cep = ?, rua = ?, numero_residencia = ?, logradouro = ? WHERE id = ? ";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setInt(1, ocorrenciaDefesaCivil.getBaseTipoOcorrencia().getId());
            ps.setInt(2, ocorrenciaDefesaCivil.getEmissor().getId());
            ps.setInt(3, ocorrenciaDefesaCivil.getCep());
            ps.setString(4, ocorrenciaDefesaCivil.getRua());
            ps.setInt(5, ocorrenciaDefesaCivil.getNumeroResidencia());
            ps.setString(6, ocorrenciaDefesaCivil.getLogradouro());
            ps.setInt(7, ocorrenciaDefesaCivil.getId());

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
        String sql = "SELECT COUNT (id) AS quantidade FROM ocorrencias_defesa_civil";
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

    public static BaseOcorrencia buscarOcorrenciaDefesaCivilPorId(int codigo){
        BaseOcorrencia ocorrenciaDefesaCivil = null;
        String sql = "SELECT id_tipo_ocorrencias_defesa_civil, id_emissor, cep, rua, numero_residencia, logradouro FROM ocorrencias_defesa_civil WHERE id = ?";
        Conexao conexao = new Conexao();
        try{
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()){
                ocorrenciaDefesaCivil = new BaseOcorrencia();
                ocorrenciaDefesaCivil.setId(codigo);
                ocorrenciaDefesaCivil.setBaseTipoOcorrencia(TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(rs.getInt("id_tipo_ocorrencias_defesa_civil")));
                ocorrenciaDefesaCivil.setEmissor(EmissorDAO.buscarUsuarioPorID(rs.getInt("id_emissor")));
                ocorrenciaDefesaCivil.setCep(rs.getInt("cep"));
                ocorrenciaDefesaCivil.setRua(rs.getString("rua"));
                ocorrenciaDefesaCivil.setNumeroResidencia(rs.getInt("numero_residencia"));
                ocorrenciaDefesaCivil.setLogradouro(rs.getString("logradouro"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaDefesaCivil;
    }


}