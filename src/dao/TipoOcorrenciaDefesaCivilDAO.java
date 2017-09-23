package dao;

import database.Conexao;
import model.BaseTipoOcorrencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author Antony
 */
public class TipoOcorrenciaDefesaCivilDAO {


    public static int inserir(BaseTipoOcorrencia baseTipoOcorrencia) {
        String sql = "INSERT INTO tipo_ocorrencias_defesa_civil (tipo, descricao) VALUES (?,?);";
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
            String sql = "UPDATE tipo_ocorrencias_defesa_civil SET  tipo = ?, descricao = ? WHERE id = ?";
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
            conexao.desconectar();
        }
    }

    public static int retornarQuantidadeRegistros() {
        String sql = "SELECT COUNT (id) AS quantidade FROM tipo_ocorrencias_defesa_civil";
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

    public static ArrayList<BaseTipoOcorrencia> buscarOcorrenciaDefesaCivil() {
        ArrayList<BaseTipoOcorrencia> ocorrenciaDefesaCivil = new ArrayList<>();
        String sql = "SELECT id, tipo, descricao FROM tipo_ocorrencias_defesa_civil";

        Conexao conexao = new Conexao();
        try {
            Statement ps = conexao.conectar().createStatement();
            ps.execute(sql);
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                BaseTipoOcorrencia ocorrencia = new BaseTipoOcorrencia();
                ocorrencia.setId(rs.getInt("id"));
                ocorrencia.setTipo(rs.getString("tipo"));
                ocorrencia.setDescricao(rs.getString("descricao"));
                ocorrenciaDefesaCivil.add(ocorrencia);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return ocorrenciaDefesaCivil;
    }

    public static BaseTipoOcorrencia buscarDefesaCivilPorId(int codigo) {
        BaseTipoOcorrencia defesaCivil = null;
        String sql = "SELECT tipo, descricao FROM tipo_ocorrencias_defesa_civil WHERE id = ?";

        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                defesaCivil = new BaseTipoOcorrencia();
                defesaCivil.setId(codigo);
                defesaCivil.setTipo(rs.getString("tipo"));
                defesaCivil.setDescricao(rs.getString("descricao"));


            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexao.desconectar();
        }
        return defesaCivil;
    }

}
