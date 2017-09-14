package dao;

import database.Conexao;
import model.BaseTipoOcorrencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Wanderson Ferreira 30/08/2017
 */
public class TipoOcorrenciaPolicialDAO {

    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) {
        String sql = "INSERT INTO tipo_ocorrencias_policiais (tipo, descricao) VALUES (?,?);";
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
            String sql = "UPDATE tipo_ocorrencias_policiais SET tipo = ?,"
                    + "descricao = ?"
                    + "WHERE id = ?";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, baseTipoOcorrencia.getTipo());
            ps.setString(2, baseTipoOcorrencia.getDescricao());
            ps.setInt(3, baseTipoOcorrencia.getId());
            int resultado = ps.executeUpdate();
            return resultado;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;

        } finally {
            conexao.conectar();
        }
    }

    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_policiais";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement stt = conexao.conectar().prepareCall(sql);
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

    public static BaseTipoOcorrencia buscarOPPorID(int codigo) {
        BaseTipoOcorrencia tipoOcorrenciaPolicial = null;
        String sql = "SELECT tipo, descricao FROM tipo_ocorrencias_policiais WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                tipoOcorrenciaPolicial = new BaseTipoOcorrencia();
                tipoOcorrenciaPolicial.setId(codigo);
                tipoOcorrenciaPolicial.setTipo(rs.getString("tipo"));
                tipoOcorrenciaPolicial.setDescricao(rs.getString("descricao"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return tipoOcorrenciaPolicial;
    }

    public static ArrayList<BaseTipoOcorrencia> buscarOcorrenciaPolicial() {

            ArrayList<BaseTipoOcorrencia> ocorrenciasPoliciais = new ArrayList<>();
            String sql = "SELECT id, tipo, descricao FROM tipo_ocorrencias_policiais";

            Conexao conexao = new Conexao();
            try {
                Statement ps = conexao.conectar().createStatement();
                ps.execute(sql);
                ResultSet rs = ps.getResultSet();
                while (rs.next()) {
                    BaseTipoOcorrencia ocorrenciaPolicial = new BaseTipoOcorrencia();
                    ocorrenciaPolicial.setId(rs.getInt("id"));
                    ocorrenciaPolicial.setTipo(rs.getString("tipo"));
                    ocorrenciaPolicial.setDescricao(rs.getString("descricao"));
                    ocorrenciasPoliciais.add(ocorrenciaPolicial);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                conexao.desconectar();
            }
            return ocorrenciasPoliciais;
    }
}