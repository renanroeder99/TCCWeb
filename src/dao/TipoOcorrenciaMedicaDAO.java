/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database.Conexao;
import model.BaseTipoOcorrencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author(Felipe de Jesus Cazagranda, date = 09-30-2017)
 */
public class TipoOcorrenciaMedicaDAO {

    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) throws SQLException {
        String sql = "INSERT INTO tipo_ocorrencias_medicas (tipo, descricao) VALUES (?, ?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, baseTipoOcorrencia.getTipo());
            ps.setString(2, baseTipoOcorrencia.getDescricao());

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

    public static int alterar(BaseTipoOcorrencia baseTipoOcorrencia) {
        Conexao conexao = new Conexao();
        try {

            String sql = "UPDATE tipo_ocorrencias_medicas SET descricao = ?,"
                    + " tipo = ?"
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, baseTipoOcorrencia.getDescricao());
            ps.setString(2, baseTipoOcorrencia.getTipo());
            ps.setInt(3, baseTipoOcorrencia.getId());
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
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_medicas";
        Conexao conexao = new Conexao();
        try {
            Statement stt = conexao.conectar().createStatement();
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

    public static BaseTipoOcorrencia buscarOcorrenciaMedicaPorID(int id) {
        BaseTipoOcorrencia ocorrenciaMedica = null;
        String sql = "SELECT tipo, descricao FROM tipo_ocorrencias_medicas WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                ocorrenciaMedica = new BaseTipoOcorrencia();
                ocorrenciaMedica.setId(id);
                ocorrenciaMedica.setTipo(rs.getString("tipo"));
                ocorrenciaMedica.setDescricao(rs.getString("descricao"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaMedica;
    }
}
