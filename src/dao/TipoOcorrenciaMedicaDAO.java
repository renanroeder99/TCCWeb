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
import javax.swing.JOptionPane;
import model.TipoOcorrenciaMedica;

/**
 *
 * @author(Felipe de Jesus Cazagranda, date = 08-30-2017)
 */
public class TipoOcorrenciaMedicaDAO {

    public static int inserir(TipoOcorrenciaMedica ocorrenciaMedica) throws SQLException {
        String sql = "INSERT INTO tipo_ocorrencias_medicas (tipo, descricao) VALUES (?, ?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, ocorrenciaMedica.getTipo());
            ps.setString(2, ocorrenciaMedica.getDescricao());

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

    public static int alterar(TipoOcorrenciaMedica ocorrenciaMedica) {
        Conexao conexao = new Conexao();
        try {

            String sql = "UPDATE tipo_ocorrencias_medicas SET descricao = ?,"
                    + " tipo = ?"
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, ocorrenciaMedica.getDescricao());
            ps.setString(2, ocorrenciaMedica.getTipo());
            ps.setInt(3, ocorrenciaMedica.getId());
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

    public static TipoOcorrenciaMedica buscarOMPorID(int id) {
        TipoOcorrenciaMedica ocorrenciaMedica = null;
        String sql = "SELECT tipo, descricao FROM tipo_ocorrencias_medicas WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                ocorrenciaMedica = new TipoOcorrenciaMedica();
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
