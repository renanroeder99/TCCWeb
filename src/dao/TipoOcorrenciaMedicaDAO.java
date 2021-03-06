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
import java.util.ArrayList;

/**
 * @author(Felipe de Jesus Cazagranda, date = 09-14-2017
 */
public class TipoOcorrenciaMedicaDAO {

    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) throws SQLException {
        String sql = "INSERT INTO tipo_ocorrencias_medicas (tipo) VALUES ( ?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, baseTipoOcorrencia.getTipo());

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

            String sql = "UPDATE tipo_ocorrencias_medicas SET "
                    + " tipo = ?"
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, baseTipoOcorrencia.getTipo());
            ps.setInt(2, baseTipoOcorrencia.getId());
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

    public static ArrayList<BaseTipoOcorrencia> buscarOcorrenciaMedica() {
        ArrayList<BaseTipoOcorrencia> ocorrenciasMedicas = new ArrayList<>();
        String sql = "SELECT id, tipo FROM tipo_ocorrencias_medicas";

        Conexao conexao = new Conexao();
        try {
            Statement ps = conexao.conectar().createStatement();
            ps.execute(sql);
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                BaseTipoOcorrencia ocorrenciaMedica = new BaseTipoOcorrencia();
                ocorrenciaMedica.setId(rs.getInt("id"));
                ocorrenciaMedica.setTipo(rs.getString("tipo"));
                ocorrenciasMedicas.add(ocorrenciaMedica);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciasMedicas;
    }

    public static BaseTipoOcorrencia buscarOcorrenciaMedicaPorID(int id) {
        BaseTipoOcorrencia ocorrenciaMedica = null;
        String sql = "SELECT tipo FROM tipo_ocorrencias_medicas WHERE id = ?";

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
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaMedica;
    }
}
