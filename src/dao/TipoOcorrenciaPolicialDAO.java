package dao;

import com.mysql.jdbc.Statement;
import database.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.TipoOcorrenciaPolicial;

/**
 *
 * @author Wanderson Ferreira 30/08/2017
 */
public class TipoOcorrenciaPolicialDAO {

    public static int inserir(TipoOcorrenciaPolicial tipoOcorrenciaPolicial) {
        String sql = "INSERT INTO tipo_ocorrencias_policiais (tipo, descricao) VALUES (?,?);";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, tipoOcorrenciaPolicial.getTipo());
            ps.setString(2, tipoOcorrenciaPolicial.getDescricao());

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

    public static int alterar(TipoOcorrenciaPolicial ocorrenciaPolicial) {
        Conexao conexao = new Conexao();
        try {
            String sql = "UPDATE tipo_ocorrencias_policiais SET tipo = ?,"
                    + "descricao = ?"
                    + "WHERE id = ?";

            PreparedStatement ps = conexao.conectar().prepareStatement(sql);

            ps.setString(1, ocorrenciaPolicial.getTipo());
            ps.setString(2, ocorrenciaPolicial.getDescricao());
            ps.setInt(3, ocorrenciaPolicial.getId());
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

    public static TipoOcorrenciaPolicial buscarOPPorID(int codigo) {
        TipoOcorrenciaPolicial tipoOcorrenciaPolicial = null;
        String sql = "SELECT tipo, descricao FROM tipo_ocorrencias_policiais WHERE id = ?";
        Conexao conexao = new Conexao();
        try {
            PreparedStatement ps = conexao.conectar().prepareCall(sql);
            ps.setInt(1, codigo);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                tipoOcorrenciaPolicial = new TipoOcorrenciaPolicial();
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
}