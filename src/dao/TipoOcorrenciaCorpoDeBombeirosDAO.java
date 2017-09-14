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
 * @author Daiane Machado, date = 08/29/17
 */
public class TipoOcorrenciaCorpoDeBombeirosDAO {

    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) {
        String sql = "INSERT INTO tipo_ocorrencias_bombeiros (tipo, descricao) VALUES (?, ?);";
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

    public static int alterar(BaseTipoOcorrencia baseTipoOcorrencia) throws SQLException {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE tipo_ocorrencias_bombeiros SET"
                    + " tipo = ?, "
                    + " descricao = ?"
                    + " WHERE id = ?";
            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, baseTipoOcorrencia.getTipo());
            ps.setString(2, baseTipoOcorrencia.getDescricao());

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
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_bombeiros";
        Conexao conexao = new Conexao();
        try {
            java.sql.Statement stt = conexao.conectar().createStatement();
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

    public static BaseTipoOcorrencia buscarCBPorID(int id) {
        BaseTipoOcorrencia corpoDeBombeiros = null;
        String sql = "SELECT id, tipo, descricao FROM tipo_ocorrencias_bombeiros WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, id);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                corpoDeBombeiros = new BaseTipoOcorrencia();
                corpoDeBombeiros.setId(rs.getInt("id"));
                corpoDeBombeiros.setTipo(rs.getString("tipo"));
                corpoDeBombeiros.setDescricao(rs.getString("descricao"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return corpoDeBombeiros;
    }

    public static ArrayList<BaseTipoOcorrencia> buscarOcorrenciaCorpoDeBombeiros() {

        ArrayList<BaseTipoOcorrencia> ocorrenciasMedicas = new ArrayList<>();
        String sql = "SELECT id, tipo, descricao FROM tipo_ocorrencias_bombeiros";

        Conexao conexao = new Conexao();
        try {
            Statement ps = conexao.conectar().createStatement();
            ps.execute(sql);
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                BaseTipoOcorrencia ocorrenciaMedica = new BaseTipoOcorrencia();
                ocorrenciaMedica.setId(rs.getInt("id"));
                ocorrenciaMedica.setTipo(rs.getString("tipo"));
                ocorrenciaMedica.setDescricao(rs.getString("descricao"));
                ocorrenciasMedicas.add(ocorrenciaMedica);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciasMedicas;
    }
}
